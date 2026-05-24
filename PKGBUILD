# Maintainer: buzz <buzz@users.noreply.github.com>
pkgname=volctl
pkgver=1.0.0
pkgrel=2
pkgdesc="Per-application volume control for GNU/Linux desktops"
arch=("x86_64" "aarch64")
url="https://buzz.github.io/volctl/"
license=("GPL3")
makedepends=("cargo")
depends=("gtk4" "gtk4-layer-shell" "glib2" "cairo" "libpulse")
optdepends=("pavucontrol: mixer support"
            "statusnotifier-introspection-dbus-menu: SNI support")
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/buzz/volctl/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=("531c3fae34b21b48b10edcf4ed8aaff4384dac16746c2b390bd627c62aeaf0571b90384c96d029bd759c48b810b053f261ae2cdfb1a71e26c70059463570639e")

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "${pkgname}-${pkgver}"
    cargo fetch --locked --target "${CARGO_BUILD_TARGET:-host-tuple}"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "${pkgname}-${pkgver}"
    cargo build --frozen --release
}

package() {
    local src="${srcdir}/${pkgname}-${pkgver}"

    # Install binary
    install -Dm0755 "${src}/target/release/${pkgname}" \
        "${pkgdir}/usr/bin/${pkgname}"

    # Install GSettings schema
    install -Dm644 "${src}/data/apps.${pkgname}.gschema.xml" \
        "${pkgdir}/usr/share/glib-2.0/schemas/apps.${pkgname}.gschema.xml"

    # Install desktop file
    install -Dm644 "${src}/data/${pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Install license
    install -Dm644 "${src}/LICENSE.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
