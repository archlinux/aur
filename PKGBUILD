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
pkgrel=1
pkgdesc='A serial communication program (with fix for UI hang on zero-width characters when closing windows)'
arch=('x86_64')
url='https://salsa.debian.org/minicom-team/minicom'
license=('GPL-2.0-or-later')
depends=(
  'bash'
  'glibc'
  'ncurses' 'libncursesw.so')
optdepends=('lrzsz: for xmodem, ymodem and zmodem file transfer protocols')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
backup=('etc/minirc.dfl')
source=("${_pkgname}-${pkgver}.tar.gz::https://salsa.debian.org/minicom-team/minicom/-/archive/${pkgver}/minicom-${pkgver}.tar.gz"
        '0001-minicom-2.9-lrzsz-rename.patch'
        '0002-dial-Fix-use-of-check_io_frontend.patch'
        '0003-window-Consider-that-wcwidth-can-return-1-on-invalid.patch'
        '0004-window-Always-advance-at-least-one-cell-when-redrawing.patch')
sha256sums=('b296b0e5795ca143fb1ffa78f46fd294daddfccd720faf9909a842d2f70c564e'
            '4b00e97cadeb51e2cacba7114d2572dbe671b00f0f6695df96aa0ea0dab68c15'
            '329d949e938aa519948ad66c0b680d3af0fbbed8fd392c7fe4dad254fafab804'
            '9210031ead31058cfa73c3b09687b8e05d933a9a3b70fe215ff9b38c1dce87f8'
            'a1e85f2226751a999538491f6b5a375ec195693273943f6b2d596337521391c2')

prepare() {
  cd "${_pkgname}-${pkgver}"

  patch -Np1 -i ../0001-minicom-2.9-lrzsz-rename.patch
  patch -Np1 -i ../0002-dial-Fix-use-of-check_io_frontend.patch
  patch -Np1 -i ../0003-window-Consider-that-wcwidth-can-return-1-on-invalid.patch
  # mc_wclose()/mc_wredraw() spin forever on a zero-width char (e.g. XON)
  # in the screen map, freezing the UI (Ctrl-A Q dead, needs kill -9).
  patch -Np1 -i ../0004-window-Always-advance-at-least-one-cell-when-redrawing.patch
}

build() {
  cd "${_pkgname}-${pkgver}"

  ./configure \
     --prefix=/usr \
     --sysconfdir=/etc
  make
}

package() {
  cd "${_pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}/" install
  install -Dm644 doc/minirc.dfl ${pkgdir}/etc/minirc.dfl
}
