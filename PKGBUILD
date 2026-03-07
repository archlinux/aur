# Contributor: Lex Black <autumn-wind@web.de>
# Maintainer: Christopher Snowhill <kode54@gmail.com>

_pkgname=labwc
pkgname=labwc-wlroots-020-git
pkgver=0.9.5.r12.g8d8654db
pkgrel=2
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
        '0001-chase-wlroots-Add-support-for-HDR10-output.patch::https://github.com/kode54/labwc/commit/67452818657e157d2b37d4eafd623bc883c733c7.patch'
        '0002-chase-wlroots-Add-support-for-color-management-v1.patch::https://github.com/kode54/labwc/commit/8a6abf947f577dc012ec85da8aeb0a9ff3fad5cf.patch'
        '0003-chase-wlroots-Add-support-for-color-representation-v.patch::https://github.com/kode54/labwc/commit/5893aa4f370f0f49c94142e68ad6a5db7c449c38.patch'
        '0004-Document-the-new-HDR-option.patch::https://github.com/kode54/labwc/commit/11b8af4446daae1d6ceb8c9531b13fd87f4781cb.patch')
md5sums=('SKIP'
         'b619848f525744588327a5b6a674fcc9'
         'e83f59a600997c5f5a52b8c6fc868793'
         '792db83bfe6901b4b485bc189cf8f143'
         'edfc198642a87d0ecb7b147e16a7a569'
         '2ee85eb23f26612b270278d9cb6c4b33'
         '5f1d33d7c933cba86d948543ceb1bbdb'
         '9c0c127f7930dddc196a90487c00c65f')


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
