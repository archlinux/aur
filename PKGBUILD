# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=whalebird-desktop
pkgver=2.8.2
pkgrel=1
pkgdesc='Electron-based Mastodon/Pleroma client'
arch=(i686 x86_64)
url=https://whalebird.org
license=(MIT)
depends=(alsa-lib atk at-spi2-atk cairo dbus gdk-pixbuf2 glib2 gtk3 hicolor-icon-theme libcups libglvnd libx11 libxcb libxcomposite libxcursor libxdamage libxext libxfixes libxi libxrandr libxrender libxss libxtst nspr nss pango)
makedepends=(npm git)
source=($pkgname-$pkgver.tar.gz::https://github.com/h3poteto/$pkgname/archive/$pkgver.tar.gz
        whalebird.desktop)
sha512sums=('969c7cec600979d7950a65a5b9bce1906737fee0c82cd70c9bd68ea168994aa0cb645716341fcd98c2a39959a75fc5226df4cdb77d54755c101797e569ac9be8'
            '3e5f29fc6db305957b81abc8e4b4679fbd979bbf41ce0c190b19c31a96a3bfe03b624885961ce6d7410716d286c82548b960ebbc1e547c1cacc0b16175eecee2')

build() {
  cd $pkgname-$pkgver
  npm i
  npm run build
  npx electron-builder --dir
}

package() {
  install -Dm 644 whalebird.desktop -t "$pkgdir"/usr/share/applications

  cd $pkgname-$pkgver/build

  mkdir "$pkgdir"/usr/{lib,bin}
  cp -a linux-unpacked "$pkgdir"/usr/lib/$pkgname
  ln -s /usr/lib/$pkgname/whalebird "$pkgdir"/usr/bin/whalebird

  for i in 16 32 128 256 512; do
    install -Dm 644 icons/icon.iconset/icon_${i}x${i}.png \
      "$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/whalebird.png
  done

  install -Dm 644 ../LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname
}
