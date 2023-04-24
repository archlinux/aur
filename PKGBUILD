# Maintainer: Sébastien Luttringer

pkgname=libnftnl-fullcone
_pkgname=libnftnl
pkgver=1.2.5
pkgrel=1
pkgdesc='Netfilter library providing interface to the nf_tables subsystem (with fullcone patch)'
arch=('x86_64')
url='https://netfilter.org/projects/libnftnl/'
license=('GPL2')
depends=('libmnl')
provides=('libnftnl')
conflicts=('libnftnl')
validpgpkeys=('37D964ACC04981C75500FB9BD55D978A8A1420E4') # Netfilter Core Team
source=("https://netfilter.org/projects/libnftnl/files/libnftnl-$pkgver.tar.xz"{,.sig}
'https://github.com/wongsyrone/lede-1/raw/master/package/libs/libnftnl/patches/999-01-libnftnl-add-fullcone-expression-support.patch')
sha256sums=('966de0a8120c8a53db859889749368bfb2cba0c4f0b4c1a30d264eccc45f1226'
            'SKIP'
            '321fd41802d77eabade6e4e7131ad8b32d7861d4f362f4ef0d54d414f6248b58')

prepare() {
  cd $_pkgname-$pkgver
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
  cd $_pkgname-$pkgver
  autoreconf -fi
  ./configure --prefix=/usr
  make
}

check() {
  cd $_pkgname-$pkgver
  make check
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
