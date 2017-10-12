# Maintainer:  Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Severen Redwood <severen@shrike.me
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Matthias Blaicher <matthias@blaicher.com>

_pkgname=capnproto
_gtest_ver="1.8.0"
pkgname="${_pkgname}-git"
pkgver=0.7.r2236.365de898
pkgrel=1
pkgdesc="Cap'n Proto serialization/RPC system (git version)"
arch=('i686' 'x86_64')
url="http://kentonv.github.io/capnproto/"
license=('MIT')
makedepends=('git')
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver/.r*/}")
source=("${_pkgname}::git+https://github.com/kentonv/${_pkgname}.git"
        "https://github.com/google/googletest/archive/release-${_gtest_ver}.tar.gz")
md5sums=('SKIP'
         '16877098823401d1bf2ed7891d7dce36')

pkgver() {
  cd "${srcdir}/${_pkgname}/c++"
  local ver="$(grep '^set(VERSION' CMakeLists.txt | sed -e 's/set(VERSION \([0-9]\+\.[0-9]\+.*\))/\1/')"
  echo ${ver/-dev/}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd "${srcdir}/${_pkgname}/c++"
  ln -sf "${srcdir}/googletest-release-${_gtest_ver}"
}

build() {
  cd "${srcdir}/${_pkgname}/c++"
  autoreconf -i
  ./configure --prefix=/usr
  make
}

check() {
  cd "${srcdir}/${_pkgname}/c++"
  make check
}

package() {
  cd "${srcdir}/${_pkgname}/c++"
  make DESTDIR="$pkgdir" install

  install -D -m644 "../LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
