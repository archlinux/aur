# Maintainer: NickMarcha
#
# The prebuilt Linux release from https://github.com/NickMarcha/MacroPad. The release workflow sets pkgver and the
# checksum and pushes this to the AUR. Installs the app under /opt/macropad with a "package-managed" marker, so it
# never updates itself and tells you to update through pacman instead.
pkgname=macropad-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="Program MINI_KEYBOARD macropads and use their keys for Home Assistant, Bragi audio and profiles"
arch=('x86_64')
url="https://github.com/NickMarcha/MacroPad"
license=('PolyForm-Noncommercial-1.0.0')
# Avalonia draws with Skia on X11 or XWayland; .NET is bundled in the binary.
depends=('glibc' 'gcc-libs' 'zlib' 'libx11' 'libice' 'libsm' 'libxext' 'libxrandr' 'libxcursor' 'libxi'
         'fontconfig' 'freetype2' 'systemd-libs')
provides=('macropad')
conflicts=('macropad')
install=macropad-bin.install
# The single-file binary carries a bundle that stripping would break.
options=('!strip' '!debug')
source=("https://github.com/NickMarcha/MacroPad/releases/download/v${pkgver}/MacroPad-${pkgver}-linux-x64.tar.gz")
sha256sums=('0d86c9d4ca6317ac14d4b6e4fb54b94fcb44df4b3ec37a4112dbe5685eebf677')

package() {
    local dir="MacroPad-${pkgver}-linux-x64"
    install -Dm755 "$dir/MacroPad" "$pkgdir/opt/macropad/MacroPad"
    echo "pacman (the AUR package macropad-bin)" > "$pkgdir/opt/macropad/package-managed"
    install -d "$pkgdir/usr/bin"
    ln -s /opt/macropad/MacroPad "$pkgdir/usr/bin/macropad"
    install -Dm644 "$dir/70-macropad.rules" "$pkgdir/usr/lib/udev/rules.d/70-macropad.rules"
    install -Dm644 "$dir/macropad.desktop" "$pkgdir/usr/share/applications/macropad.desktop"
    install -Dm644 "$dir/macropad.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/macropad.png"
    install -Dm644 "$dir/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
    install -Dm644 "$dir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
