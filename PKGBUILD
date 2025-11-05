# Maintainer: Vincent Bernardoff <vb@luminar.eu.org>

pkgname=vector-bin
_pkgbase=vector
pkgver=0.51.0
pkgrel=1
pkgdesc="A high-performance observability data pipeline"
arch=('x86_64' 'aarch64')
url="https://vector.dev"
license=("MPL-2.0")
provides=("vector")
conflicts=("vector")
backup=(
    "etc/vector/vector.toml" # Versions <0.35.0
    "etc/vector/vector.yaml"
    "etc/default/vector"
)
depends=("gcc-libs" "zlib")

source=(
    "${_pkgbase}.sysusers"
    "${_pkgbase}.tmpfiles"
)

source_x86_64=("https://github.com/vectordotdev/vector/releases/download/v${pkgver}/vector-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/vectordotdev/vector/releases/download/v${pkgver}/vector-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")

sha512sums=('4f7a5d63f4e89018d1f0e9aa0fba2bb5c448d7031a7ff40c82878f574243e075c2fca020e78c4c71b1caa1a5bd1f06b496a5d3ab432f01d145233fd6c9ec4b87'
            'c192492df09d131f9174d2acbb7f265c280eb6d678589b8c93bacc47ae55c51573a5477d715897f8580ced420730992fb68bee78b374f1cc042888ea6b5512fd')

sha512sums_x86_64=('165a70c6ac570d9e452a037ff066b6dacdb514d467405b30353a78c416cc39ceab79942cd0939d59ecd03a7e61021527f9935bf0b27d583e860c81e8dba8339d')
sha512sums_aarch64=('abac1aa343686d2720647b78ca13e79968a44f9a1a61401bd7498c67c8131d8aa6efd535f947695a72105004dd644ae0547d0f70feeeacc185d959355bb86c2b')

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
