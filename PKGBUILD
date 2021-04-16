# Maintainer: dreieck

_pkgname="terrafs"
pkgname="${_pkgname}-git"
pkgdesc="A fuse base file system for FlightGear scenery."
url="https://sourceforge.net/p/flightgear/terrafs/ci/master/tree/"
license=("GPL2")
epoch=0
pkgver=r3.20180714.fd20891
pkgrel=1
arch=(
  'i686'
  'x86_64'
)
depends=(
  'curl'
  'fuse'
)
makedepends=(
  'git'
)
provides=(
  "${_pkgname}=${pkgver}"
  "${_pkgname}-fuse=${pkgver}"
  "${_pkgname}-fuse-git=${pkgver}"
  "flightgear-${_pkgname}=${pkgver}"
  "flightgear-${_pkgname}-fuse=${pkgver}"
  "flightgear-${_pkgname}-git=${pkgver}"
  "flightgear-${_pkgname}-fuse-git=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "${_pkgname}-fuse"
  "${_pkgname}-fuse-git"
  "flightgear-${_pkgname}"
  "flightgear-${_pkgname}-fuse"
  "flightgear-${_pkgname}-git"
  "flightgear-${_pkgname}-fuse-git"
)
optdepends=(
  "flightgear: To make use of the scenery in flight simulator."
)

source=(
  "flightgear-${_pkgname}::git+https://git.code.sf.net/p/flightgear/${_pkgname}"
)

sha256sums=(
  'SKIP'
)

pkgver() {
  cd "${srcdir}/flightgear-${_pkgname}"
  _rev="$(git rev-list HEAD --count)"
  _date="$(git log -1 --format=%cd --date=format:%Y%m%d)"
  _hash="$(git rev-parse --short HEAD)"
  printf '%s' "r${_rev}.${_date}.${_hash}"
}

build() {
  cd "${srcdir}/flightgear-${_pkgname}"
  printf '%s\n' "${url}" > "upstream.url"
  cd src
  g++ -std=c++0x $(pkg-config --cflags libcurl fuse) -c terrafs.cpp
  g++ $(pkg-config --libs libcurl fuse) -o terrafs terrafs.o
}

package() {
  cd "${srcdir}/flightgear-${_pkgname}"
  install -D -m755 -v src/terrafs "${pkgdir}/usr/bin/terrafs"
  install -D -m644 -v README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -D -m644 -v upstream.url "${pkgdir}/usr/share/doc/${_pkgname}/upstream.url"
}
