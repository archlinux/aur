# Maintainer: Clarence <xjh.azzbcc@gmail.com>
_pkgname=spandsp
pkgname=(${_pkgname}-fs ${_pkgname}-docs)
pkgver=3.0.0
pkgrel=1
pkgdesc="A DSP library for telephony (FreeSWITCH version)"
arch=('x86_64')
url="https://github.com/freeswitch/spandsp"
license=('LGPL' 'GPL')
makedepends=('gawk' 'sox' 'fftw' 'doxygen')
source=("git+https://github.com/freeswitch/$_pkgname")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  awk '/^Version:/ { print $2 }' spandsp.spec
}

build() {
  cd "$_pkgname"
  ./autogen.sh
  ./configure --prefix=/usr --enable-tests --enable-doc
  make -C src
}

check() {
  cd "$_pkgname"
  make check
}

package_spandsp-fs() {
  depends=('libtiff')
  optdepends=('spandsp-docs: Documentation')
  provides=('spandsp')
  conflicts=('spandsp')

  cd "$_pkgname"
  make DESTDIR="$pkgdir" -C src install
  make DESTDIR="$pkgdir" install-pkgconfigDATA
}

package_spandsp-docs() {
  pkgdesc="A DSP library for telephony documentation (FreeSWITCH version)"

  cd "$_pkgname"
  make -C doc

  install -dm755 "${pkgdir}/usr/share/doc/$_pkgname/html"
  cp -r "doc/api/html" "${pkgdir}/usr/share/doc/$_pkgname/html/api"
  cp -r "doc/t38_manual" "${pkgdir}/usr/share/doc/$_pkgname/html/t38_manual"
}
