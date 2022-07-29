# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=applecommander
_pkgname=AppleCommander
pkgver=1.8.0
pkgrel=1
pkgdesc="Tool that manipulates Apple ][ disk images"
arch=(x86_64)
url="https://applecommander.github.io/"
license=('GPL2')
depends=("archlinux-java-run>=7" bash "java-runtime>=11")
optdepends=('gtk3: Graphical User Interface')
makedepends=(gradle "java-environment>=11")
source=(https://github.com/${_pkgname}/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz
        applecommander-ac.sh
        applecommander-acx.sh
        applecommander-gui.sh)
sha256sums=('66def97b3f6c3b6caf1e4a30580f81b2d44ec78781542a4c170b4cecf0e187e6'
            'd7b1ddd2d4bf0eb5a1fd595352cd36b645f1342e1da427a01579bef779b29714'
            '35bfb9831c1f0411a2ea60b7f33c671dda4accbb413ac94ae8320450d9325a42'
            '034f41f16c0200e398c3a019359c6c30978eb857fec4e5eb97948f962e79e0dc')

build() {
  cd "${_pkgname}-${pkgver}"

  mkdir -p "${srcdir}"/gradle
  export GRADLE_USER_HOME=${srcdir}/gradle

  export JAVA_HOME=$(archlinux-java-run -a 11 -f jdk -j)
  echo "Using JDK from $JAVA_HOME to build AppleCommander."

  # ./gradlew \
  /usr/bin/gradle \
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
