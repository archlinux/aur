# Maintainer: nathawat <nathawat[at]noreply[dot]codeberg[dot]org>

pkgname=quantumlauncher
pkgver=0.5.1
pkgrel=1
pkgdesc="A simple, powerful Minecraft launcher"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/Mrmayman/quantumlauncher"
license=('GPL-3.0-only')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
optdepends=('java-runtime: external Java runtime for Minecraft Java Edition')
conflicts=('quantumlauncher-bin')

_appid=io.github.Mrmayman.QuantumLauncher
_tag=v${pkgver}

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${_tag}.tar.gz")

b2sums=(
    'ddcb5d86808e552772fade4b6edccf0f1e143e6da01e36036cf25c9105d79638f0658129c27f59abf91ee071a2b9817aeec2dc16ab50daf2d29266035da77a0b'
)

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    cargo fetch --locked
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    cargo build --frozen --release --package quantum_launcher \
        --no-default-features \
        --features wgpu
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm755 target/release/quantum_launcher \
        "${pkgdir}/usr/bin/quantum-launcher"

    ln -s quantum-launcher "${pkgdir}/usr/bin/${pkgname}"

    local _size
    for _size in 32 128 256 512; do
        install -Dm644 "assets/icon/${_size}x${_size}/ql_logo.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/${_appid}.png"
    done

    install -Dm644 assets/freedesktop/quantum-launcher.desktop \
        "${pkgdir}/usr/share/applications/${_appid}.desktop"

    install -Dm644 assets/freedesktop/quantum-launcher.metainfo.xml \
        "${pkgdir}/usr/share/metainfo/${_appid}.metainfo.xml"

    install -Dm644 README.md \
        "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
