# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: David Runge <dvzrv@archlinux.org>

_pkgname=liquidsfz
pkgname="${_pkgname}-git"
pkgver=0.2.1.r229.94c0e4b
pkgrel=1
pkgdesc="SFZ Sampler (git version)"
arch=('x86_64')
url="https://github.com/swesterfeld/liquidsfz"
license=('LGPL2.1')
groups=('lv2-plugins' 'pro-audio')
depends=('glibc' 'libsndfile.so')
makedepends=('lv2' 'libjack.so')
checkdepends=('lv2lint')
optdepends=('libjack.so: for standalone application')
provides=('soundfont-synthesizer' "${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/swesterfeld/${_pkgname}.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  local ver=`grep ^AC_INIT configure.ac | sed -E 's/[^0-9]*([0-9]+\.[0-9]+\.[0-9]+).*/\1/'`
  echo "$ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  ./autogen.sh --prefix=/usr
  make
}

check() {
  cd "${srcdir}/${_pkgname}"
  make -k check
  LV2_PATH="${PWD}" lv2lint "http://spectmorph.org/plugins/liquidsfz"
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="$pkgdir/" install
  install -vDm 644 {NEWS,TODO,{OPCODES,README}.md} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
