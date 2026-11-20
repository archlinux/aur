# Maintainer: Zach Callear <zach@callear.org>

pkgname=intellij-idea-open-eap

# IDEA uses a version scheme of yyyy.r.n.m, as described in
# https://blog.jetbrains.com/blog/2016/03/09/jetbrains-toolbox-release-and-versioning-changes/ . Sometimes it's only
# yyyy.r or yyyy.r.n . In pre-release tags, these are suffixed with text such as "-eap-8", "-beta", "-rc-2", or
# "-preview". Therefore, in order to ensure Arch vercmp sorting, while still including all version information, expand
# upstream version to full yyyy.r.n.m format and include build number after version and before tag suffix.
_version_yyyy_r_n_m=2026.3.1.0
# Sources of build number, in preference order (as they're not consistently available):
#   1. matching-hash build number tag at https://github.com/JetBrains/intellij-community/tags
#   2. https://youtrack.jetbrains.com/articles/IDEA-A-21/IDEA-Latest-Builds-And-Release-Notes
#   3. installing closed-source build via "snap install intellij-idea --classic --edge" and checking Help --> About
_build_number=263.8311.30
# like "eap_5", "rc", etc.
_pre_release_identifier_snake_case=preview
pkgver="$_version_yyyy_r_n_m.$_build_number${_pre_release_identifier_snake_case:+.$_pre_release_identifier_snake_case}"
pkgrel=2

_tag=idea/2026.3.1-preview
# Override Git hash if needed, for when they change a tag's hash and build number after pushing, as with
# the "idea/2026.2.1" tag.
_git_hash_override_idea=
_git_hash_override_android=

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
backup=('usr/share/idea/bin/idea64.vmoptions')
provides=('intellij-idea-oss' 'intellij-idea-community-edition')
conflicts=('intellij-idea-oss' 'intellij-idea-community-edition')

# This package needs no JDK or JVM to run or build: it includes the JetBrains Runtime (JBR),
# and the build process sets up its own Java environment.

depends=('giflib' 'python' 'sh' 'ttf-font' 'fontconfig' 'hicolor-icon-theme')
makedepends=('git' 'procps-ng')

optdepends=(
  'lldb: lldb frontend integration'
)
source=("git+https://github.com/JetBrains/intellij-community.git#$_github_source_fragment_idea"
  idea-android::"git+https://github.com/JetBrains/android.git#$_github_source_fragment_android"
  idea.desktop)
sha256sums=('eb59cd40f32007fee87d4ff1ee9f62d3a5cd58424a5745acde9af5b5fc467476'
  'a0eba0d8b61c4c36884dc3ede27edc2f5dd5126d633009fdfeacbef0b2d1d47c'
  '077937dc8653ceb1a2bb20d0e2f1bca4046eba52d792b8d5fb2bf84e01ed5dc9')

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
    -Dintellij.build.target.arch=x64 \
    -Dbuild.number="${_build_number}"
  tar -xf out/idea-ce/artifacts/ideaIC-${_build_number}.tar.gz -C "${srcdir}"
}

package() {
  cd idea-oss

  install -dm 755 "${pkgdir}"/usr/share/{licenses,idea,icons/hicolor/{128x128,scalable}/apps}
  cp -dr --no-preserve='ownership' bin lib plugins jbr "${pkgdir}"/usr/share/idea/
  cp -dr --no-preserve='ownership' license "${pkgdir}"/usr/share/licenses/idea
  ln -s /usr/share/idea/bin/idea.png "${pkgdir}"/usr/share/icons/hicolor/128x128/apps/
  ln -s /usr/share/idea/bin/idea.svg "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/
  install -Dm 644 ../idea.desktop -t "${pkgdir}"/usr/share/applications/
  install -dm 755 "${pkgdir}"/usr/bin
  ln -s /usr/share/idea/bin/idea "${pkgdir}"/usr/bin/idea
  install -Dm 644 build.txt -t "${pkgdir}"/usr/share/idea
  install -Dm 644 product-info.json -t "${pkgdir}"/usr/share/idea
}

# vim: ts=2 sw=2 et:
