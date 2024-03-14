# Maintainer: Maximilian Luz <luzmaximilian@gmail.com>

_pkgname='surface-control'
pkgname="${_pkgname}-git"
pkgver=0.4.6.3.r2.g7589917
pkgrel=1
pkgdesc='Control various aspects of Microsoft Surface devices from the Command-Line'
url='https://github.com/linux-surface/surface-control'
license=('MIT')
arch=('x86_64')
depends=('gcc-libs' 'systemd-libs')
makedepends=('git' 'rust' 'cargo' 'systemd')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=(
    "${_pkgname}::git+https://github.com/linux-surface/surface-control.git"
)

sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
    cd "${srcdir}/${_pkgname}"
    env CARGO_TARGET_DIR="target" CARGO_INCREMENTAL=0 cargo build --release --locked
    strip --strip-all "target/release/surface"
}

package() {
    install -D -m755 "${srcdir}/${_pkgname}/target/release/surface" "${pkgdir}/usr/bin/surface"

    # completion files
    install -D -m644 "${srcdir}/${_pkgname}/target/surface.bash" "${pkgdir}/usr/share/bash-completion/completions/surface"
    install -D -m644 "${srcdir}/${_pkgname}/target/_surface" "${pkgdir}/usr/share/zsh/site-functions/_surface"
    install -D -m644 "${srcdir}/${_pkgname}/target/surface.fish" "$pkgdir/usr/share/fish/vendor_completions.d/surface.fish"

    # license
    install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/surface-control/LICENSE"
}
