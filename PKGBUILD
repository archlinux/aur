# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=applecommander
_pkgname=AppleCommander
pkgver=14.0
pkgrel=1
pkgdesc="Tool that manipulates Apple ][ disk images"
arch=(any)
url="https://applecommander.github.io/"
license=(GPL-2.0-only)
depends=("archlinux-java-run>=7" "bash" "java-runtime>=25")
optdepends=('gtk3: Graphical User Interface')
makedepends=("java-environment>=25")
source=(https://github.com/${_pkgname}/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz
        applecommander-ac.sh
        applecommander-acx.sh
        applecommander-gui.sh)
sha256sums=('cf8308392186a97d14bb806b22405a3ea9b52e914ff18a37ecc6c3d284062d27'
            'd2b16ef82d1770ad40f44cbf8575175e807c57e2fb067963d8bf480abab1c7a6'
            '991fe8cbf8e0c89b70fde82f155cc7d24e00517c781ca7c4e880ab29c12be6f6'
            '7b69d4653ab05f12bbab9c6816243a910125b61db1428c13d3e843da909800f6')

build() {
  cd "${_pkgname}-${pkgver}"

  mkdir -p "${srcdir}"/gradle
  export GRADLE_USER_HOME=${srcdir}/gradle

  export JAVA_HOME=$(archlinux-java-run -a 25 -f jdk -j)
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
