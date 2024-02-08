# Maintainer: fossdd <fossdd@pwned.life>
# Contributor: Brett Cornwall <ainola@archlinux.org>
# Contributor: gilbus

pkgname=swaylock-no-password
_pkgname=swaylock
pkgver=1.7.2
pkgrel=1
license=("MIT")
pkgdesc="Screen locker for Wayland (without password validation)"
makedepends=(
    'meson'
    'scdoc'
    'wayland-protocols'
    'git'  # To make the version string
)
depends=(
    'cairo'
    'libxkbcommon'
    'pam'
    'wayland'
    'gdk-pixbuf2'  # For images other than PNG
)
conflicts=(swaylock)
provides=(swaylock)
arch=('x86_64')
url="https://github.com/swaywm/swaylock"
backup=('etc/pam.d/swaylock')
source=("$url/releases/download/v$pkgver/$_pkgname-$pkgver.tar.gz"{,.sig}
        'do-not-validate-password.patch')
sha256sums=('bf965d47fb6fc1402f854d4679d21a9459713fc0f330bc607c9585db097b4304'
            'SKIP'
            'eb953413acc5d3c7f5e3078d668794b7beebfb819d267ee1dd4d3d76d52bc976')
validpgpkeys=(
    "9DDA3B9FA5D58DD5392C78E652CB6609B22DA89A"  # Drew DeVault
    "34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48"  # Simon Ser
)

prepare() {
    patch --directory="$_pkgname-$pkgver" --forward --strip=1 --input="${srcdir}/do-not-validate-password.patch"
}

build() {
    arch-meson "$_pkgname-$pkgver" build
    ninja -C build
}

package() {
    DESTDIR="$pkgdir/" ninja -C build install
    install -Dm644 "$_pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "$_pkgname-$pkgver/README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
