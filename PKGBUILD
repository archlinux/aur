# Maintainer: Lex Black <autumn-wind@web.de>

_pkgname=labwc
pkgname=labwc-wlroots-018-git
pkgver=0.7.1.r138.gca0299d2
pkgrel=1
pkgdesc='stacking wayland compositor with look and feel from openbox (git version)'
url="https://github.com/labwc/labwc"
arch=('x86_64')
license=('GPL2')
depends=('libpng' 'librsvg' 'pango' 'seatd' 'wlroots-git' 'wayland' 'xorg-xwayland')
makedepends=('git' 'meson' 'scdoc' 'wayland-protocols')
optdepends=("bemenu: default launcher via Alt+F3")
conflicts=(labwc)
provides=(labwc)
source=("git+https://github.com/labwc/${_pkgname}.git"
        'https://github.com/labwc/labwc/pull/1641.patch'
        'labwc-atomic-modesetting-tearing.patch'
        'labwc-fix-xwayland-unmanaged-restack.patch'
        'override_redirect.patch')
md5sums=('SKIP'
         '63807aa376164b20fec480bcd375d8ea'
         '63792a6012b41b164e3a9194d522f9ac'
         'f4a7cd21681f8c49505f28aed8d5e878'
         'd5a2b2205636263fdd12c36d4cd19089')

prepare() {
  cd "$_pkgname"
  patch -Np1 -i "${srcdir}/1641.patch"
  patch -Np1 -i "${srcdir}/labwc-atomic-modesetting-tearing.patch"
  patch -Np1 -i "${srcdir}/labwc-fix-xwayland-unmanaged-restack.patch"
  patch -Np1 -i "${srcdir}/override_redirect.patch"
}

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson -Dman-pages=enabled "$_pkgname" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
