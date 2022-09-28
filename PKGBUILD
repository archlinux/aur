# Maintainer: Laura Demkowicz-Duffy <laura@demkowiczduffy.co.uk>
pkgname=openrocket-git
_pkgname=openrocket
pkgver=r4192.f2aed8a74
pkgrel=1
pkgdesc="A free and fully featured rocket flight simulator - 6 degrees of freedom"
arch=('any')
url=https://github.com/openrocket/openrocket
license=('GPL3')
depends=('java-environment=11' 'desktop-file-utils')
makedepends=('git' 'ant')
provides=('openrocket')
conflicts=('openrocket')
source=("git+https://github.com/$_pkgname/$_pkgname.git#branch=unstable"
        "git+https://github.com/dbcook/openrocket-database.git"
	"$_pkgname.sh"
        "de_debian.tar.gz")
noextract=("$_pkgname.sh")
sha256sums=('SKIP'
            'SKIP'
            '74ab605cb11161784d4af96d018eb88adf7a2e4a8b1088a64b94b1e8ec5e18d1'
            '62c4e739f82fa53fdae8a41f12bfb2828b77df89c8f48b1a790192a8e773cb98')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_pkgname
  git submodule init
  git config submodule.swing/resources-src/datafiles/components.url "$srcdir/openrocket-database"
  git submodule update
}

build() {
  cd $_pkgname
  ant -noinput -buildfile ./build.xml jar
}

check() {
  cd $_pkgname
  ant -noinput -buildfile ./build.xml check unittest
}

package() {
  install -Dm644 $_pkgname/swing/build/jar/OpenRocket.jar $pkgdir/usr/share/java/$_pkgname/$_pkgname.jar
  install -Dm755 $srcdir/$_pkgname.sh $pkgdir/usr/bin/$_pkgname

  install -Dm644 de_debian/$_pkgname.1 $pkgdir/usr/share/man/man1/$_pkgname.1
  find "$pkgdir/usr/share/man/man1" -name *.1 -exec gzip -9 {} +

  install -Dm644 de_debian/$_pkgname.desktop $pkgdir/usr/share/applications/$_pkgname.desktop
  install -Dm644 de_debian/$_pkgname.xpm $pkgdir/usr/share/pixmaps/$_pkgname.xpm
}
