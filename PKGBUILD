# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=lmdb-git
pkgver=0.9.30.r22965.g6b77544ab
pkgrel=2
pkgdesc="Extraordinarily fast, memory-efficient database"
arch=('i686' 'x86_64')
url="https://symas.com/lmdb/"
license=('custom')
depends=('glibc')
makedepends=('git')
provides=("lmdb=$pkgver")
conflicts=('lmdb')
options=('staticlibs')
source=("git+https://git.openldap.org/openldap/openldap.git"
        "lmdb.pc::https://gitlab.archlinux.org/archlinux/packaging/packages/lmdb/-/raw/main/lmdb.pc")
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
