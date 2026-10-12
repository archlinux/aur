# Maintainer: Kazoku <k4zoku@pm.me>
# Contributor: sxlvia <qt715 at proton dot me>

_pkgbase=vosulay
pkgname=${_pkgbase}-git
pkgver=1.2.1.r2.gfe36000
pkgrel=1
pkgdesc='In-game overlay for vosu and tosu-compatible counters (git version)'
arch=('x86_64')
url='https://github.com/shiruviaa/vosulay'
license=('MIT' 'BSD-3-Clause' 'CC-BY-4.0')
depends=(
    'alsa-lib'
    'at-spi2-core'
    'cairo'
    'dbus'
    'expat'
    'glib2'
    'libcups'
    'libx11'
    'libxcb'
    'libxcomposite'
    'libxdamage'
    'libxext'
    'libxfixes'
    'libxkbcommon'
    'libxrandr'
    'mesa'
    'nspr'
    'nss'
    'pango'
    'systemd-libs'
    'wayland'
    'hicolor-icon-theme'
)
makedepends=('git' 'cargo')
provides=("${_pkgbase}")
conflicts=("${_pkgbase}")
options=('!lto' '!strip' '!debug')
source=("${_pkgbase}::git+${url}.git#branch=main")
sha256sums=('SKIP')

_toolchain() {
    sed -n 's/^channel *= *"\(.*\)"/\1/p' "${srcdir}/${_pkgbase}/rust-toolchain.toml"
}

pkgver() {
    cd "${_pkgbase}"
    git describe --long --tags --abbrev=7 --always --match 'v[0-9]*' \
        | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${_pkgbase}"
    RUSTUP_TOOLCHAIN="$(_toolchain)"
    export RUSTUP_TOOLCHAIN
    if command -v rustup >/dev/null; then
        rustup toolchain install "$RUSTUP_TOOLCHAIN" --profile minimal
    fi
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${_pkgbase}"
    export XDG_CACHE_HOME="${srcdir}/cache"
    RUSTUP_TOOLCHAIN="$(_toolchain)"
    export RUSTUP_TOOLCHAIN
    export CARGO_TARGET_DIR=target
    export VOSULAY_PACKAGE_BUILD=1
    cargo build --frozen --release -p vosulay
    cargo build --frozen --release -p vosulay-overlay -p vosulay-lookup
    local cef
    cef="$(cargo run --frozen --quiet --release -p vosulay-cef-tools \
        -- acquire --platform "linux-${CARCH}")"
    rm -rf "${srcdir}/stage"
    cargo run --frozen --quiet --release -p vosulay-cef-tools \
        -- package --platform "linux-${CARCH}" \
        --cef-path "$cef" --output "${srcdir}/stage" \
        --exe target/release/vosulay \
        --overlay target/release/libvosulay_overlay.so \
        --overlay target/release/libvosulay_lookup.so \
        --overlay crates/overlay-linux/VkLayer_vosulay_overlay.json
}

package() {
    cd "${_pkgbase}"
    install -d "${pkgdir}/usr/lib/${_pkgbase}" "${pkgdir}/usr/bin"
    cp -a "${srcdir}/stage/." "${pkgdir}/usr/lib/${_pkgbase}/"
    chmod 4755 "${pkgdir}/usr/lib/${_pkgbase}/chrome-sandbox"
    ln -s "/usr/lib/${_pkgbase}/vosulay" "${pkgdir}/usr/bin/vosulay"
    install -Dm644 packaging/linux/com.vosu.vosulay.desktop \
        "${pkgdir}/usr/share/applications/com.vosu.vosulay.desktop"
    install -Dm644 assets/branding/vosulay-app-icon.svg \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/com.vosu.vosulay.svg"
    install -Dm644 LICENSE \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 assets/branding/LICENSE.md \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-branding.md"
    ln -s "/usr/lib/${_pkgbase}/LICENSE.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-CEF.txt"
    ln -s "/usr/lib/${_pkgbase}/THIRD_PARTY_NOTICES.md" \
        "${pkgdir}/usr/share/licenses/${pkgname}/THIRD_PARTY_NOTICES.md"
}
