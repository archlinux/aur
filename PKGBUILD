# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

pkgname=getsentry-cli-bin
_pkgname=getsentry-cli
pkgver=0.44.1
pkgrel=1
pkgdesc="Official Sentry developer CLI by getsentry/cli (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/getsentry/cli"
license=('LicenseRef-FSL-1.1-Apache-2.0')
depends=('glibc' 'gcc-libs')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!strip')

source=("LICENSE-${pkgver}::${url}/raw/${pkgver}/LICENSE.md")
source_x86_64=("${pkgname}-${pkgver}-x86_64.gz::${url}/releases/download/${pkgver}/sentry-linux-x64.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.gz::${url}/releases/download/${pkgver}/sentry-linux-arm64.gz")
noextract=(
    "${pkgname}-${pkgver}-x86_64.gz"
    "${pkgname}-${pkgver}-aarch64.gz"
)

sha256sums=('c51f382a888f8f59f54a72af01e2d72032f2ba8f31d8194f8bf489123438195a')
sha256sums_x86_64=('5f0730824c27474322c5136a74776ae8e088bd3a96675da89c5d49008310a3ab')
sha256sums_aarch64=('7705338fc8bc62edc68d6baf033024e3685477a1421e25492c1f82e52136080f')

package() {
    install -d "${pkgdir}/usr/bin"
    gzip -cd "${srcdir}/${pkgname}-${pkgver}-${CARCH}.gz" > "${pkgdir}/usr/bin/sentry"
    chmod 755 "${pkgdir}/usr/bin/sentry"
    "${pkgdir}/usr/bin/sentry" cli completion bash > "${srcdir}/sentry.bash"
    "${pkgdir}/usr/bin/sentry" cli completion zsh > "${srcdir}/_sentry"
    "${pkgdir}/usr/bin/sentry" cli completion fish > "${srcdir}/sentry.fish"
    install -Dm644 "${srcdir}/sentry.bash" \
        "${pkgdir}/usr/share/bash-completion/completions/sentry"
    install -Dm644 "${srcdir}/_sentry" \
        "${pkgdir}/usr/share/zsh/site-functions/_sentry"
    install -Dm644 "${srcdir}/sentry.fish" \
        "${pkgdir}/usr/share/fish/vendor_completions.d/sentry.fish"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
