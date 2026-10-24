# Maintainer: xander-lin <xander-lin@users.noreply.github.com>

pkgname=screenshot-plain
pkgver=0.2.1
pkgrel=2
pkgdesc="Lightweight wlroots Wayland screenshot tool — plain variant (normal screenshots, supports Niri/Hyprland/Sway/Wayfire/River) (prebuilt; x86_64 auto-selects v3/generic)"
arch=('x86_64' 'aarch64')
url="https://github.com/xander-lin/screenshot-niri"
license=('MIT')
conflicts=('screenshot-niri')
source_x86_64=(
    "${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}-plain/${pkgname}-${pkgver}-x86_64.tar.gz"
    "${pkgname}-${pkgver}-x86_64-generic.tar.gz::${url}/releases/download/v${pkgver}-plain/${pkgname}-${pkgver}-x86_64-generic.tar.gz"
)
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}-plain/${pkgname}-${pkgver}-aarch64.tar.gz")
sha256sums_x86_64=(
    '436faccc18b65b06e89214a990e343fca76cdd52ea3c706fb30d7eed3cf2f912'
    'ac1cdec6c4e1c200440f062bbc64055d22cfa249964816c2437ffb31ed3e3afc'
)
sha256sums_aarch64=('f834d128979a266deeea01f27355a7a800189b32387571d9063c6a6fa64a730b')

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
