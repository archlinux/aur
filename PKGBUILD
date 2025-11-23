# Maintainer: Zach Callear <zach@callear.org>

pkgname=intellij-idea-open-eap
_versionbase=2025.3
_tagsuffix=beta
_tag="idea/${_versionbase}-${_tagsuffix}"
# Uncomment to print proper $_build value after updating values above:
# curl "https://raw.githubusercontent.com/JetBrains/intellij-community/refs/tags/$_tag/build.txt"
_build=253.28294.SNAPSHOT
# Build number is before tag suffix for alphabetical version order.
pkgver="$_versionbase.$_build.$(echo -n $_tagsuffix | tr - .)"
_jdkver=25
pkgrel=1
pkgdesc='IDE for Java, Groovy and other programming languages with advanced refactoring features, open-source, Early Access Program (EAP) version'
url='https://www.jetbrains.com/idea/'
arch=('x86_64')
license=('Apache-2.0')
provides=('intellij-idea-community-edition')
conflicts=('intellij-idea-community-edition')
backup=('usr/share/idea/bin/idea64.vmoptions')
depends=('giflib' 'python' 'sh' 'ttf-font' 'libdbusmenu-glib' 'fontconfig' 'hicolor-icon-theme')
makedepends=('git' "java-environment-openjdk=${_jdkver}")
optdepends=(
  'lldb: lldb frontend integration'
)
source=("git+https://github.com/JetBrains/intellij-community.git#tag=$_tag"
  idea-android::"git+https://github.com/JetBrains/android.git#tag=$_tag"
  idea.desktop
  idea.sh)
sha256sums=('e87aac984bdd963551827c70457f55c3b56ffacc03d5edc6fc71d64e9394e6a6'
            '04b308ef3b22d637822147b50ab26222930779f45f5fc70b7eac513d09d8da6f'
            '9dd68cba50136455153a765c3442e12d21f1a0a5ad3597b2fd5fd1e5ceed372e'
            'b7fc5d44d81702d36a0bf50e0e1050a5d1000907aadf7634df541f289659c2ce')

prepare() {
  cd intellij-community

  # build system doesn't like symlinks
  mv "${srcdir}"/idea-android android
}

build() {
  cd intellij-community

  export JAVA_HOME="/usr/lib/jvm/java-${_jdkver}-openjdk"
  export PATH="/usr/lib/jvm/java-${_jdkver}-openjdk/bin:$PATH"
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
  install -Dm 755 ../idea.sh "${pkgdir}"/usr/bin/idea
  install -Dm 644 build.txt -t "${pkgdir}"/usr/share/idea
  install -Dm 644 product-info.json -t "${pkgdir}"/usr/share/idea
}

# vim: ts=2 sw=2 et:
