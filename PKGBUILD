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
pkgver=0.6.11
pkgrel=1
pkgdesc='A greeter with addition functionalities'
url="https://github.com/neroreflex/$_pkgname"
license=()
makedepends=(
    'cargo'
    'clang'
)
arch=('i686' 'x86_64' 'armv7h')
source=(
    "${_pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/${pkgver}.tar.gz"
)
b2sums=(
    '78072c4f879ec2aaa68b45b0ca6850fa0097fe733f64a6724a651c1d0378dddba79065695c2b79327c4cd40e88620af6b7989eebf7e15c44426fe55273c1016e' # ${_pkgname}-${pkgver}.tar.gz
)
sha256sums=(
    'd7aa434f2af8d8e79e08ccadc91b272240bbb75a33cf4902d52fdf134dcffc55' # ${_pkgname}-${pkgver}.tar.gz
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
    depends=(
        'pam'
        'greetd'
        'seatd'
    )
    backup=(
        etc/pam.d/login_ng
        etc/pam.d/login_ng-autologin
    )

    cd "${srcdir}/${_pkgname}-${pkgver}"
    make PREFIX="${pkgdir}" install_login_ng-cli
}

package_login_ng-ctl() {
    backup=(
        etc/pam.d/login_ng-ctl
    )

    cd "${srcdir}/${_pkgname}-${pkgver}"
    make PREFIX="${pkgdir}" install_login_ng-ctl
}

package_pam_login_ng() {
    depends=(
        'pam'
        'dbus'
    )

    cd "${srcdir}/${_pkgname}-${pkgver}"
    make PREFIX="${pkgdir}" install_pam_login_ng

    mkdir -m 640 -p "${pkgdir}/etc/login_ng"
}

package_login_ng-session() {
    depends=(
        'dbus'
    )

    cd "${srcdir}/${_pkgname}-${pkgver}"
    make PREFIX="${pkgdir}" install_login_ng-session

    mkdir -m 640 -p "${pkgdir}/etc/login_ng"
}

package_sessionexec() {
    optdepends=(
        'gamescope: for game-mode'
        'steam: for game-mode steam session'
        'plasma: for desktop-mode'
    )

    cd "${srcdir}/${_pkgname}-${pkgver}"
    make PREFIX="${pkgdir}" install_sessionexec
}
