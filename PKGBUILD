# Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>

_pkgname=apfsprogs
pkgname=$_pkgname-git
pkgver=r345.5efac5a
pkgrel=1
pkgdesc='Experimental APFS tools for linux'
arch=(x86_64)
license=(GPL2)
url='https://github.com/eafer/apfsprogs'
depends=('glibc')
makedepends=('git')
conflicts=("$_pkgname")
provides=("$_pkgname=$pkgver")
source=('git+https://github.com/eafer/apfsprogs'
        'destdir.patch')
sha256sums=('SKIP'
            '65c7af8a2538536bcf9e62b152893849b2cd1092040f5bc6ec2a33040027f8ac')

_progs=(apfsck mkapfs)

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_pkgname
  patch -Np1 -i ../destdir.patch
}

build() {
  cd $_pkgname

  make -C lib
  for prog in "${_progs[@]}" ; do
    make -C $prog
  done
}

package() {
  cd $_pkgname

  for prog in "${_progs[@]}" ; do
    make -C $prog install DESTDIR="$pkgdir" BINDIR=/usr/bin MANDIR=/usr/share/man/man8
  done
}
