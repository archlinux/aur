# Maintainer: Denis Benato <benato.denis96@gmail.org>

pkgname=login-ng
pkgver=0.4.21
pkgrel=1
pkgdesc='A greeter with addition functionalities'
url='https://github.com/neroreflex/login-ng'
license=()
makedepends=(
    'cargo'
    'clang'
)
depends=(
    'pam'
    'dbus'
    'greetd'
    'seatd'
    'weston'
    'qt6-base'
)
arch=('i686' 'x86_64' 'armv7h')
source=(
    "login-ng-${pkgver}.tar.gz::https://github.com/NeroReflex/${pkgname}/archive/refs/tags/${pkgver}.tar.gz"
)
b2sums=(
    'fb4bbd26dbb77b8a74170f351daa6e577d1e9bb309073d3a2d08ac61fa91d0de4d5e3a40ac3070eb7117893583339635f689cb22ca4c97ad2cf664ee9ace7580' # login-ng-${pkgver}.tar.gz
)
sha256sums=(
    'e0525d4d280761dc802819f1fc49123a591ca9c0d48e0b9e730885c3a90d9a06' # login-ng-${pkgver}.tar.gz
)
backup=(
    etc/pam.d/login_ng
    etc/pam.d/login_ng-autologin
)

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    make build
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX="${pkgdir}" install

    mkdir -m 640 -p "${pkgdir}/etc/login_ng"
}
