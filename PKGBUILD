# Maintainer: prevter <prevter@gmail.com>
pkgname=blam-bin
pkgver=2.3.0
pkgrel=1
pkgdesc="Fast and lightweight LOC counter (Bazillion Lines Analyzed in Milliseconds)"
arch=('x86_64' 'aarch64')
url="https://github.com/prevter/blam"
license=('MIT')
depends=('glibc')
provides=('blam')
conflicts=('blam')

_url_base="https://github.com/prevter/blam/releases/download/v${pkgver}"
_license_file="https://raw.githubusercontent.com/prevter/blam/v${pkgver}/LICENSE.md"

source_aarch64=(
    "${pkgname}-${pkgver}-aarch64.tar.gz::${_url_base}/blam-v${pkgver}-linux-aarch64-glibc.tar.gz"
    "LICENSE-${pkgver}.md::${_license_file}"
)

source_x86_64=(
    "${pkgname}-${pkgver}-x86_64.tar.gz::${_url_base}/blam-v${pkgver}-linux-amd64-glibc.tar.gz"
    "${pkgname}-${pkgver}-x86_64-v3.tar.gz::${_url_base}/blam-v${pkgver}-linux-amd64-v3-glibc.tar.gz"
    "LICENSE-${pkgver}.md::${_license_file}"
)

noextract=(
    "${pkgname}-${pkgver}-x86_64.tar.gz"
    "${pkgname}-${pkgver}-x86_64-v3.tar.gz"
)

sha256sums_aarch64=(
    'c45e42329606cc94711d824a60c2425cb7a8f277e789a41536119379b06a4b69'
    'SKIP'
)

sha256sums_x86_64=(
    'fa442361770f98c4af30ba4a3c2e5fbd718acd5f246f30c835364fd03b796e05'
    '15dc6833afcbfc71afb2d57ed4243c28f2e96962c2d2c190ccefc4d8424cd3fd'
    'SKIP'
)

package() {
    if [[ "$CARCH" == "x86_64" ]]; then
        local archive="${pkgname}-${pkgver}-x86_64.tar.gz"

        if /usr/bin/ld.so --help | grep -q "x86-64-v3 (supported"; then
            archive="${pkgname}-${pkgver}-x86_64-v3.tar.gz"
            echo "==> Using x86-64-v3 optimized build"
        fi

        bsdtar -xof "${srcdir}/${archive}" -C "${srcdir}"
    fi

    install -Dm755 "${srcdir}/blam" "${pkgdir}/usr/bin/blam"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
