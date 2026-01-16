# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgbase=ollama-bin
pkgname=(ollama-bin ollama-cuda12-bin ollama-cuda13-bin)
pkgver=0.14.2
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
optdepends=("ollama-cuda: NVIDIA GPU Support")

backup=('etc/ollama.conf')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "ollama.conf"
        "ollama.service"
        "sysusers.conf"
        "tmpfiles.d")
source_x86_64=("ollama-${arch[0]}-${pkgver}.tzst::${url}/releases/download/v${pkgver}/ollama-linux-${_barch[0]}.tar.zst")
source_aarch64=("ollama-${arch[1]}-${pkgver}.tzst::${url}/releases/download/v${pkgver}/ollama-linux-${_barch[1]}.tar.zst")
sha256sums=('5934ed2ce0d15154bcdb9c85203210abac0da4314af34081e36df4599f90b226'
            '0cb33f7c07e7bc81d185c1f81da26e20701e351bcf108093fa1b59b9ada90cfa'
            '2503546a6d26559bce06ba6c61100026d85864b4c49bd6e4c80c596c5d22e197'
            '24871ffd940212e04e9bd3c334cfd4e3c4e845b374c5d0ed369fd32496b05fdb'
            '14e2e267be85b6943f66dfe60e73f5e0a611eaf40ee69a4cc0d497d071392cf4'
            '137e1d50a5f3058c30a73b7bb3c323888d225e6a7ae47564be869827db0659a3')
sha256sums_x86_64=('a65ae9f8a725153ce92a94b806d1fa8c93a8fbe8f2c95dce09529fb14c41271f')
sha256sums_aarch64=('1c0d0b8a7e746fd1841e1202d9a92b0b411e4e75664bb3b725c3a140296dd810')


package_ollama-bin() {
    cd "${srcdir}/" || exit

    install -Dm755 "./bin/ollama" "${pkgdir}/usr/bin/ollama"

    for lib in 'libggml-base.so' \
        'libggml-cpu-alderlake.so' \
        'libggml-cpu-haswell.so' \
        'libggml-cpu-icelake.so' \
        'libggml-cpu-sandybridge.so' \
        'libggml-cpu-skylakex.so' \
        'libggml-cpu-sse42.so' \
        'libggml-cpu-x64.so'
    do
        install -Dm755 "./lib/ollama/${lib}" "${pkgdir}/usr/lib/ollama/${lib}"
    done

    install -Dm644 "./ollama.conf" "${pkgdir}/etc/ollama.conf"

    install -Dm644 "./ollama.service" "${pkgdir}/usr/lib/systemd/system/ollama.service"

    install -Dm644 "./sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/ollama.conf"
    install -Dm644 "./tmpfiles.d" "${pkgdir}/usr/lib/tmpfiles.d/ollama.conf"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -dm755 "${pkgdir}/var/share"
    install -dm755 "${pkgdir}/var/lib/ollama"
    ln -s "${pkgdir}/var/lib/ollama" "${pkgdir}/usr/share/ollama"
}

package_ollama-cuda12-bin() {
    pkgdesc='Create, run and share large language models (LLMs) with CUDA 12'

    conflicts=("ollama-cuda")
    provides=("ollama-cuda")
    depends+=("ollama-bin")

    cd "${srcdir}/" || exit

    for lib in 'libggml-cuda.so' ; do
        install -Dm755 "./lib/ollama/cuda_v12/${lib}" "${pkgdir}/usr/lib/ollama/${lib}"
    done

    for cudalib in 'libcublasLt' 'libcublas' 'libcudart' ; do
        cp --preserve=links --no-dereference "./lib/ollama/cuda_v12/${cudalib}"* "${pkgdir}/usr/lib/ollama/"
    done
}

package_ollama-cuda13-bin() {
    pkgdesc='Create, run and share large language models (LLMs) with CUDA 13'

    conflicts=("ollama-cuda")
    provides=("ollama-cuda")
    depends+=("ollama-bin")

    cd "${srcdir}/" || exit

    for lib in 'libggml-cuda.so' ; do
        install -Dm755 "./lib/ollama/cuda_v13/${lib}" "${pkgdir}/usr/lib/ollama/${lib}"
    done

    for cudalib in 'libcublasLt' 'libcublas' 'libcudart' ; do
        cp --preserve=links --no-dereference "./lib/ollama/cuda_v13/${cudalib}"* "${pkgdir}/usr/lib/ollama/"
    done
}
