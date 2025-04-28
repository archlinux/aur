# Maintainer: Denis Benato <benato.denis96@gmail.org>

pkgname=login-ng
pkgver=0.3.6
pkgrel=1
pkgdesc='A greeter with addition functionalities'
url='https://github.com/neroreflex/login-ng'
license=()
makedepends=('cargo' 'clang')
depends=(
    'dbus'
    'greetd'
)
arch=('i686' 'x86_64' 'armv7h')
source=(
    "login-ng-${pkgver}.tar.gz::https://github.com/NeroReflex/${pkgname}/archive/refs/tags/${pkgver}.tar.gz"
)
b2sums=(
    '79ab24e9b190cd70939417fc49ddd202ad3fad22cdffd78487b6fde676899aaf77f59432365cab09c69c44157a21045fd56864fe884386f7a5bb53a594dd8f6e' # login-ng-${pkgver}.tar.gz
)
sha256sums=(
    '19fd6d76a5bbf80c672e1b2e4dd6c5cd82b33b4c06aa2cad7c9d2067cffb1f42' # login-ng-${pkgver}.tar.gz
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
