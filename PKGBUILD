# Maintainer: Maximilian Luz <luzmaximilian@gmail.com>

pkgname="surface-control"
pkgver=0.4.6
pkgrel=1
_pkgrel=1
pkgdesc='Control various aspects of Microsoft Surface devices from the Command-Line'
url='https://github.com/linux-surface/surface-control'
license=('MIT')
arch=('x86_64')
depends=('gcc-libs' 'systemd-libs')
makedepends=('rust' 'cargo' 'systemd')


source=(
    "${pkgname}-${pkgver}-${_pkgrel}.tar.gz::https://github.com/linux-surface/surface-control/archive/refs/tags/v${pkgver}-${_pkgrel}.tar.gz"
)

sha256sums=('a3b16a943426d551e57d09c2a894f1b2fab80fdde8905721b15db63a1f2ab18d')

build(){
    cd "${srcdir}/${pkgname}-${pkgver}-${_pkgrel}"
    env CARGO_TARGET_DIR="target" CARGO_INCREMENTAL=0 RUSTUP_TOOLCHAIN="stable" cargo build --release --locked
    strip --strip-all "target/release/surface"
}

package() {
    install -D -m755 "${srcdir}/${pkgname}-${pkgver}-${_pkgrel}/target/release/surface" "$pkgdir/usr/bin/surface"

    # completion files
    install -D -m644 "${srcdir}/${pkgname}-${pkgver}-${_pkgrel}/target/surface.bash" "$pkgdir/usr/share/bash-completion/completions/surface"
    install -D -m644 "${srcdir}/${pkgname}-${pkgver}-${_pkgrel}/target/_surface" "$pkgdir/usr/share/zsh/site-functions/_surface"
    install -D -m644 "${srcdir}/${pkgname}-${pkgver}-${_pkgrel}/target/surface.fish" "$pkgdir/usr/share/fish/completions/surface.fish"

    # license
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}-${_pkgrel}/LICENSE" "${pkgdir}/usr/share/licenses/surface-control/LICENSE"
}
