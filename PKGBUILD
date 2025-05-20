# Maintainer: Denis Benato <benato.denis96@gmail.org>

pkgname=login-ng
pkgver=0.4.2
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
    '1be7f6a03c4b7238c5b2f39c8e55a7bfb354aab36647721e7da18b664aa073d3c1e458b8902be1c7c8f834034ab6387989c36de60767602cf4541d694a39fcf3' # login-ng-${pkgver}.tar.gz
)
sha256sums=(
    'fa512eb2de2659a45776b37b5617480ef8cc091f8425bf3396edd2eec8a22891' # login-ng-${pkgver}.tar.gz
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
