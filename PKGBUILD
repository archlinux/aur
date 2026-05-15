# Maintainer: me02329 <github@martial.aleeas.com>
pkgname=facegate-git
_pkgname=facegate
pkgver=0.3.1.r0.gHEAD
pkgrel=1
pkgdesc="Native facial authentication for Linux PAM (master HEAD)"
arch=('x86_64')
url="https://github.com/me02329/facegate"
license=('GPL-3.0-or-later')
depends=('onnxruntime' 'v4l-utils' 'systemd')
makedepends=('cargo' 'git' 'rust>=1.95' 'clang' 'pkgconf')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}" "${_pkgname}-bin")
install="${_pkgname}.install"
source=("${_pkgname}::git+${url}.git#branch=master")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    local cargo_ver
    cargo_ver="$(grep '^version' crates/facegate_cli/Cargo.toml | head -1 | cut -d'"' -f2)"
    printf "%s.r%s.g%s" \
        "${cargo_ver}" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "${srcdir}/${_pkgname}"
    export CARGO_TARGET_DIR="${srcdir}/target"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${srcdir}/${_pkgname}"
    export CARGO_TARGET_DIR="${srcdir}/target"
    export RUSTFLAGS="${RUSTFLAGS:-} -C strip=symbols"
    cargo build --release --frozen --workspace
}

check() {
    cd "${srcdir}/${_pkgname}"
    export CARGO_TARGET_DIR="${srcdir}/target"
    cargo test --release --frozen --workspace
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -Dm755 "${srcdir}/target/release/facegate"          "${pkgdir}/usr/bin/facegate"
    install -Dm755 "${srcdir}/target/release/facegate-brokerd"  "${pkgdir}/usr/bin/facegate-brokerd"
    install -Dm755 "${srcdir}/target/release/libpam_facegate.so" "${pkgdir}/usr/lib/security/pam_facegate.so"

    install -Dm644 config.example.toml                  "${pkgdir}/etc/facegate/config.toml"
    install -Dm644 systemd/facegate-brokerd.service     "${pkgdir}/usr/lib/systemd/system/facegate-brokerd.service"
    install -Dm644 systemd/facegate-watch.service       "${pkgdir}/usr/lib/systemd/user/facegate-watch.service"
    install -Dm644 docs/facegate.1                      "${pkgdir}/usr/share/man/man1/facegate.1"
    install -Dm644 LICENSE                              "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

    # Shell completions, best-effort — if the binary fails for any reason
    # here (extremely unlikely on a fresh build) we'd rather not break the
    # whole package.
    install -d "${pkgdir}/usr/share/bash-completion/completions"
    install -d "${pkgdir}/usr/share/zsh/site-functions"
    install -d "${pkgdir}/usr/share/fish/vendor_completions.d"
    "${srcdir}/target/release/facegate" completions bash > "${pkgdir}/usr/share/bash-completion/completions/facegate"      2>/dev/null || true
    "${srcdir}/target/release/facegate" completions zsh  > "${pkgdir}/usr/share/zsh/site-functions/_facegate"              2>/dev/null || true
    "${srcdir}/target/release/facegate" completions fish > "${pkgdir}/usr/share/fish/vendor_completions.d/facegate.fish"   2>/dev/null || true
}
