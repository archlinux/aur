# Maintainer: Sébastien "Seblu" Luttringer <seblu@archlinux.org>

pkgname=nftables-fullcone
_pkgname=nftables
epoch=1
pkgver=1.0.7
pkgrel=1
pkgdesc='Netfilter tables userspace tools (with fullcone patch)'
arch=('x86_64')
url='https://netfilter.org/projects/nftables/'
license=('GPL2')
depends=('libmnl' 'libnftnl' 'gmp' 'readline' 'ncurses' 'jansson')
optdepends=('python: Python bindings')
makedepends=('asciidoc' 'python')
backup=('etc/nftables.conf')
provides=('nftables')
conflicts=('nftables')
validpgpkeys=('37D964ACC04981C75500FB9BD55D978A8A1420E4') # Netfilter Core Team
source=("https://netfilter.org/projects/nftables/files/nftables-$pkgver.tar.xz"{,.sig}
        'nftables.conf'
        'nftables.service'
        'https://github.com/wongsyrone/lede-1/raw/master/package/network/utils/nftables/patches/999-01-nftables-add-fullcone-expression-support.patch')
install=nftables.install
sha256sums=('c12ac941fff9adaedf17367d5ce213789b98a0d314277bc22b3d71e10891f412'
            'SKIP'
            '2aff88019097d21dbfa4713f5b54c184751c86376e458b683f8d90f3abd232a8'
            'deffeef36fe658867dd9203ec13dec85047a6d224ea63334dcf60db97e1809ea'
            'f9ac245a057187000f609761dab57b155dba3ff46ad278375a54cf2ec7b6eaa1')

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
  :
}

build() {
  cd $_pkgname-$pkgver
  autoreconf -fi #FIXME: To remove with 01.patch
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/usr/share \
    --with-json \
    --with-cli=readline \
    --disable-debug
  make
}

package() {
  pushd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  popd
  # basic safe firewall config
  install -Dm644 nftables.conf "$pkgdir/etc/nftables.conf"
  # systemd
  install -Dm644 nftables.service "$pkgdir/usr/lib/systemd/system/nftables.service"
}

# vim:set ts=2 sw=2 et:
