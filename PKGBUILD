# Maintainer: Aleksej Kovura <aur-b1a3 at mekboy dot ru>

pkgname=execline-static
_pkgname=execline
pkgver=2.9.9.2
pkgrel=1
pkgdesc='A (non-interactive) scripting language, like sh'
arch=('aarch64' 'i686' 'x86_64')
url="http://skarnet.org/software/${_pkgname}"
license=('ISC')
makedepends=('skalibs-static>=2.15.0.0' 'musl' 'gcc' 'make')
optdepends=('execline-man-pages')
provides=('execline')
conflicts=('execline')
replaces=('execline-musl')
options=('staticlibs' '!lto' '!debug')
source=("${url}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('908ed4db3a6b3a23a205d8fd4cf2a71089156f2aeae0f54656045aafad2dee32')
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
  rm -f doc/*.txt
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
