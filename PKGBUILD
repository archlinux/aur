# Maintainer: Denis Benato <benato.denis96@gmail.org>

_pkgname=login_ng
pkgname=$_pkgname
pkgver=0.6.2
pkgrel=3
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
    'a95686442f486b4ac7497ed5b303098402b955470796e4872025bfdd2fdd06131538ee316b4bda21d3f99b675ac9be1f348222cac1e20379e8c13a887080d767' # login-ng-${pkgver}.tar.gz
)
sha256sums=(
    '3b4b73587fa92633497e0db6478c902bee396b91d447dd538b1c408796edeca6' # login-ng-${pkgver}.tar.gz
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
