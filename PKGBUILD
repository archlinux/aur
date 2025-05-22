# Maintainer: Lev Babiev <harley at hosers dot org>

pkgname=sfwbar
pkgver=1.0_beta16
pkgrel=1

pkgdesc='S* Floating Window taskBar'
arch=('x86_64')
url='https://github.com/LBCrion/sfwbar'
license=('GPL3')
depends=(
    'wayland'
    'gtk3'
    'json-c'
    'gtk-layer-shell'
    'wayland-protocols'
    )
optdepends=(
    'alsa-lib: ALSA audio volume control',
    'libpulse: pulse audio volume control',
    'libmpdclient: music player daemon control',
    'libxkbcommon: xkb layout conversion support'
    )
makedepends=('meson')

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "monitor_noop.patch")

sha256sums=('238d6394650dfdfc2f36374ec25702bbef57e2cff1d9a149ecb9a52f887c3cdf'
            'a630ff3a58bc38352f05aac178e0d1cca03067f9a43e9b509e4b0141e96fd790')

prepare() {
  patch --directory "$pkgname-$pkgver" --forward --strip=1 --input=../monitor_noop.patch
}

build() {
    cd "$pkgname-$pkgver"
    meson --prefix=/usr \
          --buildtype=plain \
          build
    ninja -C build
}

package() {
    cd "$pkgname-$pkgver"
    DESTDIR="$pkgdir" ninja -C build install
}
