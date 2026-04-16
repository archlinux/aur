# Maintainer: Qingxu <me@linioi.com>
pkgname=positron-ide-bin
pkgver=2026.04.1.10
_upstream_pkgver=${pkgver%.*}-${pkgver##*.}
pkgrel=1
pkgdesc='A next-generation data science IDE from Posit'
arch=(
    'x86_64'
    'aarch64'
)
url='https://github.com/posit-dev/positron'
license=(
    'Elastic-2.0'
)
depends=(
    'alsa-lib'
    'at-spi2-core'
    'cairo'
    'dbus'
    'expat'
    'glib2'
    'gtk3'
    'libcups'
    'libsecret'
    'libx11'
    'libxcb'
    'libxcomposite'
    'libxdamage'
    'libxext'
    'libxfixes'
    'libxkbcommon'
    'libxkbfile'
    'libxrandr'
    'mesa'
    'nspr'
    'nss'
    'pango'
    'systemd-libs'
    'xdg-utils'
)
optdepends=(
    'bash-completion: command-line completion'
    'nodejs: Node.js runtime support'
    'python: Python runtime support'
    'r: R runtime support'
    'vulkan-intel: Intel Vulkan driver'
    'vulkan-radeon: Radeon Vulkan driver'
    'vulkan-icd-loader: Vulkan ICD loader'
    'webkit2gtk-4.1: Microsoft account authentication'
)
provides=(
    'positron-ide'
)
conflicts=(
    'positron-ide-devel-bin'
)
options=(
    '!strip'
    '!debug'
)
source_x86_64=(
    "$pkgname-$pkgver-x86_64.deb::https://cdn.posit.co/positron/releases/deb/x86_64/Positron-${_upstream_pkgver}-x64.deb"
)
source_aarch64=(
    "$pkgname-$pkgver-aarch64.deb::https://cdn.posit.co/positron/releases/deb/arm64/Positron-${_upstream_pkgver}-arm64.deb"
)
noextract=(
    "$pkgname-$pkgver-x86_64.deb"
    "$pkgname-$pkgver-aarch64.deb"
)
sha256sums_x86_64=('491cef95f76ea967e73606e07a59ca46361ea9161906a9a360762c310f9e862b')
sha256sums_aarch64=('63511c64b5cc2c654432bc11b51809717d6b2125bd2622ae67932fb4333d4e92')

package() {
    local _deb

    case "$CARCH" in
    x86_64)
        _deb="$srcdir/$pkgname-$pkgver-x86_64.deb"
        ;;
    aarch64)
        _deb="$srcdir/$pkgname-$pkgver-aarch64.deb"
        ;;
    esac

    ar p "$_deb" data.tar.xz | bsdtar -xJf - -C "$pkgdir"

    install -dm755 \
        "$pkgdir/usr/bin" \
        "$pkgdir/usr/share/licenses/$pkgname"

    ln -s /usr/share/positron/bin/positron "$pkgdir/usr/bin/positron"

    sed -i \
        -e 's|^Exec=/usr/share/positron/positron %F$|Exec=/usr/bin/positron %F|' \
        -e 's|^Exec=/usr/share/positron/positron --new-window %F$|Exec=/usr/bin/positron --new-window %F|' \
        "$pkgdir/usr/share/applications/positron.desktop"

    sed -i \
        -e 's|^Exec=/usr/share/positron/positron --open-url %U$|Exec=/usr/bin/positron --open-url %U|' \
        "$pkgdir/usr/share/applications/positron-url-handler.desktop"

    chmod 4755 "$pkgdir/usr/share/positron/chrome-sandbox"

    # Fix world-writable files from upstream .deb
    find "$pkgdir" -type f -perm /0002 -exec chmod o-w {} +

    install -Dm644 \
        "$pkgdir/usr/share/positron/resources/app/LICENSE.txt" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 \
        "$pkgdir/usr/share/positron/resources/app/NOTICE" \
        "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
    install -Dm644 \
        "$pkgdir/usr/share/positron/resources/app/ThirdPartyNotices.txt" \
        "$pkgdir/usr/share/licenses/$pkgname/ThirdPartyNotices.txt"
    install -Dm644 \
        "$pkgdir/usr/share/positron/LICENSES.chromium.html" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
}
