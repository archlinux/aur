# Maintainer: Edmundo Sanchez <zomundo at gmail dot com>
pkgname=colibri-bin
pkgver=2.1.0
pkgrel=2
pkgdesc='Tiny local inference engine for large MoE models (prebuilt)'
arch=('x86_64')
url='https://github.com/JustVugg/colibri'
license=('Apache-2.0')
depends=('python' 'gcc-libs')
makedepends=('npm')
optdepends=(
    'python-numpy: image/audio features and converters'
    'python-pillow: multimodal image input'
    'python-huggingface-hub: model download helpers for convert'
)
provides=('colibri')
conflicts=('colibri')
source=(
    "https://github.com/JustVugg/colibri/releases/download/v${pkgver}/colibri-v${pkgver}-linux-x86_64.tar.gz"
    # Release tarball ships an empty web/dist, so build the `coli web` dashboard from source
    "colibri-src-${pkgver}.tar.gz::https://github.com/JustVugg/colibri/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('d54b4c57c12417fc9e784b649249ac1aa3480eec44ece2777d4cbc639a25e66a'
            '040077036d6c6183e99281e1a7304d195e60b6b0984c7deb53f027819d2a5bc4')

build() {
    cd "${srcdir}/colibri-${pkgver}/web"
    npm ci --no-audit --no-fund --cache "${srcdir}/npm-cache"
    npm run build
}

package() {
    local libexec="${pkgdir}/usr/libexec/colibri"

    install -dm755 "${pkgdir}/usr/bin"
    install -dm755 "${libexec}/tools"
    install -dm755 "${libexec}/web/dist"
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"

    # Launcher on PATH; engines and support files under libexec (upstream layout).
    # coli resolves web/dist and ui/ relative to its real path, so keep it in
    # libexec next to the engines and symlink it onto PATH.
    install -Dm755 "${srcdir}/coli" "${libexec}/coli"
    ln -s ../libexec/colibri/coli "${pkgdir}/usr/bin/coli"

    install -Dm755 "${srcdir}/colibri" "${libexec}/colibri"
    install -Dm755 "${srcdir}/gliner_decide" "${libexec}/gliner_decide"
    install -Dm755 "${srcdir}/glm53" "${libexec}/glm53"
    install -Dm755 "${srcdir}/inkling" "${libexec}/inkling"
    install -Dm755 "${srcdir}/kimi_k3" "${libexec}/kimi_k3"
    install -Dm755 "${srcdir}/laya" "${libexec}/laya"
    install -Dm755 "${srcdir}/mimo" "${libexec}/mimo"
    install -Dm755 "${srcdir}/olmoe" "${libexec}/olmoe"
    install -Dm755 "${srcdir}/qwen36" "${libexec}/qwen36"
    install -Dm755 "${srcdir}/qwen38" "${libexec}/qwen38"
    install -Dm755 "${srcdir}/deepseek_v4" "${libexec}/deepseek_v4"
    install -Dm755 "${srcdir}/deepseek_v41" "${libexec}/deepseek_v41"
    install -Dm755 "${srcdir}/qwenimage" "${libexec}/qwenimage"

    install -Dm644 "${srcdir}/family_registry.py" "${libexec}/family_registry.py"
    install -Dm644 "${srcdir}/resource_plan.py" "${libexec}/resource_plan.py"
    install -Dm644 "${srcdir}/doctor.py" "${libexec}/doctor.py"
    install -Dm644 "${srcdir}/autotune.py" "${libexec}/autotune.py"
    install -Dm644 "${srcdir}/openai_server.py" "${libexec}/openai_server.py"
    install -Dm644 "${srcdir}/cluster.py" "${libexec}/cluster.py"
    install -Dm644 "${srcdir}/image_engine.py" "${libexec}/image_engine.py"
    install -Dm644 "${srcdir}/mcp_server.py" "${libexec}/mcp_server.py"
    install -Dm644 "${srcdir}/setup_catalog.py" "${libexec}/setup_catalog.py"
    install -Dm644 "${srcdir}/setup_download.py" "${libexec}/setup_download.py"
    install -Dm644 "${srcdir}/setup_flow.py" "${libexec}/setup_flow.py"
    install -Dm644 "${srcdir}/setup_hw.py" "${libexec}/setup_hw.py"
    install -Dm644 "${srcdir}/term_image.py" "${libexec}/term_image.py"
    install -Dm644 "${srcdir}/v4_dsml.py" "${libexec}/v4_dsml.py"
    install -Dm644 "${srcdir}/v41_dsml.py" "${libexec}/v41_dsml.py"
    install -Dm644 "${srcdir}/version.py" "${libexec}/version.py"

    install -Dm644 "${srcdir}/tools/"* "${libexec}/tools/"
    # Vulkan SPIR-V shaders shipped next to the engines in the upstream tarball
    install -dm755 "${libexec}/shaders"
    install -Dm644 "${srcdir}/shaders/"* "${libexec}/shaders/"
    cp -a "${srcdir}/colibri-${pkgver}/web/dist/." "${libexec}/web/dist/"
    # `coli ui` chat frontend
    install -dm755 "${libexec}/ui"
    install -Dm644 "${srcdir}/ui/"* "${libexec}/ui/"

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

check() {
    "${srcdir}/coli" --help >/dev/null
}
