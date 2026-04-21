# Maintainer: Ilyas Turki <turki.ilyass at gmail dot com>
pkgname=prayer-times
pkgver=0.4.3
pkgrel=1
pkgdesc="Islamic Prayer Times Information and Notifications"
arch=('x86_64' 'aarch64')
url="https://github.com/Yasso9/prayer-times"
license=('MIT')
depends=('dbus' 'openssl')
makedepends=('rust' 'cargo')
conflicts=('prayer-times-bin')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')
options=(!debug !lto)

prepare() {
    cd "${pkgname}-${pkgver}"
    export CARGO_HOME="${srcdir}/.cargo"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${pkgname}-${pkgver}"
    export RUSTFLAGS="--remap-path-prefix=${srcdir}=/"
    export CARGO_HOME="${srcdir}/.cargo"
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen --locked
    ./target/release/${pkgname} generate-shell
}

check() {
    cd "${pkgname}-${pkgver}"
    export CARGO_HOME="${srcdir}/.cargo"
    cargo test --release --frozen --locked -- --skip config::tests::test_config_from_str
}

package() {
    cd "${pkgname}-${pkgver}"

    install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 "target/completions/${pkgname}.bash" \
        "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
    install -Dm644 "target/completions/_${pkgname}" \
        "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
    install -Dm644 "target/completions/${pkgname}.fish" \
        "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"

    install -Dm644 "assets/mosque-svgrepo-com.png" \
        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname}.png"
    install -Dm644 "contrib/${pkgname}.service" \
        "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"
    install -Dm644 "README.md" \
        "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
