# Maintainer: prevter <prevter@gmail.com>
pkgname=blam-bin
pkgver=2.2.2
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
    '6bd329467bcd8193ce8db5daf38a8ed3dcf4a04c0ffb25b11c2a58acb9bf4055'
    'SKIP'
)

sha256sums_x86_64=(
    'a425ced347d1cd06a983939e2eff38e99979feb598cbe1820985540bad415ce1'
    'da281c668bf0ef5a7ad8222a8e8d6f74e8d2ba6ccd1c86ef110dd7def102c7b0'
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