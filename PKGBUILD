# Maintainer: Denis Benato <benato.denis96@gmail.org>

pkgname=login-ng
pkgver=0.4.20
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
    '3d0940b0f5bfe094896a361318164b1e942bc102474d2355c8c93dab8efd650423bfa41c853bac903f64f07f65a9035e1e8a2549bca9d4bbc0632fbb10d3c5e2' # login-ng-${pkgver}.tar.gz
)
sha256sums=(
    '246ec200d6f4b240c3c1f8b4bff0a20a5dc047b0dc11115fa9ab42df49440084' # login-ng-${pkgver}.tar.gz
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
