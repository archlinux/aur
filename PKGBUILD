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
pkgver=0.6.6
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
    '486e08fb2806feeb0925a6f9d58de6656a3aa52c957296355199f48b48fdefe4f57bd295e8a663856e0b0b7165a764dcad4099c959a83af24d5b32cd26bb311e' # ${_pkgname}-${pkgver}.tar.gz
)
sha256sums=(
    '2de7f6243c701365ce7b98d6acc6a72e5e315189546c579342d9c2a5a3d308b0' # ${_pkgname}-${pkgver}.tar.gz
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
