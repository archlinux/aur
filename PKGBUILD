# Maintainer: asafelobotomy <213836723+asafelobotomy@users.noreply.github.com>
#
# qbit Plugin Manager from its release AppImage (bundles its own Python),
# unpacked (no FUSE needed).

pkgname=qbit-plugin-dl-bin
_name=qbit-plugin-dl
pkgver=0.2.1
pkgrel=1
pkgdesc='Finds and installs qBittorrent search plugins from allowlisted catalogs'
arch=('x86_64')
url='https://github.com/asafelobotomy/qbit-plugin-dl'
license=('MIT')
# The bundled Python, PySide6 and Tk link against these system libraries.
depends=('bash' 'glibc' 'at-spi2-core' 'brotli' 'cairo' 'dbus' 'expat' 'fontconfig'
         'freetype2' 'gdk-pixbuf2' 'glib2' 'gtk3' 'harfbuzz' 'hicolor-icon-theme' 'krb5'
         'libcups' 'libdrm' 'libglvnd' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage'
         'libxext' 'libxfixes' 'libxkbcommon' 'libxkbcommon-x11' 'libxrandr' 'libxtst'
         'mesa' 'pango' 'systemd-libs' 'util-linux-libs' 'wayland' 'zlib' 'zstd')
optdepends=('qbittorrent: the client the plugins are for'
            'qbittorrent-enhanced: or the Enhanced Edition'
            'qbittorrent-enhanced-nox: or its headless engine (as uQbit uses)')
provides=("$_name")
conflicts=("$_name")
options=('!strip' '!debug')
# The release asset's name carries no version: name the download by it.
source=("$_name-$pkgver-x86_64.AppImage::$url/releases/download/v$pkgver/$_name-x86_64.AppImage")
sha256sums=('43bd1684d54697dcd8c1fffdfd9192b5908cfc75fb9659e2d25cc62fb75af104')

prepare() {
  chmod +x "$_name-$pkgver-x86_64.AppImage"
  rm -rf squashfs-root
  "./$_name-$pkgver-x86_64.AppImage" --appimage-extract >/dev/null
}

package() {
  install -d "$pkgdir/opt/$_name"
  cp -a squashfs-root/. "$pkgdir/opt/$_name/"
  find "$pkgdir/opt/$_name" -type d -exec chmod 755 {} +
  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$_name/AppRun" "$pkgdir/usr/bin/$_name"
  sed "s|^Exec=.*|Exec=$_name|" "squashfs-root/$_name.desktop" |
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_name.desktop"
  install -Dm644 "squashfs-root/$_name.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$_name.png"
  install -Dm644 squashfs-root/opt/python3.12/lib/python3.12/site-packages/qbit_plugin_dl-$pkgver.dist-info/licenses/LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
