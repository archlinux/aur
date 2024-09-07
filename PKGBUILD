# Maintainer: TheDL98 <ahmed at thedl98 dot com>
# Contributor: solarbaron

pkgname=feishin
pkgver=0.8.1
pkgrel=1
pkgdesc='A modern self-hosted music player.'
arch=('x86_64' 'aarch64')
url='https://github.com/jeffvli/feishin'
license=('GPL-3.0-only')
makedepends=('npm')
optdepends=('mpv: Alternative audio backend')
conflicts=("feishin-git" "feishin-bin")
source=(
	"${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
    "feishin.desktop"
)
sha256sums=('f233ae9ee7b85e3676c2ecd374a77607b378a5946153904f641f58a607e90f06'
            '17f4e5c319e625198ffe2032045657e0d33db1d9d64f534bfc2d40f6082fd5db')

build() {
  cd $pkgname-$pkgver
  export npm_config_cache="$(mktemp -d)"
  npm install --legacy-peer-deps
  npm run package
  rm -rf "$npm_config_cache"
}

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/share/$pkgname"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/applications"
  cp -r "$pkgname-$pkgver/release/build/linux-unpacked/"* "$pkgdir/usr/share/$pkgname"
  install -Dm644 "$pkgdir/usr/share/feishin/resources/assets/icons/icon.png" "$pkgdir/usr/share/pixmaps/${pkgname%}.png"
  ln -s /usr/share/feishin/feishin "${pkgdir}/usr/bin/feishin"
  install -Dm644 feishin.desktop "$pkgdir/usr/share/applications/"
}
