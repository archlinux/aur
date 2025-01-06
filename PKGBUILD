# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=ignition-startup
_pkgname=ignition
pkgver=1.0.1
pkgrel=1
pkgdesc="Manage startup apps and scripts"
arch=('any')
url="https://github.com/flattool/ignition/"
license=('GPL-3.0-or-later')
depends=(
  'gjs'
  'libadwaita'
)
makedepends=(
  'blueprint-compiler'
  'meson'
)
source=("${_pkgname}-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
        'app_chooser_page.patch')
sha256sums=('ad0d2fd94cc25c8c27fb760a405c43149adc8f3c12cdf3466ef81e52a0e8d09e'
            'b154906bcaa94b04e159b7532faffec72700c86545b9062ac99b1895b4c349e9')

prepare() {
  cd "${_pkgname}-$pkgver"

  # Add system & user application paths
  patch -Np1 -i ../app_chooser_page.patch
}

build() {
  arch-meson "${_pkgname}-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"

  ln -s /usr/bin/io.github.flattool.Ignition "$pkgdir/usr/bin/${_pkgname}"
}
