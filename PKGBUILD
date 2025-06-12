# Maintainer: Denis Benato <benato.denis96@gmail.org>

_pkgname=login_ng
pkgbase=login-ng
pkgname=(
    ${_pkgname}-cli
    ${_pkgname}-ctl
    pam_${_pkgname}
    ${_pkgname}-session
    sessionexec
)
pkgver=0.6.5
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
    "${_pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/${pkgver}.tar.gz"
)
b2sums=(
    '4fb8becd8029a9fb31299c8afc0b92cc35406916ec0622d8b5744323f4c4cf4a1c5d74ab22d48521fbb3cb4e6004abbd6c5ceb5db73ec64f3a701d427669c46d' # ${_pkgname}-${pkgver}.tar.gz
)
sha256sums=(
    'bda4a101fa8f0c42e815cfef213e0e48fa62a8af5a4c03f7092f97e4b4379616' # ${_pkgname}-${pkgver}.tar.gz
)
backup=(
    etc/login_ng-session/default.service
    etc/login_ng-session/steamdeck.service
    etc/pam.d/login_ng
    etc/pam.d/login_ng-autologin
    etc/pam.d/login_ng-ctl
)

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    make build
}

check() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package_login_ng-cli() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make PREFIX="${pkgdir}" install_login_ng-cli
}

package_login_ng-ctl() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make PREFIX="${pkgdir}" install_login_ng-ctl
}

package_pam_login_ng() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make PREFIX="${pkgdir}" install_pam_login_ng

    mkdir -m 640 -p "${pkgdir}/etc/login_ng"
}

package_login_ng-session() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make PREFIX="${pkgdir}" install_login_ng-session

    mkdir -m 640 -p "${pkgdir}/etc/login_ng"
}

package_sessionexec() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make PREFIX="${pkgdir}" install_sessionexec
}