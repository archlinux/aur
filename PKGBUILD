# Maintainer: Vladimir Tsanev <tsachev at gmail dot com>
# libslimbook + slimbookctl, built from upstream tag 1.28.1.
pkgname=libslimbook
pkgver=1.28.1
pkgrel=3
pkgdesc="Slimbook core library, slimbookctl CLI and settings load/store service"
arch=('x86_64')
url="https://github.com/Slimbook-Team/libslimbook"
license=('GPL-3.0-or-later')
changelog=CHANGELOG
depends=('bash' 'gcc-libs' 'glibc')
makedepends=('git' 'meson')
optdepends=('usbutils: USB devices in slimbookctl report'
            'efibootmgr: UEFI boot entries in slimbookctl report'
            'libinput-tools: input device details in slimbookctl report'
            'xorg-xinput: X11 input devices in slimbookctl report'
            'dmidecode: DMI/SMBIOS tables in slimbookctl report'
            'pciutils: PCI devices in slimbookctl report'
            'flatpak: installed Flatpak apps in slimbookctl report'
            'networkmanager: Wi-Fi networks in slimbookctl report-full')
source=("$pkgname::git+https://github.com/Slimbook-Team/libslimbook.git#tag=$pkgver")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname"
  # Arch has no /usr/libexec; use /usr/lib/slimbook
  sed -i 's|/usr/libexec/slimbook|/usr/lib/slimbook|' src/slimbookctl.cpp
  sed -i "s|'libexec/slimbook/'|'lib/slimbook/'|" meson.build
}

build() {
  arch-meson "$pkgname" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

  install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
