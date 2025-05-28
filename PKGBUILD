# Maintainer: mokurin000 <mokurin000@gmail.com>

pkgname=(fitgirl-ddl-git fitgirl-ddl-gui-git)
pkgdesc="fitgirl-repacks.site extractor"
_pkgname=fitgirl-ddl
pkgver=r24.g4f5c2de
pkgrel=2
url="https://github.com/mokurin000/fitgirl-ddl"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=(
    'gcc-libs' 'glibc'
)
makedepends=(
    'rust' 'git' 'jq'
    'glib2' 'cairo' 'dconf' 'gtk4' 'dbus'
)

source=("git+${url}.git")

sha256sums=('SKIP')

options=('!lto')

prepare() {
    cd "${_pkgname}"

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target ${CARCH}-unknown-linux-gnu
}

pkgver() {
    cd "${_pkgname}"

    export RUSTUP_TOOLCHAIN=stable
    echo "r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

package_fitgirl-ddl-git() {
    conflicts=('fitgirl-ddl')
    provides=('fitgirl-ddl')

    cd "${_pkgname}"

    install -vDm755 "target/release/${_pkgname}" -t "${pkgdir}/usr/bin/"
    install -vDm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}


package_fitgirl-ddl-gui-git() {
    pkgdesc+=" (GUI version)"
    conflicts=('fitgirl-ddl-gui')
    provides=('fitgirl-ddl-gui')
    depends+=('glib2' 'cairo' 'dconf' 'gtk4' 'dbus')    

    cd "${_pkgname}"

    install -vDm755 "target/release/${_pkgname}_gui" -t "${pkgdir}/usr/bin/"
    install -vDm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${_pkgname}_gui"
}

build() {
    cd "${_pkgname}"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cargo build --frozen --release
}
