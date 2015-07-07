# Maintainer: X0rg
# Contributor: eloaders <eloaders at linux dot pl>

pkgname=libcpuid-git
_pkgname=libcpuid
pkgver=0.2.1.r128.b183a2d
pkgrel=1
pkgdesc="Provides CPU identification for x86 (and x86_64)."
arch=('i686' 'x86_64')
url="https://github.com/anrieff/libcpuid"
license=('BSD-2-Clause')
makedepends=('git')
depends=('glibc')
conflicts=('libcpuid')
provides=('libcpuid')
source=("git://github.com/anrieff/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  local v_ver=$(awk -F , '/^AC_INIT/ {gsub(/[\[\] -]/, ""); print $2}' configure.ac)
  printf "$v_ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}"/${_pkgname}
  libtoolize
  autoreconf --install
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/${_pkgname}

  make install DESTDIR="${pkgdir}"
  rm "${pkgdir}"/usr/lib/*.la
}
