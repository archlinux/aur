pkgname=p2pvpn
pkgver=0.11.2
pkgrel=1
pkgdesc="Server-less Virtual Private Network"
arch=('i686' 'x86_64')
url="https://gitlab.com/Monsterovich/p2pvpn"
license=('GPL3')
depends=('java-runtime')
makedepends=('java-environment-common' 'ant')
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/Monsterovich/p2pvpn/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('7c964099f0e15c6e710aa69cbeee020b2cec6fae7788ac9d8b4bd4250cb6d491')

build() {
    cd ${pkgname}-${pkgver}
    mkdir -p clib
    cd native/tapLinux/

    sed -e 's|java-11-openjdk-amd64|java-21-openjdk|g' -i nbproject/Makefile-Release-amd64.mk
    make DEFAULTCONF=Release-amd64
    cp dist/Release/* "${srcdir}/${pkgname}-${pkgver}/clib/"

    cd "${srcdir}/${pkgname}-${pkgver}"
    sed -e 's|target="1.7"|target="1.8"|g' -i build.xml
    ant
}

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/share/java"
  install -m644 "$srcdir/${pkgname}-${pkgver}/build/P2PVPN.jar"		"$pkgdir/usr/share/java/P2PVPN.jar"
}


