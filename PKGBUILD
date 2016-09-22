# Maintainer: n0vember <n0vember at half-9 dot net>
pkgname=antievilmaid
pkgver=3.0.4
pkgrel=1
pkgdesc="Anti Evil Maid for initramfs-based systems."
arch=('i686' 'x86_64')
url="http://www.qubes-os.org"
license=('GPL')
depends=('trustedgrub2' 'parted')
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
  cd "$_srcdir/anti-evil-maid"

  install -d -m0755 "$pkgdir/usr/lib/antievilmaid"
  install -m0755 sbin/anti-evil-maid-install "$pkgdir/usr/lib/antievilmaid/"
  install -m0755 sbin/anti-evil-maid-lib "$pkgdir/usr/lib/antievilmaid/"
  install -m0755 sbin/anti-evil-maid-seal "$pkgdir/usr/lib/antievilmaid/"
  install -m0644 README "$pkgdir/usr/lib/antievilmaid/"

  install -d -m0755 "$pkgdir/etc/systemd/system"
  install -m0644 systemd/system/anti-evil-maid-check-mount-devs.service "$pkgdir/etc/systemd/system"
  install -m0644 systemd/system/anti-evil-maid-seal.service "$pkgdir/etc/systemd/system"
  install -m0644 systemd/system/anti-evil-maid-unseal.service "$pkgdir/etc/systemd/system"

  install -d -m0755 "$pkgdir/etc/systemd/system/basic.target.wants"
  install -m0644 systemd/system/basic.target.wants/anti-evil-maid-seal.service "$pkgdir/etc/systemd/system/basic.target.wants"

  install -d -m0755 "$pkgdir/etc/systemd/system/initrd.target.requires"
  install -m0644 systemd/system/initrd.target.requires/anti-evil-maid-check-mount-devs.service "$pkgdir/etc/systemd/system/initrd.target.requires"

  install -d -m0755 "$pkgdir/etc/systemd/system/initrd.target.wants"
  install -m0644 systemd/system/initrd.target.wants/anti-evil-maid-unseal.service "$pkgdir/etc/systemd/system/initrd.target.wants"

  install -d -m0755 "$pkgdir/etc/systemd/system/tcsd.service.d"
  install -m0644 systemd/system/tcsd.service.d/anti-evil-maid-seal.conf "$pkgdir/etc/systemd/system/tcsd.service.d"
}

# vim:set ts=2 sw=2 et:
