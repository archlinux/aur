# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgbase=ollama-bin
pkgname=(ollama-bin ollama-cuda12-bin ollama-cuda13-bin ollama-mlx-cuda13-bin ollama-vulkan-bin)
pkgver=0.18.0
pkgrel=1
pkgdesc="Create, run and share large language models (LLMs)"
arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')
url='https://github.com/ollama/ollama'
_urlraw="https://raw.githubusercontent.com/ollama/ollama/v${pkgver}"
license=('MIT')

provides=("ollama")
conflicts=("ollama")
depends=("glibc" "gcc-libs")
optdepends=("ollama-cuda12: NVIDIA GPU Support"
            "ollama-cuda13: NVIDIA GPU Support"
            "ollama-vulkan: GPU Support")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "ollama.conf"
        "ollama.service"
        "sysusers.conf"
        "tmpfiles.d")
source_x86_64=("ollama-${arch[0]}-${pkgver}.tzst::${url}/releases/download/v${pkgver}/ollama-linux-${_barch[0]}.tar.zst")
source_aarch64=("ollama-${arch[1]}-${pkgver}.tzst::${url}/releases/download/v${pkgver}/ollama-linux-${_barch[1]}.tar.zst")
sha256sums=('5934ed2ce0d15154bcdb9c85203210abac0da4314af34081e36df4599f90b226'
            '5d0db6dde80f969f2e9bdb4724529c1590df0bda84d43d75921cebcf5edb3311'
            '2503546a6d26559bce06ba6c61100026d85864b4c49bd6e4c80c596c5d22e197'
            '24871ffd940212e04e9bd3c334cfd4e3c4e845b374c5d0ed369fd32496b05fdb'
            '14e2e267be85b6943f66dfe60e73f5e0a611eaf40ee69a4cc0d497d071392cf4'
            '137e1d50a5f3058c30a73b7bb3c323888d225e6a7ae47564be869827db0659a3')
sha256sums_x86_64=('e364aedc9a991cbf36f704baa807a04f432d46e32265b783e7dec9ce0336af88')
sha256sums_aarch64=('73ce31231f7255de6dc48fb5e8cdfa3edb422a6678b169f4f1d4cfdf7998e123')


package_ollama-bin() {
    backup=('etc/ollama.conf')

    cd "${srcdir}/" || exit

    install -Dm755 "./bin/ollama" "${pkgdir}/usr/bin/ollama"

    install -dm755 "${pkgdir}/usr/lib/ollama/"
    for lib in "./lib/ollama/lib"*; do
        cp -P "${lib}" "${pkgdir}/usr/lib/ollama/"
    done

    install -Dm644 "./ollama.conf" "${pkgdir}/etc/ollama.conf"

    install -Dm644 "./ollama.service" "${pkgdir}/usr/lib/systemd/system/ollama.service"

    install -Dm644 "./sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/ollama.conf"
    install -Dm644 "./tmpfiles.d" "${pkgdir}/usr/lib/tmpfiles.d/ollama.conf"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -dm755 "${pkgdir}/var/lib/ollama"
    ln -s "/var/lib/ollama" "${pkgdir}/usr/share/ollama"
}

package_ollama-cuda12-bin() {
    pkgdesc='Create, run and share large language models (LLMs) with CUDA 12'

    provides=("ollama-cuda12")
    depends=("ollama-bin" "nvidia-libgl")
    conflicts=("ollama-cuda" "ollama-cuda13" "ollama-vulkan")

    cd "${srcdir}/" || exit

    install -dm755 "${pkgdir}/usr/lib/ollama/"
    for lib in "./lib/ollama/cuda_v12/lib"*; do
        cp -P "${lib}" "${pkgdir}/usr/lib/ollama/"
    done
}

package_ollama-cuda13-bin() {
    pkgdesc='Create, run and share large language models (LLMs) with CUDA 13'

    provides=("ollama-cuda13")
    depends=("ollama-bin" "nvidia-libgl")
    optdepends=("ollama-mlx-cuda13-bin: Image Generation")
    conflicts=("ollama-cuda" "ollama-cuda12" "ollama-vulkan")

    cd "${srcdir}/" || exit

    install -dm755 "${pkgdir}/usr/lib/ollama/"
    for lib in "./lib/ollama/cuda_v13/lib"*; do
        cp -P "${lib}" "${pkgdir}/usr/lib/ollama/"
    done
}

package_ollama-mlx-cuda13-bin() {
    pkgdesc='Create, run and share large language models (LLMs) with MLX CUDA 13 (Image Generation)'

    provides=("ollama-mlx")
    depends+=("ollama-cuda13")
    conflicts=("ollama-cuda" "ollama-cuda12" "ollama-vulkan")

    cd "${srcdir}/" || exit

    install -dm755 "${pkgdir}/usr/lib/ollama/"
    for lib in "./lib/ollama/mlx_cuda_v13/lib"*; do
        cp -P "${lib}" "${pkgdir}/usr/lib/ollama/"
    done

    find "${pkgdir}/usr/lib/ollama/" -xtype l -delete
}

package_ollama-vulkan-bin() {
    pkgdesc='Create, run and share large language models (LLMs) with Vulkan'

    provides=("ollama-vulkan")
    depends+=("ollama-bin" "vulkan-driver")
    conflicts=("ollama-cuda" "ollama-cuda12" "ollama-cuda13")

    cd "${srcdir}/" || exit

    install -dm755 "${pkgdir}/usr/lib/ollama/"
    for lib in "./lib/ollama/vulkan/lib"*; do
        cp -P "${lib}" "${pkgdir}/usr/lib/ollama/"
    done
}
