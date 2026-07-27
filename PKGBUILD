# Maintainer: IO-ZetZor <swag100iq111@gmail.com>

pkgname=visor
pkgver=1.3
pkgrel=2
pkgdesc="A minimal, fast, graphical UEFI boot manager"
arch=('x86_64')
url="https://github.com/IO-ZetZor/Visor-BootManager"
license=('BSD')
depends=('gnu-efi')
makedepends=('git')
optdepends=('sbctl: Secure Boot signing with sbctl'
            'efibootmgr: UEFI boot entry management'
            'python: kernel/initrd encryption (visor encrypt)'
            'python-pillow: font baking (make bakefont)')
install=visor.install
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('SKIP')

build() {
  cd "$srcdir/Visor-BootManager-$pkgver"
  make
}

package() {
  cd "$srcdir/Visor-BootManager-$pkgver"

  # EFI binary
  install -Dm644 visor_x64.efi "$pkgdir/usr/lib/visor/visor_x64.efi"

  # CLI
  install -Dm755 visor "$pkgdir/usr/bin/visor"

  # Config example
  install -Dm644 boot.conf.example "$pkgdir/usr/share/visor/boot.conf.example"

  # Assets
  install -dm755 "$pkgdir/usr/share/visor"
  [ -d assets/icons ] && cp -r assets/icons "$pkgdir/usr/share/visor/icons"
  [ -d assets/backgrounds ] && cp -r assets/backgrounds "$pkgdir/usr/share/visor/backgrounds"
  [ -f assets/logo.png ] && install -m644 assets/logo.png "$pkgdir/usr/share/visor/logo.png"

  # License
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
