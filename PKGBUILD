# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: max.bra <max dot bra at alice dot it>
# Contributor: Rorschach <r0schach@lavabit.com>

pkgname=ipscan-git
pkgver=3.9.1.r0.g42253321
pkgrel=3
pkgdesc='Angry IP Scanner (or simply ipscan) is an open-source and cross-platform network scanner designed to be fast and simple to use. It scans IP addresses and ports as well as has many other features.'
arch=(any)
license=(GPL2)
url="https://angryip.org/"
_java=17
depends=(java-runtime jdk${_java}-openjdk)
makedepends=(git gradle dpkg rpm-tools)
provides=(ipscan)
conflicts=(ipscan)
source=("git+https://github.com/angryip/ipscan.git"
        ipscan.sh)
sha256sums=('SKIP'
            '8acc44bd1fbeb7d11e979a0933de07c4a63dcb3ce6a0a1679c610ca2e6358393')

pkgver() {
  cd ipscan
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ipscan
  export JAVA_HOME="/usr/lib/jvm/java-${_java}-openjdk"
  gradle -Dorg.gradle.daemon=false --warning-mode all --stacktrace linux64
  #./gradlew -Dorg.gradle.daemon=false --warning-mode all --stacktrace linux64
}

package() {
  cd ipscan
  install -Dm755 build/libs/ipscan-linux64-*.jar "${pkgdir}"/usr/share/java/ipscan/ipscan.jar
  install -Dm755 ../ipscan.sh "${pkgdir}"/usr/bin/ipscan

  install -Dm755 ext/deb-bundle/usr/share/applications/ipscan.desktop -t "${pkgdir}"/usr/share/applications/
  install -Dm755 ext/deb-bundle/usr/share/metainfo/ipscan.appdata.xml -t "${pkgdir}"/usr/share/metainfo/
  install -Dm644 resources/images/icon.png "${pkgdir}"/usr/share/pixmaps/ipscan.png
}
