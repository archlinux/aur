# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=applecommander
_pkgname=AppleCommander
pkgver=13.0
pkgrel=1
pkgdesc="Tool that manipulates Apple ][ disk images"
arch=(any)
url="https://applecommander.github.io/"
license=(GPL-2.0-only)
depends=("archlinux-java-run>=7" "bash" "java-runtime>=21")
optdepends=('gtk3: Graphical User Interface')
makedepends=("java-environment>=21" "java-environment<25")
source=(https://github.com/${_pkgname}/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz
        applecommander-ac.sh
        applecommander-acx.sh
        applecommander-gui.sh)
sha256sums=('fd4565f99b0b2f880d780676d99df01c58d38370587777f814b8db1ad9e9ea76'
            '15f72733b20fc738e556d15ca448b5f4db96134af38e50c6853f1884e591a9e2'
            '9bcdc1c58962b85638de83eeb68c3e603ef627210da10bc5ab04e3b83d6c541d'
            'd6ea6feb7790c7992c2753a65b42f4e7da79d70a4efb8a4af019c0f8b27353ba')

build() {
  cd "${_pkgname}-${pkgver}"

  mkdir -p "${srcdir}"/gradle
  export GRADLE_USER_HOME=${srcdir}/gradle

  export JAVA_HOME=$(archlinux-java-run -a 21 -b 24 -f jdk -j)
  echo "Using JDK from $JAVA_HOME to build AppleCommander."

  # /usr/bin/gradle \
  ./gradlew \
    --no-daemon \
    assemble
}

package() {
  # launch scripts
  install -Dm 755 applecommander-ac.sh "$pkgdir"/usr/bin/applecommander-ac
  install -Dm 755 applecommander-acx.sh "$pkgdir"/usr/bin/applecommander-acx
  install -Dm 755 applecommander-gui.sh "$pkgdir"/usr/bin/applecommander-gui

  # jar files
  cd "${_pkgname}-${pkgver}"/app
  install -Dm 644 cli-ac/build/libs/${_pkgname}-ac-${pkgver}.jar "$pkgdir"/usr/share/java/$pkgname/${_pkgname}-ac.jar
  install -Dm 644 cli-acx/build/libs/${_pkgname}-acx-${pkgver}.jar "$pkgdir"/usr/share/java/$pkgname/${_pkgname}-acx.jar
  install -Dm 644 gui-swt-linux-x86_64/build/libs/${_pkgname}-linux-x86_64-${pkgver}.jar "$pkgdir"/usr/share/java/$pkgname/${_pkgname}-gtk.jar
}
