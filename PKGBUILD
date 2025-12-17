# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=vot-cli-live
pkgver=1.7.5
pkgrel=1
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
b2sums=('818a8667aadcf4e7bd96e634957ace120f6cb50661636ad9139f4d9a9c8c35228f783822e157443a83cce1cbf1c70e26b274e3cfdd5d27cbb6c2e6aa3b41495f')

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
