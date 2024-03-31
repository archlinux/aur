# Maintainer: Brenton Horne <brentonhorne77 at gmail dot com>
pkgname=openhv-git
pkgver=r2501.61fabc8f
pkgrel=1
pkgdesc="An open-source SciFi RTS game based on OpenRA game engine."
arch=('any')
url="https://www.openhv.net"
license=('GPL3')
depends=('mono' 'openal' 'libgl' 'freetype2' 'sdl2' 'lua51' 'hicolor-icon-theme'
         'gtk-update-icon-cache' 'desktop-file-utils' 'xdg-utils' 'zenity')
makedepends=('git' 'mono-msbuild' 'unzip')
options=(!debug)
source=("git+https://github.com/OpenHV/OpenHV.git")
sha512sums=('SKIP')

pkgver() {
    cd $srcdir/OpenHV
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd OpenHV

  make RUNTIME=mono TARGETPLATFORM=unix-generic
}

package() {
  cd OpenHV

  make prefix=/usr TARGETPLATFORM=unix-generic DESTDIR="$pkgdir" install
  sed -i -e "s|./OpenRA|mono --debug /usr/lib/openhv/OpenRA.dll|g" $pkgdir/usr/bin/openhv
}
