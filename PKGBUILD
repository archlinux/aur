# Maintainer: MotherSphere <mothersphere.colony@gmail.com>
pkgname=colony-git
_pkgname=colony
pkgver=r0.0
pkgrel=1
pkgdesc="Application launcher for the Project-Colony ecosystem (git HEAD)"
arch=('x86_64')
url="https://github.com/Project-Colony/Colony"
license=('Unknown')
depends=(
    'gcc-libs'
    'openssl'
    'xz'
    'gtk3'
    'xdotool'
    'dbus'
    'vulkan-icd-loader'
)
makedepends=('git' 'cargo')
provides=('colony')
conflicts=('colony' 'colony-bin')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
