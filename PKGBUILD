# Maintainer: Laura Demkowicz-Duffy <laura@demkowiczduffy.co.uk>
pkgname=openrocket-git
_pkgname=openrocket
pkgver=r6339.e84145ef9
_pkgver=23.09
pkgrel=1
pkgdesc="A free and fully featured rocket flight simulator - 6 degrees of freedom"
arch=('x86_64')
url=https://github.com/openrocket/openrocket
license=('GPL-3.0-or-later')
depends=('java-environment=17' 'bash')
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
  git -c protocol.file.allow=always submodule update
}

build() {
  cd $_pkgname
  # gradle can't fetch dependencies as a task, so unfortunately it has to be rolled into this step
  # hence no --offline flag
  ./gradlew --no-daemon dist
}

check() {
  cd $_pkgname
  # no --offline flag, see above
  ./gradlew --no-daemon check
  ./gradlew --no-daemon test
  ./gradlew --no-daemon :core:test
  ./gradlew --no-daemon :swing:test
}

package() {
  install -Dm644 \
    $_pkgname/build/libs/OpenRocket-${_pkgver}.SNAPSHOT.jar \
    $pkgdir/usr/share/java/$_pkgname/$_pkgname.jar
  install -Dm755 $srcdir/$_pkgname.sh $pkgdir/usr/bin/$_pkgname

  install -Dm644 de_debian/$_pkgname.desktop $pkgdir/usr/share/applications/$_pkgname.desktop
  install -Dm644 de_debian/$_pkgname.xpm $pkgdir/usr/share/pixmaps/$_pkgname.xpm
}
