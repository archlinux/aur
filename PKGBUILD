# Contributor: Lex Black <autumn-wind@web.de>
# Maintainer: Christopher Snowhill <kode54@gmail.com>

_pkgname=labwc
pkgname=labwc-hdr-git
pkgver=0.9.5.r65.g7be58fba
pkgrel=1
pkgdesc='stacking wayland compositor with look and feel from openbox (git version) (experimental HDR branch and other patches applied)'
url="https://github.com/labwc/labwc"
arch=('x86_64')
license=('GPL-2.0-only')
depends=('libpng' 'librsvg' 'libsfdo' 'pango' 'seatd' 'ttf-font' 'libwlroots-0.20.so' 'wayland' 'xorg-xwayland')
makedepends=('git' 'meson' 'scdoc' 'wayland-protocols')
optdepends=("bemenu: default launcher via Alt+F3")
conflicts=(labwc)
provides=(labwc)
source=("git+https://github.com/labwc/${_pkgname}.git"
        'https://github.com/labwc/labwc/pull/2968.patch'
        'https://github.com/labwc/labwc/pull/3424.patch')
md5sums=('SKIP'
         'a6ef1d9232f93e4d7f7299b409b20893'
         '26fc2e36092e7a0c7d7ecf3308553eaa')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  patch -Np1 -i "$srcdir/2968.patch"
  patch -Np1 -i "$srcdir/3424.patch"
}

build() {
  arch-meson -Dman-pages=enabled "$_pkgname" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
