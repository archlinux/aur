# Maintainer: Qingxu <me@linioi.com>

pkgname=yesplaymusic
pkgver=3.0.0
pkgrel=1
pkgdesc="Desktop music player with a plugin system"
arch=('x86_64')
url="https://github.com/qier222/YesPlayMusic"
license=('GPL-3.0-or-later')
conflicts=(
    'yesplaymusic-bin'
    'yesplaymusic-electron'
    'yesplaymusic-git'
)
depends=(
    'gtk3'
    'hicolor-icon-theme'
    'mpv' # dlopened at runtime by media_kit (libmpv.so)
)
makedepends=(
    'patchelf'
)
optdepends=(
    'xdg-utils: open URLs with default browser'
)
install="$pkgname.install"
options=('!strip' '!debug')
source=(
    "YesPlayMusic-${pkgver}-linux-x64.tar.gz::https://github.com/qier222/YesPlayMusic/releases/download/v${pkgver}/YesPlayMusic-${pkgver}-linux-x64.tar.gz"
)
sha256sums=('fab6f80713727b7009e475b8cb740117de58ae4350b8059e816cc09cb0381a03')

package() {
    local _src="$srcdir/YesPlayMusic-${pkgver}-linux-x64"

    install -Dm755 "$_src/yesplaymusic" "$pkgdir/usr/lib/$pkgname/yesplaymusic"
    cp -a "$_src/data" "$_src/lib" "$pkgdir/usr/lib/$pkgname/"
    chmod -R u=rwX,go=rX "$pkgdir/usr/lib/$pkgname"

    # Replace hardcoded CI runner RUNPATH in bundled Flutter plugins
    find "$pkgdir/usr/lib/$pkgname/lib" -maxdepth 1 -name '*_plugin.so' \
        -exec patchelf --set-rpath '$ORIGIN' {} \;

    install -dm755 "$pkgdir/usr/bin"
    ln -sf "/usr/lib/$pkgname/yesplaymusic" "$pkgdir/usr/bin/yesplaymusic"

    install -Dm644 "$_src/yesplaymusic.desktop" \
        "$pkgdir/usr/share/applications/yesplaymusic.desktop"
    install -Dm644 "$_src/yesplaymusic.png" \
        "$pkgdir/usr/share/icons/hicolor/512x512/apps/yesplaymusic.png"
}
