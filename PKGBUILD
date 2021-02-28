# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=lmdb-git
pkgver=0.9.28.r22254.ga44706f64
pkgrel=2
pkgdesc="Extraordinarily fast, memory-efficient database"
arch=('i686' 'x86_64')
url="https://symas.com/lmdb/"
license=('custom')
depends=('glibc')
makedepends=('git')
provides=('lmdb')
conflicts=('lmdb')
options=('staticlibs')
source=("git+https://git.openldap.org/openldap/openldap.git"
        "https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/lmdb/trunk/lmdb.pc")
sha256sums=('SKIP'
            'SKIP')


pkgver() {
  cd "openldap/libraries/liblmdb"

  git describe --long --tags | sed 's/^LMDB_//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "openldap/libraries/liblmdb"

  make
}

check() {
  cd "openldap/libraries/liblmdb"

  make test
}

package() {
  cd "openldap/libraries/liblmdb"

  make \
    DESTDIR="$pkgdir" \
    prefix="/usr" \
    install

  sed -e "s|@PKGVER@|$pkgver|" -i "$srcdir/lmdb.pc"
  install -Dm644 "$srcdir/lmdb.pc" -t "$pkgdir/usr/lib/pkgconfig"

  install -Dm644 {COPYRIGHT,LICENSE} -t "$pkgdir/usr/share/licenses/lmdb"
}
