# Maintainer: Andrew Sun <adsun701 at gmail dot com>

pkgname=lib32-libnftnl
_pkgbasename=libnftnl
pkgver=1.2.1
pkgrel=1
pkgdesc='Netfilter library providing interface to the nf_tables subsystem (32-bit)'
arch=('x86_64')
url='https://netfilter.org/projects/libnftnl/'
license=('GPL2')
depends=('lib32-libmnl' 'libnftnl')
makedepends=('gcc-multilib')
validpgpkeys=('37D964ACC04981C75500FB9BD55D978A8A1420E4') # Netfilter Core Team
source=("https://netfilter.org/projects/libnftnl/files/libnftnl-$pkgver.tar.bz2"{,.sig})
sha256sums=('7508a5c414fab13e3cb3ce8262d0ce4f02c1590a8e4f8628ab497b5b4585937c'
          'SKIP')

prepare() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  # apply patch from the source array (should be a pacman feature)
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    msg2 "Applying patch $src..."
    patch -Np1 < "../$src"
  done
}

build() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  export LDFLAGS+=' -m32'
  
  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32
  make
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}
