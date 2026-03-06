# Contributor: Lex Black <autumn-wind@web.de>
# Maintainer: Christopher Snowhill <kode54@gmail.com>

_pkgname=labwc
pkgname=labwc-wlroots-020-git
pkgver=0.9.5.r12.g8d8654db
pkgrel=1
pkgdesc='stacking wayland compositor with look and feel from openbox (git version) (highly experimental wlroots tracking version)'
url="https://github.com/labwc/labwc"
arch=('x86_64')
license=('GPL-2.0-only')
depends=('libpng' 'librsvg' 'libsfdo' 'pango' 'seatd' 'ttf-font' 'libwlroots-0.20.so' 'wayland' 'xorg-xwayland')
makedepends=('git' 'meson' 'scdoc' 'wayland-protocols')
optdepends=("bemenu: default launcher via Alt+F3")
conflicts=(labwc)
provides=(labwc)
source=("git+https://github.com/labwc/${_pkgname}.git"
        'https://github.com/labwc/labwc/pull/2956.patch'
        'https://github.com/labwc/labwc/pull/2968.patch'
        'labwc-gamma.patch::https://github.com/labwc/labwc/pull/3423.patch'
        '0001-chase-wlroots-Add-support-for-HDR10-output.patch::https://github.com/kode54/labwc/commit/c7bdd270a15e166d9deb5be593bec6d5fc84c00e.patch'
        '0002-chase-wlroots-Add-support-for-color-management-v1.patch::https://github.com/kode54/labwc/commit/1f1aa82849256ccfc91e2ca6dde72f9bac8f47dc.patch'
        '0003-chase-wlroots-Add-support-for-color-representation-v.patch::https://github.com/kode54/labwc/commit/124ba4fc821afb542977dba100b75e194be88107.patch'
        '0004-Document-the-new-HDR-option.patch::https://github.com/kode54/labwc/commit/ea782ec82317536a87b87f17c1b0268f3113fb27.patch')
md5sums=('SKIP'
         'b619848f525744588327a5b6a674fcc9'
         'e83f59a600997c5f5a52b8c6fc868793'
         '792db83bfe6901b4b485bc189cf8f143'
         'a057d5b19d913836c3e3f6712cd2d54a'
         '9f5734261f6f4851197799ada3419855'
         'a428856089e087e7156fbaf6dbcfaf73'
         '5f64f9c131d12219c950619af2db5758')


pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  patch -Np1 -i "$srcdir/2956.patch"
  patch -Np1 -i "$srcdir/2968.patch"
  patch -Np1 -i "$srcdir/labwc-gamma.patch"
  patch -Np1 -i "$srcdir/0001-chase-wlroots-Add-support-for-HDR10-output.patch"
  patch -Np1 -i "$srcdir/0002-chase-wlroots-Add-support-for-color-management-v1.patch"
  patch -Np1 -i "$srcdir/0003-chase-wlroots-Add-support-for-color-representation-v.patch"
  patch -Np1 -i "$srcdir/0004-Document-the-new-HDR-option.patch"
}

build() {
  arch-meson -Dman-pages=enabled "$_pkgname" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
