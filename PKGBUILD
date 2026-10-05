# Maintainer: Hocking Lee <hockinglee@gmail.com>
# Based on the Arch Linux minicom package:
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Denis Tikhomirov <dvtikhomirov@gmail.com>

_pkgname=minicom
pkgname=minicom-hangfix
pkgver=2.11.1
pkgrel=3
pkgdesc='A serial communication program (fixes UI hang on zero-width chars, shows port in terminal title, BLE serial mode)'
arch=('x86_64')
url='https://salsa.debian.org/minicom-team/minicom'
license=('GPL-2.0-or-later')
depends=(
  'bash'
  'glibc'
  'ncurses' 'libncursesw.so'
  'systemd-libs' 'libsystemd.so')
optdepends=('lrzsz: for xmodem, ymodem and zmodem file transfer protocols'
            'bluez: for the BLE serial mode (minicom --ble)')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
backup=('etc/minirc.dfl')
source=("${_pkgname}-${pkgver}.tar.gz::https://salsa.debian.org/minicom-team/minicom/-/archive/${pkgver}/minicom-${pkgver}.tar.gz"
        '0001-minicom-2.9-lrzsz-rename.patch'
        '0002-dial-Fix-use-of-check_io_frontend.patch'
        '0003-window-Consider-that-wcwidth-can-return-1-on-invalid.patch'
        '0004-window-Clamp-cwidth-of-_write-to-1.patch'
        '0005-window-Always-advance-at-least-one-cell-when-redrawi.patch'
        '0006-Show-the-port-in-the-terminal-window-title.patch'
        '0007-Add-BLE-serial-mode.patch')
sha256sums=('b296b0e5795ca143fb1ffa78f46fd294daddfccd720faf9909a842d2f70c564e'
            '4b00e97cadeb51e2cacba7114d2572dbe671b00f0f6695df96aa0ea0dab68c15'
            '329d949e938aa519948ad66c0b680d3af0fbbed8fd392c7fe4dad254fafab804'
            '9210031ead31058cfa73c3b09687b8e05d933a9a3b70fe215ff9b38c1dce87f8'
            '958f44b3377e76d1ec08b29c4d87a4cfdb274d2467a3bf3b0b706a8e98db0382'
            '35570693f8b6f046aba87701c55b0984fe3fc198eb1be22bdcd934f0c5cdce34'
            'cbc77159409ba42d5bfcae3aaefad67d7a402b2fcd0ff2b7bf000838037c5584'
            '8a83ea0d1185ba6adecab95d786d7bc1fa4c0ceeff72d3bf9d1f9108e76e0b59')

prepare() {
  cd "${_pkgname}-${pkgver}"

  patch -Np1 -i ../0001-minicom-2.9-lrzsz-rename.patch
  patch -Np1 -i ../0002-dial-Fix-use-of-check_io_frontend.patch
  patch -Np1 -i ../0003-window-Consider-that-wcwidth-can-return-1-on-invalid.patch
  # Upstream 155279d: control chars (e.g. XON) in the screen map made
  # mc_wclose() spin forever, freezing the UI (Ctrl-A Q dead, kill -9).
  patch -Np1 -i ../0004-window-Clamp-cwidth-of-_write-to-1.patch
  # Same hang for wcwidth() == 0 chars (e.g. U+200B), not yet upstream.
  patch -Np1 -i ../0005-window-Always-advance-at-least-one-cell-when-redrawi.patch
  # Show "minicom: <port>" in the terminal title; VTE >= 0.78 clears the
  # shell-set title on the DECSTR minicom sends at startup.
  patch -Np1 -i ../0006-Show-the-port-in-the-terminal-window-title.patch
  # BLE serial mode: minicom --ble talks to a GATT write/notify
  # characteristic pair (e.g. Nordic UART Service) via BlueZ.
  patch -Np1 -i ../0007-Add-BLE-serial-mode.patch

  # 0007 touches configure.ac and src/Makefile.am
  autoreconf -fi
}

build() {
  cd "${_pkgname}-${pkgver}"

  ./configure \
     --prefix=/usr \
     --sysconfdir=/etc \
     --enable-ble
  make
}

package() {
  cd "${_pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}/" install
  install -Dm644 doc/minirc.dfl ${pkgdir}/etc/minirc.dfl
}
