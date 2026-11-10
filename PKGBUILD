# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=capri-desktop-bin
pkgver=0.8.7
pkgrel=1
pkgdesc="Unofficial Capri desktop companion: she sits on your windows, chats and does things for you (upstream binary)"
arch=('x86_64')
url="https://github.com/lachydotmcg/capri-desktop"
license=('PolyForm-Noncommercial-1.0.0')
# The single-file bundle carries its own .NET runtime, Skia and HarfBuzz.
# These are the system libraries it still loads.
depends=('glibc' 'libgcc' 'libstdc++' 'icu' 'openssl' 'krb5' 'fontconfig'
         'libx11' 'libice' 'libsm' 'libxcursor' 'libxext' 'libxfixes' 'libxi'
         'libxrandr' 'hicolor-icon-theme')
# She calls these tools when they are there.
optdepends=('ollama: her brain on this computer'
            'wmctrl: switch and close windows on X11'
            'xdotool: minimise windows and close tabs on X11'
            'xorg-xprop: see the active window on X11'
            'libpulse: set the volume'
            'xclip: copy to the clipboard on X11'
            'wl-clipboard: copy to the clipboard on Wayland'
            'spectacle: screenshots on KDE Plasma'
            'gnome-screenshot: screenshots on GNOME'
            'grim: screenshots on other Wayland desktops'
            'scrot: screenshots on X11')
provides=('capri-desktop')
conflicts=('capri-desktop')
options=('!strip' '!debug')
_raw="https://raw.githubusercontent.com/lachydotmcg/capri-desktop/v${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/Capri-linux-x64.tar.gz"
        "capri-desktop-${pkgver}.desktop::${_raw}/cross/linux/capri-desktop.desktop"
        "capri-desktop-${pkgver}.png::${_raw}/cross/icon.png"
        "LICENSE-${pkgver}.md::${_raw}/LICENSE.md")
sha256sums=('76ffc2e0e342e721f766fdc36c759a298decd82dc42f8fa96dd24b97d91eb319' 'ef76e759b9ff07156b3bffc636ebfd5a9130c89f9ebe52c1528926da831f2d07' '44b66c419fa47820a9af8a2a80324315f0621d1b3b3b13b322fe5c71975dd9ad' '0dfe0f5fd9fd5ea4bb2e43e228a340e2551a1734dcb646a2dabe211c26ed2d63')

package() {
  install -Dm755 Capri/Capri -t "$pkgdir/opt/capri-desktop"
  install -d "$pkgdir/usr/bin"
  ln -s /opt/capri-desktop/Capri "$pkgdir/usr/bin/capri-desktop"

  # upstream's entry, with the command of this package
  sed 's/^Exec=Capri$/Exec=capri-desktop/' "capri-desktop-${pkgver}.desktop" \
    | install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/capri-desktop.desktop"
  install -Dm644 "capri-desktop-${pkgver}.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/capri-desktop.png"

  install -Dm644 "LICENSE-${pkgver}.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
