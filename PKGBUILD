# Maintainer: slatkin@gmail.com
pkgname=mby-git
pkgver=0.1.0
pkgrel=1
pkgdesc="Terminal client for Emby media server (git)"
arch=('x86_64')
url="https://github.com/slatkin/mby"
license=('MIT')
depends=('mpv' 'openssl')
makedepends=('rust' 'cargo' 'nasm' 'git')
provides=('mby')
conflicts=('mby')
source=("${pkgname}::git+https://github.com/slatkin/mby.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${pkgname}"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${pkgname}"
    cargo build --frozen --release
}

package() {
    cd "${pkgname}"
    install -Dm755 "target/release/mby" "${pkgdir}/usr/bin/mby"
    install -Dm644 "scripts/mby.lua" "${pkgdir}/usr/share/mby/scripts/mby.lua"
    install -Dm644 "fonts/Material-Design-Iconic-Font.ttf" \
        "${pkgdir}/usr/share/mby/fonts/Material-Design-Iconic-Font.ttf"
    install -Dm644 "dist/config.toml" "${pkgdir}/usr/share/mby/config.toml"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/mby/LICENSE"
}
