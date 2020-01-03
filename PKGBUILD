# Maintainer: Aaron Fischer <mail@aaron-fischer.net>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: portals <portals at riseup.net>
# Contributor: novemberist
# Contributor: PyroDevil
# Contributor: giacomogiorgianni@gmail.com

pkgname=tesseract-game
pkgver=1
pkgrel=12
_revision=2226
pkgdesc='Smooth FPS with map editing, instagib, DM and CTF'
url='http://tesseract.gg/'
arch=('x86_64' 'i686')
license=('ZLIB')
depends=('libgl' 'sdl2' 'sdl2_image' 'sdl2_mixer' 'libpng' 'zlib')
makedepends=('subversion' 'gendesk' 'imagemagick')
source=("tesseract::svn://svn.tuxfamily.org/svnroot/tesseract/main#revision=$_revision"
        'tesseract.sh')
sha256sums=('SKIP'
            '34a03fb87b3f3e1f16d1744d42f566a36e67cbdeaee1876281857b341002566b')

prepare() {
  gendesk -f -n --pkgname ${pkgname/-game} --pkgdesc "$pkgdesc" --exec "$pkgname"
  for dim in 16 32 48 64 128 256 512; do
    convert -resize "${dim}x${dim}" tesseract/media/interface/cube.png "$pkgname$dim.png" 2> /dev/null
  done
}

build() {
  make -C tesseract/src
}

package() {
  local n=tesseract
  cd "$n"
  make -C src install
  install -d "$pkgdir/usr/share/$pkgname/"
  cp -R media/ config/ "$pkgdir/usr/share/$pkgname"
  install -Dm755 bin_unix/native_client "$pkgdir/usr/bin/$n-client"
  install -Dm755 bin_unix/native_server "$pkgdir/usr/bin/$n-server"
  install -Dm644 "src/readme_$n.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 "../$n.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "../$n.desktop" "$pkgdir/usr/share/applications/$n.desktop"
  for dim in 16 32 48 64 128 256 512; do
    install -Dm644 "../$pkgname$dim.png" \
      "$pkgdir/usr/share/icons/hicolor/${dim}x$dim/apps/$n.png"
  done
  install -Dm644 "../${pkgname}48.png" "$pkgdir/usr/share/pixmaps/$n.png"
}
