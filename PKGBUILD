# Maintainer: Aleksej Kovura <aur-b1a3 at mekboy dot ru>

pkgname=execline-static
_pkgname=execline
pkgver=2.9.7.0
pkgrel=3
pkgdesc='A (non-interactive) scripting language, like sh'
arch=('aarch64' 'i686' 'x86_64')
url="http://skarnet.org/software/${_pkgname}"
license=('ISC')
makedepends=('skalibs-static>=2.14.4.0' 'musl' 'gcc' 'links')
provides=('execline')
conflicts=('execline')
replaces=(execline-musl)
options=('staticlibs' '!lto' '!debug')
source=("${url}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('73c9160efc994078d8ea5480f9161bfd1b3cf0b61f7faab704ab1898517d0207')
build() {
  cd "${_pkgname}-${pkgver}"
  export CC="musl-gcc"
  ./configure \
    --prefix=/usr \
    --enable-static-libc \
    --enable-pedantic-posix \
    --enable-multicall \
    --enable-static-libc \
    --with-include=/usr/include/skalibs-static \
    --with-lib=/usr/lib/skalibs-static \
    --with-sysdeps=/usr/lib/skalibs-static/sysdeps \
    --includedir=/usr/include/${pkgname} \
    --libdir=/usr/lib/${pkgname}
  make -j $(nproc)
}
package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  strip ${pkgdir}/usr/bin/execline # strip in makepkg options doesn't do it
  rm doc/*.txt
  for f in doc/*.html; do
    links -dump $f|tail -n +5 > ${f%.html}.txt
  done
  install -Dm644 -t ${pkgdir}/usr/share/doc/execline/ doc/*.txt
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
