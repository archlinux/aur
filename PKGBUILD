# Maintainer: Martin Kopecký <kopecky@thekrew.app>
pkgname=sleepy-gui-bin
pkgver=0.6.1
pkgrel=1
pkgdesc='Desktop app converting OpenAPI 3 specifications into Insomnia, Postman or Bruno collections'
arch=('x86_64')
url='https://gitlab.com/kopytkg/sleepy'
license=('BSD-3-Clause')
# The app is self-contained; these are what its native libraries dlopen.
depends=('glibc' 'fontconfig' 'freetype2' 'libpng' 'libx11' 'openssl' 'icu' 'zlib' 'brotli' 'bzip2' 'expat')
optdepends=('xorg-server-xwayland: run on a Wayland session')
provides=('sleepy-gui')
conflicts=('sleepy-gui')
options=('!strip')

_registry="https://gitlab.com/api/v4/projects/84670021/packages/generic/sleepy"
source=("sleepy-gui-$pkgver.tar.gz::$_registry/v$pkgver/sleepy-gui-linux-x64.tar.gz"
        "LICENSE-$pkgver::$url/-/raw/v$pkgver/LICENSE")
sha256sums=('92fab209b6de8c5940c85f2258381bf4f63c34c262bcbfb635718b0055fde7d7'
            '765f202dfca30d8f4370bed3870c01b4fb40f7e4070d6cd84e24b250aebf2f69')

package() {
  local appdir="$pkgdir/usr/lib/sleepy-gui"
  install -dm755 "$appdir"

  # The published folder is the application: the binary, its runtime, the
  # launchers, and the assets. Everything else here just points at it.
  cp -a "$srcdir"/* "$appdir/"
  rm -f "$appdir"/LICENSE-* "$appdir"/sleepy-gui-*.tar.gz "$appdir/install.sh"
  chmod 755 "$appdir/sleepy-gui" "$appdir"/*.sh

  install -dm755 "$pkgdir/usr/bin"
  ln -s /usr/lib/sleepy-gui/sleepy-gui "$pkgdir/usr/bin/sleepy-gui"
  for session in x11 wayland console; do
    ln -s "/usr/lib/sleepy-gui/sleepy-gui-$session.sh" "$pkgdir/usr/bin/sleepy-gui-$session"
  done

  install -Dm644 "$appdir/sleepy-gui-x11.desktop" \
    "$pkgdir/usr/share/applications/sleepy-gui-x11.desktop"
  install -Dm644 "$appdir/sleepy-gui-wayland.desktop" \
    "$pkgdir/usr/share/applications/sleepy-gui-wayland.desktop"
  install -Dm644 "$appdir/sleepy-gui.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/sleepy-gui.png"

  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
