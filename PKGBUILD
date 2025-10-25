# Maintainer: Vincent Bernardoff <vb@luminar.eu.org>

pkgname=vector-bin
_pkgbase=vector
pkgver=0.50.0
pkgrel=1
pkgdesc="A high-performance observability data pipeline"
arch=('x86_64' 'aarch64')
url="https://vector.dev"
license=("MPL-2.0")
backup=(
    "etc/vector/vector.toml" # Versions <0.35.0
    "etc/vector/vector.yaml"
    "etc/default/vector"
)
depends=("gcc-libs" "zlib")

source=(
    "https://github.com/vectordotdev/vector/releases/download/v${pkgver}/vector-${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz"
    "${_pkgbase}.sysusers"
    "${_pkgbase}.tmpfiles"
)
sha512sums=('SKIP'
            '4f7a5d63f4e89018d1f0e9aa0fba2bb5c448d7031a7ff40c82878f574243e075c2fca020e78c4c71b1caa1a5bd1f06b496a5d3ab432f01d145233fd6c9ec4b87'
            'c192492df09d131f9174d2acbb7f265c280eb6d678589b8c93bacc47ae55c51573a5477d715897f8580ced420730992fb68bee78b374f1cc042888ea6b5512fd')

package() {
    install -Dm644 "${_pkgbase}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgbase}.conf"
    install -Dm644 "${_pkgbase}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgbase}.conf"

    cd "${srcdir}/vector-${CARCH}-unknown-linux-gnu"

    for f in LICENSE NOTICE; do
        install -Dm644 "$f" "${pkgdir}/usr/share/licenses/${_pkgbase}/$f"
    done

    install -Dm755 "bin/vector" "${pkgdir}/usr/bin/vector"

    install -Dm644 "config/vector.yaml" "${pkgdir}/etc/vector/vector.yaml"
    chmod 0550 "${pkgdir}/etc/vector"
    mkdir -p "${pkgdir}/usr/share/doc/${_pkgbase}"
    cp -r config/examples "${pkgdir}/usr/share/doc/${_pkgbase}/examples"

    install -Dm644 "etc/systemd/vector.service" "${pkgdir}/usr/lib/systemd/system/vector.service"
    install -Dm644 "etc/systemd/hardened-vector.service" "${pkgdir}/usr/lib/systemd/system/hardened-vector.service"
    install -Dm644 "etc/systemd/vector.default" "${pkgdir}/etc/default/vector"
}
