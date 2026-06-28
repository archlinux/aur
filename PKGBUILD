# Maintainer: Maximilian Friedersdorff <max at friedersdorff dot com>
# Contributor: Brett Cornwall <ainola@archlinux.org>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Robin Candau <antiz@archlinux.org>
# Contributor: Maxim Baz <archlinux at maximbaz dot com>

origname=swaybg
pkgname=swaybg-namespace
pkgver=1.2.2
pkgrel=0
pkgdesc='Wallpaper tool for Wayland compositors with explicit namespace patch'
arch=(x86_64)
url='https://github.com/swaywm/swaybg'
license=(MIT)
makedepends=(meson
             ninja
             scdoc
             wayland-protocols)
provides=("swaybg")
conflicts=("swaybg")
depends=(
    'wayland'
    'cairo'
    'gdk-pixbuf2'  # For images other than PNG
)
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/swaywm/swaybg/releases/download/v$pkgver/swaybg-$pkgver.tar.gz"
    "$pkgname-$pkgver.tar.gz.sig::https://github.com/swaywm/swaybg/releases/download/v$pkgver/swaybg-$pkgver.tar.gz.sig"
     "explicitly-set-layer-shell-namespace.patch"
)
b2sums=('670d4a232458109d839dc269d0c67013d98180b64bdc04aafec91001b4f875928987aad0d27bec15a947daa05a0a8e5fbfdf3cf2f86f95aa4c4817e9150bc144'
        'SKIP'
        '7c8bec4e23089a7f1a45dcd9a0d00f99e8aa8d1de0679aec7eb8ef503d506bda5c1ee39b8da1968591ac6e6a7fd8c09f20d3d74b3efa751e7d7127fded4caea7')
validpgpkeys=(
    "9DDA3B9FA5D58DD5392C78E652CB6609B22DA89A"  # Drew DeVault
    "34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48"  # Simon Ser
)

prepare() {
    cd $origname-$pkgver
    patch -Np1 -i ../explicitly-set-layer-shell-namespace.patch
}

build() {
    meson "$origname-$pkgver" build \
        --prefix /usr \
        --buildtype=plain
    ninja -C build
}

package() {
    DESTDIR="$pkgdir/" ninja -C build install
    install -Dm644 "$origname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$origname"
    install -Dm644 "$origname-$pkgver/README.md" -t "$pkgdir/usr/share/doc/$origname"
}
