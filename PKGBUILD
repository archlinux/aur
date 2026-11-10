# Maintainer: xander-lin <xander-lin@users.noreply.github.com>

pkgname=screenshot-niri
pkgver=0.2.2
pkgrel=1
pkgdesc="Screenshot tool for niri compositor — normal and long/scroll capture with frozen-background selection overlay (prebuilt; x86_64 auto-selects v3/generic)"
arch=('x86_64' 'aarch64')
url="https://github.com/xander-lin/screenshot-niri"
license=('MIT')
conflicts=('screenshot-plain')
source_x86_64=(
    "${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}-niri/${pkgname}-${pkgver}-x86_64.tar.gz"
    "${pkgname}-${pkgver}-x86_64-generic.tar.gz::${url}/releases/download/v${pkgver}-niri/${pkgname}-${pkgver}-x86_64-generic.tar.gz"
)
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}-niri/${pkgname}-${pkgver}-aarch64.tar.gz")
sha256sums_x86_64=(
    'e67b1fa4c1a7bd61a92348dc1e44047cd8926a83e38168ca758d4e72ae43f75c'
    '0086b2d84ea8b9d3de5bbcf3d7c0ecaf51688b913a7846a37491766686045145'
)
sha256sums_aarch64=('035287554c178fdcf43ccf35997be6d8324d9ebbb04430f2e1e2a8dcab20b272')

# Both x86_64 tarballs are downloaded; prepare() extracts only the one this CPU
# can run. Keeping both in source_x86_64 makes .SRCINFO honest (it cannot
# express a conditional source) without a machine-dependent PKGBUILD.
noextract=(
    "${pkgname}-${pkgver}-x86_64.tar.gz"
    "${pkgname}-${pkgver}-x86_64-generic.tar.gz"
    "${pkgname}-${pkgver}-aarch64.tar.gz"
)

# x86-64-v3 = AVX, AVX2, BMI1/2, F16C, FMA, MOVBE, LZCNT (AMD reports ABM).
_has_x86_64_v3() {
    local flags="${1:-$(grep -m1 '^flags' /proc/cpuinfo 2>/dev/null)}"
    local feature
    for feature in avx avx2 bmi1 bmi2 f16c fma movbe; do
        [[ " $flags " == *" $feature "* ]] || return 1
    done
    [[ " $flags " == *" lzcnt "* || " $flags " == *" abm "* ]]
}

prepare() {
    local asset
    case "$CARCH" in
        x86_64)
            if _has_x86_64_v3; then
                asset="${pkgname}-${pkgver}-x86_64.tar.gz"
            else
                asset="${pkgname}-${pkgver}-x86_64-generic.tar.gz"
            fi
            ;;
        aarch64)
            asset="${pkgname}-${pkgver}-aarch64.tar.gz"
            ;;
        *)
            printf 'unsupported architecture: %s\n' "$CARCH" >&2
            return 1
            ;;
    esac
    bsdtar -xf "$srcdir/$asset" -C "$srcdir"
}

package() {
    install -Dm755 "${pkgname}-${pkgver}/screenshot" "$pkgdir/usr/bin/screenshot"
    install -Dm644 "${pkgname}-${pkgver}/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "${pkgname}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
