# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgbase=ollama-bin
pkgname=(ollama-bin ollama-cuda12-bin ollama-cuda13-bin)
pkgver=0.12.10
pkgrel=1
pkgdesc="Create, run and share large language models (LLMs)"
arch=('x86_64')
_barch=('amd64')
url='https://github.com/ollama/ollama'
_urlraw="https://raw.githubusercontent.com/ollama/ollama/v${pkgver}"
license=('MIT')

provides=("ollama")
conflicts=("ollama")
depends=("glibc" "gcc-libs")
optdepends=("ollama-cuda: NVIDIA GPU Support")

backup=('etc/ollama.conf')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("ollama-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/ollama-linux-${_barch[0]}.tgz"
               "ollama.conf"
               "ollama.service"
               "sysusers.conf"
               "tmpfiles.d")
sha256sums=('5934ed2ce0d15154bcdb9c85203210abac0da4314af34081e36df4599f90b226'
            'b2e4561b83730ea40fea2d91cc7003c2cbd1e715d4ef19b6fa22240f7ab88d1e')
sha256sums_x86_64=('8f4bf70a9856a34ba71355745c2189a472e2691a020ebd2e242a58e4d2094722'
                   '2503546a6d26559bce06ba6c61100026d85864b4c49bd6e4c80c596c5d22e197'
                   '24871ffd940212e04e9bd3c334cfd4e3c4e845b374c5d0ed369fd32496b05fdb'
                   '14e2e267be85b6943f66dfe60e73f5e0a611eaf40ee69a4cc0d497d071392cf4'
                   '137e1d50a5f3058c30a73b7bb3c323888d225e6a7ae47564be869827db0659a3')


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
