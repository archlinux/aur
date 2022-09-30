# Contributor: Sébastien Luttringer

pkgname=libnftnl-fullcone
_pkgname=libnftnl
pkgver=1.2.3
pkgrel=1
pkgdesc='Netfilter library providing interface to the nf_tables subsystem (with fullcone patch)'
arch=('x86_64')
url='https://github.com/fullcone-nat-nftables/'
license=('GPL2')
depends=('libmnl' 'nft-fullcone')
makedepends=('git')
provides=('libnftnl')
conflicts=('libnftnl')
validpgpkeys=('37D964ACC04981C75500FB9BD55D978A8A1420E4') # Netfilter Core Team
source=("$pkgname::git+https://github.com/fullcone-nat-nftables/libnftnl-$pkgver-with-fullcone.git")
sha256sums=('SKIP')

prepare() {
  cd $pkgname
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
  cd $pkgname
  chmod +x ./configure
  ./configure --prefix=/usr
  make
}

check() {
  cd $pkgname
  make check
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
