# Maintainer: Andrew Sun <adsun701 at gmail dot com>

pkgname=lib32-libnftnl
_pkgbasename=libnftnl
pkgver=1.1.5
pkgrel=1
pkgdesc='Netfilter library providing interface to the nf_tables subsystem (32-bit)'
arch=('x86_64')
url='https://netfilter.org/projects/libnftnl/'
license=('GPL2')
depends=('lib32-libmnl' 'libnftnl')
makedepends=('gcc-multilib')
validpgpkeys=('C09DB2063F1D7034BA6152ADAB4655A126D292E4') # Netfilter Core Team
source=("https://netfilter.org/projects/libnftnl/files/libnftnl-$pkgver.tar.bz2"{,.sig}
        '01-flowtable.patch::https://git.netfilter.org/libnftnl/patch/?id=b2388765e0c4405442faa13845419f6a35d0134c')
sha1sums=('a923bae5b028a30c5c8aa4c0f71445885867274b'
          'SKIP'
          'b121893675fcf8568e9566899e71fb35b47bdd4e')

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
