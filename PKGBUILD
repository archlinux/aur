# Maintainer: Michael Straube <straubem@gmx.de>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>

pkgbase=gods
pkgname=('gods' 'gods-extra-music')
pkgver=0.9
pkgrel=1
pkgdesc='Gods Deluxe, remake of the platform game Gods by Bitmap Brothers'
arch=('any')
url='http://jotd.pagesperso-orange.fr/gods/'
license=('custom')
depends=('java-runtime')
makedepends=('setconf' 'gendesk')
source=("https://jotd.pagesperso-orange.fr/gods/GodsDeluxe-${pkgver/./_}.zip"
        "http://jotd.free.fr/gods/Gods_extra_music.zip"
        "gods.png::http://www.androidfreeware.net/software_images/gods.thumb.png")
sha256sums=('38fe593a9ed361c65e4a4c36dd4940cde8c847849f1d5e9f15eb940089428a9c'
            '0b92f6e8a056362af481343df2e31eb001b55e43065556e6f4c625b8933c9ca7'
            'd40a00737cfcc82bb4b24110ac5d162da5dddf6041a5d83b94a2c0104ac3a2e3')
noextract=('Gods_extra_music.zip')

prepare() {
  find Gods -type f -iname "*.bat" -delete
  find Gods -type f -iname "*.dll" -delete
  setconf Gods/gods.sh GODS_ROOT_DIR "/usr/share/gods"
  chmod +x Gods/scripts/gods_loader.sh
  gendesk -f --pkgname=$pkgname --pkgdesc="$pkgdesc"

  mkdir Music
  bsdtar -xf Gods_extra_music.zip -C Music
}

package_gods() {
  optdepends=('gods-extra-music: mp3 music pack')

  install -d "$pkgdir/usr/share"
  cp -r Gods "$pkgdir/usr/share/gods"
  install -Dm755 Gods/gods.sh "$pkgdir/usr/bin/gods"
  rm -f "$pkgdir/usr/share/gods/gods.sh"
  install -Dm644 Gods/readme.txt "$pkgdir/usr/share/licenses/$pkgname/readme.txt"
  install -Dm644 gods.desktop "$pkgdir/usr/share/applications/gods.desktop"
  install -Dm644 gods.png "$pkgdir/usr/share/pixmaps/gods.png"
}

package_gods-extra-music() {
  pkgdesc='Gods Deluxe, mp3 music pack'
  depends=('gods')

  install -d "$pkgdir"/usr/share/{gods,licenses/$pkgname}
  cp -r Music/Gods/music "$pkgdir/usr/share/gods"
  ln -s /usr/share/licenses/gods/readme.txt \
    "$pkgdir/usr/share/licenses/$pkgname/readme.txt"
}
