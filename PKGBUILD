# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=vot-cli-live
pkgver=1.7.2
pkgrel=2
pkgdesc="VOT-CLI with Yandex live voices support"
arch=(any)
url="https://github.com/fantomcheg/$pkgname"
license=(Unlicense)
depends=(nodejs)
makedepends=(npm)
optdepends=(
  'ffmpeg: for merging video and audio streams'
  'yt-dlp: for downloading original video and audio'
)
provides=(${pkgname%-live})
conflicts=(${pkgname%-live})
options=(!debug)
source=($url/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('3de8194c5ee43dc40c35bcc3e17fa7a94d6d8ea411c6ec94fa3dd23477308d063833e1a3536ef984daa2cb7528c70cf9f2d7139f0961941aa0249a8fb2a0649e')

prepare() {
  cd $pkgname-$pkgver
  npm ci --omit=dev --ignore-scripts
}

package() {
  cd $pkgname-$pkgver
  find src          -type f -exec  install -vDm 644 "{}" "$pkgdir/usr/lib/node_modules/$pkgname/{}" \;
  install -vDm 755 src/index.js -t $pkgdir/usr/lib/node_modules/$pkgname/src/
  find node_modules -type f -exec  install -vDm 644 "{}" "$pkgdir/usr/lib/node_modules/$pkgname/{}" \;
  install -vDm 644 package.json -t $pkgdir/usr/lib/node_modules/$pkgname/

  install -vd "$pkgdir"/usr/bin
  ln -s /usr/lib/node_modules/$pkgname/src/index.js "$pkgdir"/usr/bin/$pkgname
}
