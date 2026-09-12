# Maintainer: Robin Trioux <robin@trioux.eu>
pkgname=nanopb-bin
pkgver=0.4.9.2
pkgrel=1
pkgdesc="Protocol Buffers implementation for embedded systems - prebuilt generator"
arch=('x86_64')
url="https://github.com/nanopb/nanopb"
license=('Zlib')

provides=("nanopb=${pkgver}")
conflicts=('nanopb')

source=(
    "${pkgname}-${pkgver}::https://github.com/nanopb/nanopb/releases/download/nanopb-${pkgver}/nanopb-${pkgver}-linux-x86.tar.gz"
)

sha256sums=('7e05f5908f0dff5d91cb90d11ca487876de8ec274695887959b3903e4b307887')

package() {
    cd "${srcdir}/nanopb-${pkgver}-linux-x86"

    # Install the complete self-contained binary distribution.
    install -dm755 "${pkgdir}/usr/share/nanopb"
    cp -a . "${pkgdir}/usr/share/nanopb/"

    # Main generator.
    install -dm755 "${pkgdir}/usr/bin"
    ln -s /usr/share/nanopb/generator-bin/nanopb_generator \
        "${pkgdir}/usr/bin/nanopb_generator"

    # protoc bundled by nanopb.
    if [[ -x "${pkgdir}/usr/share/nanopb/generator-bin/protoc" ]]; then
        ln -s /usr/share/nanopb/generator-bin/protoc \
            "${pkgdir}/usr/bin/nanopb-protoc"
    fi

    # protoc plugin, if supplied by this release.
    if [[ -x "${pkgdir}/usr/share/nanopb/generator-bin/protoc-gen-nanopb" ]]; then
        ln -s /usr/share/nanopb/generator-bin/protoc-gen-nanopb \
            "${pkgdir}/usr/bin/protoc-gen-nanopb"
    fi

    # Upstream license.
    if [[ -f LICENSE.txt ]]; then
        install -Dm644 LICENSE.txt \
            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
    elif [[ -f LICENSE ]]; then
        install -Dm644 LICENSE \
            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
