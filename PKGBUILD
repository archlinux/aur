# Maintainer: Zach Callear <zach@callear.org>

pkgname=intellij-idea-open-eap

# IDEA uses a version scheme of yyyy.r.n.m, as described in
# https://blog.jetbrains.com/blog/2016/03/09/jetbrains-toolbox-release-and-versioning-changes/ .
# Sometimes it's only yyyy.r or yyyy.r.n .
# In pre-release tags, these are suffixed with text such as
# "-eap-8", "-beta", "-rc-2", or "-preview".
#
# Therefore, in order to ensure Arch vercmp sorting, while
# still including textual tag information, expand upstream
# version to full yyyy.r.n.m format and include build number
# after version and before tag suffix.
_versionyyyy=2026
_versionr=1
_versionn=0
_versionm=0
# Historically, not all tags begin with "idea/" such as "2025.3-rc-2".
_tagprefix=idea/
_tagsuffix=eap-1
# See build number tag having same commit hash as this tag, at
# https://github.com/JetBrains/intellij-community/tags . If there isn't such a
# tag, it can be determined from Help --> About in IDEA from the Snap package
# for the closed-source EAP version
# ("snap install intellij-idea --classic --edge"), which will match that in
# "build.txt", which only contains the first two parts, followed by ".SNAPSHOT".
_build=261.17801.55

pkgver="$_versionyyyy.$_versionr.$_versionn.$_versionm.$_build$([ -n "$_tagsuffix" ] && echo -n ".$_tagsuffix" | tr - _)"
pkgrel=1

_tag="$_tagprefix$_versionyyyy.$_versionr$([ "$_versionn" -ne 0 ] && echo -n ".$_versionn")\
$([ "$_versionm" -ne 0 ] && echo -n ".$_versionm")\
$([ -n "$_tagsuffix" ] && echo -n "-$_tagsuffix")"

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
source=("git+https://github.com/JetBrains/intellij-community.git#tag=$_tag"
  idea-android::"git+https://github.com/JetBrains/android.git#tag=$_tag"
  idea.desktop)
sha256sums=('0e3342ae3e46c60c01aa4f04f38be60851a506716e6c3251f0fb32b8e68443d1'
  '3cc93b643fb7dd504d23ac6e3a12794fb87d70d2175c90fd7e5ba2caa71a940d'
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

  export MAVEN_REPOSITORY=${srcdir}/.m2/repository

  ./installers.cmd -Dintellij.build.use.compiled.classes=false -Dintellij.build.target.os=linux -Dbuild.number="${_build}"
  tar -xf out/idea-ce/artifacts/ideaIC-${_build}.tar.gz -C "${srcdir}"
}

package() {
  cd idea-IC-${_build}

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
