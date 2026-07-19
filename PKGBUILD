# Maintainer: Mike Ravenblack <0xRavenBlack@github>
pkgname=com.ravenblack.shadowdate
_pkgname=shadowdate
pkgver=0.2.0
pkgrel=1
pkgdesc="A gothic dark-pastel desktop calendar for Linux (Rust + GTK4) with iCalendar support"
arch=('x86_64' 'aarch64')
url="https://github.com/0xRavenBlack/com.ravenblack.shadowdate"
license=('MIT')
depends=('gtk4' 'glib2')
makedepends=('git' 'cargo' 'gtk4')
provides=('shadowdate')
conflicts=('shadowdate')
source=("git+${url}.git")
sha256sums=('SKIP')

prepare() {
    cd "${pkgname}"
    export CARGO_HOME="${srcdir}/.cargo"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's|host: ||p')"
}

build() {
    cd "${pkgname}"
    export CARGO_HOME="${srcdir}/.cargo"
    cargo build --frozen --release --bin shadowdate
}

check() {
    cd "${pkgname}"
    export CARGO_HOME="${srcdir}/.cargo"
    cargo test --frozen
}

package() {
    cd "${pkgname}"

    # Executable
    install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    # Desktop entry
    install -Dm644 "resources/${pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # License
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
