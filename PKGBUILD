# Maintainer: Aaron Fischer <mail@aaron-fischer.net>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: portals <portals at riseup.net>
# Contributor: novemberist
# Contributor: PyroDevil
# Contributor: giacomogiorgianni@gmail.com

pkgname=tesseract-game
pkgver=20240512
pkgrel=1
pkgdesc='Smooth FPS with map editing, instagib, DM and CTF'
url='http://tesseract.gg/'
arch=('x86_64' 'i686')
license=('ZLIB')
depends=('libgl' 'sdl2' 'sdl2_image' 'sdl2_mixer' 'libpng' 'zlib')
makedepends=('gendesk' 'imagemagick')
source=('http://download.tuxfamily.org/tesseract/tesseract_2014_05_12_first_edition_linux.tar.xz'
        'tesseract.sh')
sha512sums=('a625775501b57c519c624bdd9b29d4f89d29c0caedbf6ad4143a65c1f9f9dc088d289953ce3d5043f3467cc8dd86ba9040e636a20a16d5114cf6e7434e089f96'
	'425c47db63c2f094fcb1f9e10687c07ee515ff6e3b0ba2d81482a608f9a41edd7107be774d8e6707354d0ce4c1c2d3d92aee99da247e16dfbadc87a0c3085e9c')

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
