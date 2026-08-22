# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

pkgname=getsentry-cli-bin
_pkgname=getsentry-cli
pkgver=0.43.0
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
sha256sums_x86_64=('3003d78a3c0740acc39584009ca2dd6f28da9f0365cb2853d89c43a42a1f160b')
sha256sums_aarch64=('c4d059de567fbba9445c40666ff372b6ef9196a2d52310754802db4f469d361c')

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
