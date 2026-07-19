# Maintainer: Mike Ravenblack <0xRavenBlack@github>
pkgname=shadowdate
_appid=0xravenblack.shadowdata
pkgver=0.2.0
pkgrel=2
pkgdesc="A gothic dark-pastel desktop calendar for Linux (Rust + GTK4) with iCalendar support"
arch=('x86_64' 'aarch64')
url="https://github.com/0xRavenBlack/ShadowDate"
options=('!debug')
license=('MIT')
depends=('gtk4' 'glib2')
makedepends=('git' 'cargo' 'gtk4')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

prepare() {
    cd "${pkgname}"
    export CARGO_HOME="${srcdir}/.cargo"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's|host: ||p')"
}

build() {
    cd "${pkgname}"
    export CARGO_HOME="${srcdir}/.cargo"
    cargo build --frozen --release --bin "${pkgname}"
}

check() {
    cd "${pkgname}"
    export CARGO_HOME="${srcdir}/.cargo"
    cargo test --frozen --release
}

package() {
    cd "${pkgname}"

    # Executable
    install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    # Desktop entry
    install -Dm644 "resources/${_appid}.desktop" \
        "${pkgdir}/usr/share/applications/${_appid}.desktop"

    # Icon
    install -Dm644 "resources/img/Logo.png" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_appid}.png"

    # License
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
