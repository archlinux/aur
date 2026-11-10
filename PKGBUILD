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
    'e33a214998f13a020dd4c1351d65532c37b2e17fd1d58717de02e1e7ba98938b'
    'a0c6bd33acbb7ccc1b424dd74759867925e76a35a5da51b7cb216e075ae98765'
)
sha256sums_aarch64=('a653ce6010b926ea55ec2002aea4f296980659fe9577fe4b19fa847f94899864')

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
