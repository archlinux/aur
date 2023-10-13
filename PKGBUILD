_pkgname=p2pvpn
pkgname=p2pvpn-git
pkgver=r134.34b8103
pkgrel=1
pkgdesc="Server-less Virtual Private Network. Git-version"
arch=('i686' 'x86_64')
url="https://gitlab.com/Monsterovich/p2pvpn"
license=('GPL3')
depends=('java-runtime')
makedepends=('java-environment-common' 'ant')
source=("git+https://gitlab.com/Monsterovich/p2pvpn.git")
sha256sums=('SKIP')

pkgver() {
	cd ${_pkgname}
    	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd ${_pkgname}
    mkdir -p clib
    cd native/tapLinux/

    sed -e 's|java-11-openjdk-amd64|java-21-openjdk|g' -i nbproject/Makefile-Release-amd64.mk
    make DEFAULTCONF=Release-amd64
    cp dist/Release/* "${srcdir}/${_pkgname}/clib/"

    cd "${srcdir}/${_pkgname}"
    sed -e 's|target="1.7"|target="1.8"|g' -i build.xml
    ant
}

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/share/java"
  install -m644 "$srcdir/${_pkgname}/build/P2PVPN.jar"		"$pkgdir/usr/share/java/P2PVPN.jar"
}


