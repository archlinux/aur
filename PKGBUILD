# Maintainer: sTiKyt <stikyt@proton.me>

_pkgname=oh-my-openagent
pkgname=omo-bin
pkgver=5.1.61
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
        _omo_sha=07cea2e6d3893771bf0ece4f1b31e9f0db1c23172cd22e464112e7d5a5ffa0dd
        grep -qwi avx2 /proc/cpuinfo || {
            _asset=omo-linux-x64-baseline
            _omo_sha=ff9197192b24e9c8fc1432a7d35e9a00afd20124b1afa0758333898fcee8f05b
        }
        ;;
    aarch64)
        _asset=omo-linux-arm64
        _omo_sha=93b93dd685f723d9914570492c77709d2d28ae81f994ff42212c76f7f0f04f4b
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
