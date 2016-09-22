# Maintainer: n0vember <n0vember at half-9 dot net>
pkgname=antievilmaid
pkgver=3.04
pkgrel=1
pkgdesc="Anti Evil Maid for initramfs-based systems."
arch=('i686' 'x86_64')
url="http://www.qubes-os.org"
license=('GPL')
depends=('antievilmaid-trustedgrub' 'parted')
optdepends=('dracut-antievilmaid-git: Dracut hook for Anti Evil Maid'
            'mkinitcpio-antievilmaid: mkinitcpio hook for Anti Evil Maid (recommended)')
makedepends=('git')
provides=('antievilmaid')
conflicts=('antievilmaid')
source=('git://github.com/QubesOS/qubes-antievilmaid')
_srcdir=qubes-antievilmaid
sha256sums=('SKIP')

build() {
  cd "$_srcdir"
  git checkout tags/v$pkgver -b v$pkgver
}

package() {
  cd "$_srcdir"

  install -d -m0755 "$pkgdir/usr/lib/antievilmaid"
  install -m0755 sbin/anti-evil-maid-* "$pkgdir/usr/lib/antievilmaid/"
  install -m0644 README "$pkgdir/usr/lib/antievilmaid/"

  install -d -m0755 "$pkgdir/etc/systemd/system"
  install -m0644 anti-evil-maid-check-mount-devs.service "$pkgdir/etc/systemd/system"
  install -m0644 anti-evil-maid-seal.service "$pkgdir/etc/systemd/system"
  install -m0644 anti-evil-maid-unseal.service "$pkgdir/etc/systemd/system"

  install -d -m0755 "$pkgdir/etc/systemd/system/basic.target.wants"
  install -m0644 anti-evil-maid-seal.service "$pkgdir/etc/systemd/system/basic.target.wants"

  install -d -m0755 "$pkgdir/etc/systemd/system/initrd.target.requires"
  install -m0644 anti-evil-maid-check-mount-devs.service "$pkgdir/etc/systemd/system/initrd.target.requires"

  install -d -m0755 "$pkgdir/etc/systemd/system/initrd.target.wants"
  install -m0644 anti-evil-maid-unseal.service "$pkgdir/etc/systemd/system/initrd.target.wants"

  install -d -m0755 "$pkgdir/etc/systemd/system/tcsd.service.d"
  install -m0644 anti-evil-maid-seal.conf "$pkgdir/etc/systemd/system/tcsd.service.d"
}

# vim:set ts=2 sw=2 et:
