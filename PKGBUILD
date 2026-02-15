# Maintainer: enos muthiani @lyznne <emuthiani26@gmail.com>
pkgname=peek-cli
project=peek
pkgver=2.0.3
pkgrel=1
pkgdesc="A simple file viewer that opens files in the default web browser."
arch=('x86_64')
url="https://github.com/lyznne/${project}"
license=('MIT' 'Apache-2.0')
depends=('gcc-libs')
makedepends=('cargo' 'rust' 'nodejs' 'pnpm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lyznne/${project}/archive/v${pkgver}.tar.gz")
sha256sums=('5bc9a61998a60c0a0174b320a71bae2b1511ce2e184432eabc1955754182aeec')


build() {
    cd "${srcdir}/${project}-${pkgver}"

    # ── Frontend ──────────────────────────────────────────────────────────────
    cd frontend

    # --reporter=silent suppresses per-package install lines
    # --ignore-scripts skips noisy postinstall hooks
    pnpm install --frozen-lockfile --reporter=silent --ignore-scripts 2>/dev/null

    pnpm build --silent 2>/dev/null

    cd ..

    # ── Rust ──────────────────────────────────────────────────────────────────
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cargo build --release --locked --quiet
}

check() {
    cd "${srcdir}/${project}-${pkgver}"
    cargo test --release --locked --quiet
}

package() {
    strip "${pkgdir}/usr/bin/${pkgname}" || true
    cd "${srcdir}/${project}-${pkgver}"
    install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    # Shell completions
    install -Dm644 "completions/${pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
    install -Dm644 "completions/${pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
    install -Dm644 "completions/${pkgname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
}
