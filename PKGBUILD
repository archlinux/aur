# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgbase=ollama-bin
pkgname=(ollama-bin ollama-cuda12-bin ollama-cuda13-bin ollama-vulkan-bin)
pkgver=0.32.4
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

install="ollama.install"

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "ollama.conf"
        "ollama-cuda.conf"
        "ollama-vulkan.conf"
        "ollama.service"
        "ollama-cuda.service"
        "ollama-vulkan.service"
        "sysusers.conf"
        "tmpfiles.d"
        "ollama.install")
source_x86_64=("ollama-${arch[0]}-${pkgver}.tzst::${url}/releases/download/v${pkgver}/ollama-linux-${_barch[0]}.tar.zst")
source_aarch64=("ollama-${arch[1]}-${pkgver}.tzst::${url}/releases/download/v${pkgver}/ollama-linux-${_barch[1]}.tar.zst")
sha256sums=('5934ed2ce0d15154bcdb9c85203210abac0da4314af34081e36df4599f90b226'
            '38f94429ec63c78f2c87dc47ff2bbba91bd93edd697c638b9daa7eda3ae5adb2'
            '964956597a56ab8a27f081510b41fb1d60e22c543bbd7267e23dca4ce3334461'
            '5a502d9eab47078f9136b127d72289b3083934c222c7735c4585d0dbc3fef893'
            'b990b0807a787440598c999c12cdd73b08f31f6ad1dacf4cd1127e08b9485a42'
            '719e1e15d5dbaa35044c0f946e6a44ae458ba0c30f82dfa50edf8275ec078717'
            '138f38a3ab5582d7a2f9f21c98a8a1112e3afb767e32cc348cb320938874104b'
            '1e471f14e3e423ee2a5b36c4c948801a20bb91586a821b751ae46913eeb99a7f'
            '14e2e267be85b6943f66dfe60e73f5e0a611eaf40ee69a4cc0d497d071392cf4'
            '137e1d50a5f3058c30a73b7bb3c323888d225e6a7ae47564be869827db0659a3'
            'c45babd58b56b10ece2c652b67ca3104ed0ceaf4d6041b846be4e71dbd669c2d')
sha256sums_x86_64=('c00efcc236e87168e55cad9ca7c57817762dad04ccfc4565546935facf22e359')
sha256sums_aarch64=('a170d6e1cce330b26b7e6a1ff4e75357afe402a342eb73ab80e79c16d7db6868')


package_ollama-bin() {
    backup=('etc/ollama.conf')

    cd "${srcdir}/" || exit

    install -Dm755 "./bin/ollama" "${pkgdir}/usr/bin/ollama"

    install -dm755 "${pkgdir}/usr/lib/ollama/"
    for lib in "./lib/ollama/"*; do
        if [ -f "${lib}" ]; then
            cp -P "${lib}" "${pkgdir}/usr/lib/ollama/"
        fi
    done

    install -Dm644 "./ollama.service" "${pkgdir}/usr/lib/systemd/system/ollama.service"

    install -Dm644 "./ollama.conf" "${pkgdir}/etc/ollama.conf"

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

    backup=('etc/ollama-cuda.conf')

    cd "${srcdir}/" || exit

    install -Dm644 "./ollama-cuda.service" "${pkgdir}/usr/lib/systemd/system/ollama.service.d/01-cuda.conf"

    install -Dm644 "./ollama-cuda.conf" "${pkgdir}/etc/ollama-cuda.conf"

    install -dm755 "${pkgdir}/usr/lib/ollama/"
    for lib in "./lib/ollama/cuda_v12/"*; do
        if [ -f "${lib}" ]; then
            cp -P "${lib}" "${pkgdir}/usr/lib/ollama/"
        fi
    done
}

package_ollama-cuda13-bin() {
    pkgdesc='Create, run and share large language models (LLMs) with CUDA 13'

    provides=("ollama-cuda13")
    depends=("ollama-bin" "nvidia-libgl")
    conflicts=("ollama-cuda" "ollama-cuda12" "ollama-vulkan")

    backup=('etc/ollama-cuda.conf')

    cd "${srcdir}/" || exit

    install -Dm644 "./ollama-cuda.service" "${pkgdir}/usr/lib/systemd/system/ollama.service.d/01-cuda.conf"

    install -Dm644 "./ollama-cuda.conf" "${pkgdir}/etc/ollama-cuda.conf"

    install -dm755 "${pkgdir}/usr/lib/ollama/"
    for lib in "./lib/ollama/cuda_v13/"*; do
        if [ -f "${lib}" ]; then
            cp -P "${lib}" "${pkgdir}/usr/lib/ollama/"
        fi
    done
}

package_ollama-vulkan-bin() {
    pkgdesc='Create, run and share large language models (LLMs) with Vulkan'

    provides=("ollama-vulkan")
    depends+=("ollama-bin" "vulkan-driver")
    conflicts=("ollama-cuda" "ollama-cuda12" "ollama-cuda13")

    backup=('etc/ollama-vulkan.conf')

    cd "${srcdir}/" || exit

    install -Dm644 "./ollama-vulkan.service" "${pkgdir}/usr/lib/systemd/system/ollama.service.d/01-vulkan.conf"

    install -Dm644 "./ollama-vulkan.conf" "${pkgdir}/etc/ollama-vulkan.conf"

    install -dm755 "${pkgdir}/usr/lib/ollama/"
    for lib in "./lib/ollama/vulkan/"*; do
        if [ -f "${lib}" ]; then
            cp -P "${lib}" "${pkgdir}/usr/lib/ollama/"
        fi
    done
}
