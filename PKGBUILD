# Maintainer: sTiKyt <stikyt@proton.me>

_pkgname=oh-my-openagent
pkgname=omo-bin
pkgver=5.1.23
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
        _omo_sha=c98b3e9fd44c5ac1a60187212820dfb886240af60489171ee0851c6b7300f4c3
        grep -qwi avx2 /proc/cpuinfo || {
            _asset=omo-linux-x64-baseline
            _omo_sha=e95087689fbb7879bf1720e64ed085945a28cf0d3f183846faa6c6d416751cfc
        }
        ;;
    aarch64)
        _asset=omo-linux-arm64
        _omo_sha=0f4d4e316e4a003931ddd78145cd8ba544b1f5e5a9b626642535d92e022a2618
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
