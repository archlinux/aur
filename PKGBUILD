# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=applecommander
_pkgname=AppleCommander
pkgver=1.9.0
pkgrel=1
pkgdesc="Tool that manipulates Apple ][ disk images"
arch=(any)
url="https://applecommander.github.io/"
license=(GPL-2.0-only)
depends=("archlinux-java-run>=7" bash "java-runtime>=11")
optdepends=('gtk3: Graphical User Interface')
makedepends=(gradle "java-environment>=11")
source=(https://github.com/${_pkgname}/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz
        applecommander-ac.sh
        applecommander-acx.sh
        applecommander-gui.sh
        0001-Update-to-Gradle-8.1.1.patch)
sha256sums=('9047e79af4de04f65e958ee6db46ca6134ae29a30857525214a15f68362a0640'
            'd7b1ddd2d4bf0eb5a1fd595352cd36b645f1342e1da427a01579bef779b29714'
            '35bfb9831c1f0411a2ea60b7f33c671dda4accbb413ac94ae8320450d9325a42'
            '034f41f16c0200e398c3a019359c6c30978eb857fec4e5eb97948f962e79e0dc'
            '4d1aa733d4a3fc06e19b36cbd2b22ee6180218fbeb0ec357a7f13bc2318542f2')

prepare() {
  cd "${_pkgname}-${pkgver}"

  # https://github.com/AppleCommander/AppleCommander/pull/105
  patch -p1 < "$srcdir"/0001-Update-to-Gradle-8.1.1.patch
}

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
