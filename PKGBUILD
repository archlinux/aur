# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Adrian Bacircea <adrian.bacircea@gmail.com>

pkgname=lib32-libbpf
pkgver=1.8.0
pkgrel=1
pkgdesc='Library for loading eBPF programs and reading and manipulating eBPF objects from user-space'
url='https://github.com/libbpf/libbpf'
arch=(x86_64)
license=('LGPL-2.1-only OR BSD-2-Clause')
depends=(
  glibc
  libelf
  zlib
)
depends=("${depends[@]/#/lib32-}")
depends+=("libbpf>=${pkgver}")
makedepends=(
  git
)
provides=(
  libbpf.so
)
source=(
  "git+${url}#tag=v${pkgver}"
)
sha512sums=('b5494a4e2637b9fd5210f05a733d2d0ac983f123a6e6c7c286f6e003db109b7b3c582920898bd8616756825ae0df040211a870347f4410e839cd8dc9306f61c5')

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG=i686-pc-linux-gnu-pkg-config

  cd libbpf
  make -C src
}

package() {
  cd libbpf
  make -C src DESTDIR="${pkgdir}" LIBSUBDIR=lib32 install
  rm -r "${pkgdir}/usr/include"
  install -Dm 644 LICENSE.BSD-2-Clause -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set sw=2 sts=-1 et:
