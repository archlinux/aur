# Maintainer: sTiKyt <stikyt@proton.me>

_pkgname=oh-my-openagent
pkgname=omo-bin
pkgver=5.1.35
pkgrel=1
pkgdesc="OmO Native - standalone omo coding-agent CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/code-yeongyu/oh-my-openagent"
license=('custom:SUL-1.0')
depends=('glibc')
provides=('omo')
conflicts=('omo')
options=('!strip')

# Upstream ships bun-compiled binaries as release assets; x64 has AVX2 and
# -baseline builds. Pick per CPU; hashes pinned from upstream SHA256SUMS.
_asset=
_omo_sha=
case ${CARCH} in
    x86_64)
        _asset=omo-linux-x64
        _omo_sha=2c1fc9b76ce40c8011c4d0938ebd54c77f71c731639d063deeb1875387787bbe
        grep -qwi avx2 /proc/cpuinfo || {
            _asset=omo-linux-x64-baseline
            _omo_sha=9bed8b005234433f5e09a4834ad3e17bf84557b584b3b71c6f2466fdd539e296
        }
        ;;
    aarch64)
        _asset=omo-linux-arm64
        _omo_sha=15797720ce05f66a19bceb8617b180be9d631e60a8cc035bfe653305611efcb5
        ;;
esac

_release=https://github.com/code-yeongyu/${_pkgname}/releases/download/v${pkgver}

source=("${_asset}::${_release}/${_asset}"
        "LICENSE.md::https://github.com/code-yeongyu/${_pkgname}/raw/v${pkgver}/LICENSE.md")
sha256sums=("${_omo_sha}"
            'b61ac928f152d13517328263e6bee9175b928f9ab696a2d2ca2b6cfd961ddc32')

prepare() {
    # Sanity check (as upstream's installer does): launcher must answer.
    chmod +x "${_asset}"
    ./"${_asset}" --version
}

package() {
    install -Dm755 "${_asset}" "$pkgdir/usr/bin/omo"

    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
