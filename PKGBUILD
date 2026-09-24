# Maintainer: Eren Simsek <18117384-caferen@users.noreply.gitlab.com>
# Maintainer: Guy Boldon <gb@guyboldon.com>

pkgname=coolercontrold
pkgver=5.0.1
pkgrel=1
pkgdesc="A program to monitor and control your cooling devices. This package contains the service daemon. (official package)"
arch=("x86_64")
url="https://gitlab.com/coolercontrol/coolercontrol"
license=("GPL-3.0-or-later")
depends=(
    "libdrm"
    "gcc-libs"
    "glibc"
)
optdepends=(
    "liquidctl: liquidctl driver support"
    "lm_sensors: kernel hwmon driver support"
)
makedepends=(
    "bubblewrap"
    "rust"
    "cargo"
)
# lto is handled by cargo and can conflict with makepkg settings
options=(
    !lto
)
source=(
    "https://gitlab.com/coolercontrol/coolercontrol/-/releases/$pkgver/downloads/packages/coolercontrol-$pkgver.tar.gz"
    "https://gitlab.com/coolercontrol/coolercontrol/-/releases/$pkgver/downloads/packages/coolercontrold-vendor-$pkgver.tar.gz"
)
sha256sums=(
  '9239f628b35cd122b6c637402caedf4b3937dd073d02ebabe17af67a73b815fb'
  '65cdc696c137409717e51b478778f39714e1179469d7fcf37408644118255d36'
)

build() {
    cd "${srcdir}/coolercontrol-$pkgver/coolercontrold"
    cargo build --release --frozen
}

check() {
    cd "${srcdir}/coolercontrol-$pkgver/coolercontrold/target/release"
    ./coolercontrold --version
}

package() {
    cd "${srcdir}/coolercontrol-$pkgver/coolercontrold"
    install -Dm755 "target/release/coolercontrold" -t "$pkgdir/usr/bin"

    cd "${srcdir}/coolercontrol-$pkgver"
    install -Dm644 "packaging/systemd/coolercontrold.service" -t "$pkgdir/usr/lib/systemd/system/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/coolercontrold"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/coolercontrold"
}