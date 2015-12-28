# Maintainer:
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Rouslan Solomakhin <rouslan@localnet.com>

pkgname=prelink
pkgver=20130503
pkgrel=7
pkgdesc='ELF prelinking utility to speed up dynamic linking'
arch=('x86_64' 'i686')
url='http://people.redhat.com/jakub/prelink/'
license=('GPL')
depends=('elfutils')
makedepends=('elfutils' 'libelf' 'libtool')
backup=('etc/prelink.conf')
source=("http://people.redhat.com/jakub/$pkgname/$pkgname-$pkgver.tar.bz2"
        'prelink.conf'
        'prelink.sh')
sha256sums=('6339c7605e9b6f414d1be32530c9c8011f38820d36431c8a62e8674ca37140f0'
            'a149b15b3b4f4ebf931b606e560289fa0a00a08f32855dc1c743485fec704381'
            'c1a18338a8dab4fe64078e8e68a741618a68f54161b76cc2cef17311613dc92c')

build() {
  cd "$pkgname"

  ./configure --prefix=/usr --mandir=/usr/share/man --sbin=/usr/bin \
    --disable-static --with-gnu-ld
  make
}

check() {
  # Make check fails, but prelink is needed for wine to work properly.
  make -C "$pkgname" check || true
}

package() {
  make -C "$pkgname" DESTDIR="$pkgdir" install
  install -Dm644 prelink.conf "$pkgdir/etc/prelink.conf"

  # Workaround for FS#46155
  mv "$pkgdir/usr/bin/prelink" "$pkgdir/usr/bin/prelink.elf"
  install -Dm755 prelink.sh "$pkgdir/usr/bin/prelink"
}

# vim:set ts=2 sw=2 et:
