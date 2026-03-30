# Contributor: Lex Black <autumn-wind@web.de>
# Maintainer: Christopher Snowhill <kode54@gmail.com>

_pkgname=labwc
pkgname=labwc-hdr-git
pkgver=0.9.5.r48.gc3fc7828
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
        '0001-allow-toplevel-capture.patch::https://github.com/Consolatis/labwc/commit/2802e5e3ecf668d59135cb406518a61686617e4f.patch'
        'https://github.com/labwc/labwc/pull/3472.patch'
        '0001-chase-wlroots-Add-support-for-HDR10-output.patch::https://github.com/kode54/labwc/commit/8f9561ced9a196a5769528db1dd6e9438b2a6798.patch'
        '0002-chase-wlroots-Add-support-for-color-management-v1.patch::https://github.com/kode54/labwc/commit/60eee9674215160a1a5222ff66fa618a8cec524f.patch'
        '0003-chase-wlroots-Add-support-for-color-representation-v.patch::https://github.com/kode54/labwc/commit/9ad576b1d0219e2e88d59d92f4e9941bcf294a95.patch'
        '0004-Document-the-new-HDR-option.patch::https://github.com/kode54/labwc/commit/598242c021cf77580e871ba51a48a7a5311bed73.patch')
md5sums=('SKIP'
         '5521d6432cd48e755e6ebfee18c0d278'
         '5121c51f0db256424817e66438773df1'
         '07679bb8ddb72653d7204888362acbaf'
         'c7a025ee729f584429ef3e80275ffc9b'
         'a1c29704d2e16193370156a9c82c4be8'
         '65104057093a25f0e398ee4365d78621')


pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  patch -Np1 -i "$srcdir/0001-allow-toplevel-capture.patch"
  patch -Np1 -i "$srcdir/3472.patch"
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
