# Maintainer: Denis Benato <benato.denis96@gmail.org>

_pkgname=login_ng
pkgname=$_pkgname
pkgver=0.6.4
pkgrel=1
pkgdesc='A greeter with addition functionalities'
url="https://github.com/neroreflex/$_pkgname"
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
)
arch=('i686' 'x86_64' 'armv7h')
source=(
    "${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/${pkgver}.tar.gz"
)
b2sums=(
    'a4be19df8987f4101b1af2d02bb71a6b9e32e71545e2fb24ae6d2dd341cd8bf61aa30b1843c92ae6a6360ba01ab6f546134b489a00bcf21ebd707890df91c099' # login-ng-${pkgver}.tar.gz
)
sha256sums=(
    'bcd9df0e708d273b3bdd7961f1221242711a776d5b2979478a3485199e5caa07' # login-ng-${pkgver}.tar.gz
)
backup=(
    etc/login_ng-session/default.service
    etc/login_ng-session/steamdeck.service
    etc/pam.d/login_ng
    etc/pam.d/login_ng-autologin
    etc/pam.d/login_ng-ctl
)

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    make build
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make PREFIX="${pkgdir}" install

    mkdir -m 640 -p "${pkgdir}/etc/login_ng"
}
