# Maintainer: sTiKyt <stikyt@proton.me>

_pkgname=oh-my-openagent
pkgname=omo-bin
pkgver=5.1.17
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
        _omo_sha=251243a4bea65a5a7322a1ecf70b5d074a7bb0c4acf9f82c12b77eea6dc5185e
        grep -qwi avx2 /proc/cpuinfo || {
            _asset=omo-linux-x64-baseline
            _omo_sha=0b8658ef7e98c01409f1bb8cb8fda3e456bf48488276a6a39130117a7119e60e
        }
        ;;
    aarch64)
        _asset=omo-linux-arm64
        _omo_sha=7e6bb3709348813e885adeca52d1192be0e68cd4d851500e8ee956086812570f
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
