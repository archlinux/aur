# Maintainer: Zach Callear <zach@callear.org>

pkgname=intellij-idea-open-eap

# IDEA uses a version scheme of yyyy.r.n.m, as described in
# https://blog.jetbrains.com/blog/2016/03/09/jetbrains-toolbox-release-and-versioning-changes/ . Sometimes it's only
# yyyy.r or yyyy.r.n . In pre-release tags, these are suffixed with text such as "-eap-8", "-beta", "-rc-2", or
# "-preview". Therefore, in order to ensure Arch vercmp sorting, while still including all version information, expand
# upstream version to full yyyy.r.n.m format and include build number after version and before tag suffix.
_version_yyyy_r_n_m=2026.2.1.0
# Sources of build number, in preference order (as they're not consistently available):
#   1. matching-hash build number tag at https://github.com/JetBrains/intellij-community/tags
#   2. https://youtrack.jetbrains.com/articles/IDEA-A-21/IDEA-Latest-Builds-And-Release-Notes
#   3. installing closed-source build via "snap install intellij-idea --classic --edge" and checking Help --> About
_build_number=262.9437.22
_pre_release_identifier_snake_case=preview
pkgver="$_version_yyyy_r_n_m.$_build_number${_pre_release_identifier_snake_case:+.$_pre_release_identifier_snake_case}"
pkgrel=1

_tag=
# On 2026-07-23, the "idea/2026.2.1" tag pointed to hash "15645ead6f20019cc2537dbbd43df4eb344423a8". Then it was changed
# to point to "febef8303a0fc547de1c50ac82782933dcfae5ae", with a different version and different build number.
_git_hash_override_idea=febef8303a0fc547de1c50ac82782933dcfae5ae
_git_hash_override_android=132bc7c3cf52598117590637d00e81b929444bde

if [ -n "$_git_hash_override_idea" ]; then
  _github_source_fragment_idea="commit=$_git_hash_override_idea"
  _github_source_fragment_android="commit=$_git_hash_override_android"
else
  _github_source_fragment_idea="tag=$_tag"
  _github_source_fragment_android="tag=$_tag"
fi

pkgdesc='IDE for Java, Groovy and other programming languages with advanced refactoring features. Open-source, latest-tag (usually EAP) version'
url='https://www.jetbrains.com/idea/'
arch=('x86_64')
license=('Apache-2.0')
provides=('intellij-idea-community-edition')
conflicts=('intellij-idea-community-edition')
backup=('usr/share/idea/bin/idea64.vmoptions')
# There is no JDK/JVM dependency because this package's output includes the JetBrains Runtime (JBR),
# and the build process bootstraps its own Java environment.
makedepends=('git')
depends=('giflib' 'python' 'sh' 'ttf-font' 'libdbusmenu-glib' 'fontconfig' 'hicolor-icon-theme')
optdepends=(
  'lldb: lldb frontend integration'
)
source=("git+https://github.com/JetBrains/intellij-community.git#$_github_source_fragment_idea"
  idea-android::"git+https://github.com/JetBrains/android.git#$_github_source_fragment_android"
  idea.desktop)
sha256sums=('2a70afa449da786023bc8c7416d28f493d76dc4389081ede1cad3a619c2fa9b0'
  'b5f2a1111283baf0a46658f92ddd468ef6e792455db294efdd0343b3db75ad48'
  '7e653ec3049058e2dcd7ca262081164ba417ea664885af7b5e4f94bcc987038f')

prepare() {
  cd intellij-community

  # build system doesn't like symlinks
  mv "${srcdir}"/idea-android android
}

build() {
  cd intellij-community

  # Unsetting this is not necessary in a clean chroot build, but the build fails
  # with it set (or at least set to certain values) in 2026.x, as it overrides
  # the build process using its own Java environment.
  unset JAVA_HOME

  # Store Bazel-related caches locally to avoid occasional NoSuchFileException
  # involving "bazel-targets.json" when the user-wide Bazel caches are
  # corrupted.
  export HOME=${srcdir}
  export BAZELISK_HOME=${srcdir}/.bazelisk

  # Note: The Maven cache path, ".m2/repository", is not overridden here, as
  # with Bazel, the build does not actually use it.

  ./installers.cmd \
    -Dintellij.build.use.compiled.classes=false \
    -Dintellij.build.target.os=linux \
    -Dbuild.number="${_build_number}"
  tar -xf out/idea-ce/artifacts/ideaIC-${_build_number}.tar.gz -C "${srcdir}"
}

package() {
  cd idea-oss

  install -dm 755 "${pkgdir}"/usr/share/{licenses,pixmaps,idea,icons/hicolor/scalable/apps}
  cp -dr --no-preserve='ownership' bin lib plugins jbr "${pkgdir}"/usr/share/idea/
  cp -dr --no-preserve='ownership' license "${pkgdir}"/usr/share/licenses/idea
  ln -s /usr/share/idea/bin/idea.png "${pkgdir}"/usr/share/pixmaps/
  ln -s /usr/share/idea/bin/idea.svg "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/
  install -Dm 644 ../idea.desktop -t "${pkgdir}"/usr/share/applications/
  mkdir "${pkgdir}"/usr/bin
  ln -s /usr/share/idea/bin/idea "${pkgdir}"/usr/bin/idea
  install -Dm 644 build.txt -t "${pkgdir}"/usr/share/idea
  install -Dm 644 product-info.json -t "${pkgdir}"/usr/share/idea
}

# vim: ts=2 sw=2 et:
