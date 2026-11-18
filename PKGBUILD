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
    '5db404228402a6a8b6e4b78b3095d91fc1b596032699b323fb96e134c7694c40'
    '2957a54e92e8b715cd49d87611fae9053e0245178da165a399255656f1c6383c'
)
sha256sums_aarch64=('037d54fda1224145834b1051fd82421750f2c0b07ed2e8a078781d84e464266a')

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
