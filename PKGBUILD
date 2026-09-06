# Maintainer: Ochichan <ohstar94@gmail.com>
#
# Source of truth for the AUR package `yututui-bin`. The `build` workflow substitutes
# the release version into pkgver on each v* tag; the deploy-aur action then runs
# `updpkgsums` (replacing the SKIP checksums with the real ones), regenerates .SRCINFO,
# and pushes to ssh://aur@aur.archlinux.org/yututui-bin.git. Edit this template, not the
# AUR copy.
#
# A -bin package: it reuses the exact x86_64 tarball the release already publishes
# (yututui-linux-x64.tar.gz, which contains the `ytt` binary), so there is no second
# build and the bytes match the GitHub release one-to-one.
pkgname=yututui-bin
pkgver=1.7.5
pkgrel=1
pkgdesc="Fast, low-RAM YouTube Music player for your terminal (prebuilt binary)"
arch=('x86_64')
url="https://github.com/Ochichan/Yututui"
license=('MIT')
provides=('yututui')
conflicts=('yututui')
depends=('mpv>=0.33' 'yt-dlp' 'ffmpeg')
optdepends=('xdg-utils: open the current track on the web'
            'wl-clipboard: copy text on Wayland'
            'xclip: copy text on X11'
            'xsel: copy text on X11 (alternative to xclip)')
source=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/Ochichan/Yututui/releases/download/v$pkgver/yututui-linux-x64.tar.gz"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/Ochichan/Yututui/v$pkgver/LICENSE")
sha256sums=('aeea1d5b78c63203dfc99b9bbeacb0341968c4a71dfc60a6bba161c45f64e357'
            '4187ff1dba7402a773eb6d3d588ad540e4dcf40606237f004160ee67e019ddc8')

package() {
  install -Dm755 "$srcdir/ytt" "$pkgdir/usr/bin/ytt"
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  # Launcher entry + icon (bundled in the release tarball): gives ytt an app-menu entry and
  # lets MPRIS media widgets resolve its icon by the "yututui" theme name.
  install -Dm644 "$srcdir/yututui.desktop" "$pkgdir/usr/share/applications/yututui.desktop"
  # 512x512 is a standard hicolor size; 1024x1024 is not one the icon theme spec searches,
  # so an icon left there never resolves by name and the launcher shows a blank icon.
  install -Dm644 "$srcdir/yututui.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/yututui.png"
  # Belt-and-suspenders: pixmaps is scanned as a fallback regardless of the active icon theme.
  install -Dm644 "$srcdir/yututui.png" "$pkgdir/usr/share/pixmaps/yututui.png"
}
