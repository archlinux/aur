# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=whalebird-desktop-git
pkgver=4.3.4+r44+gac14090c
pkgrel=1
pkgdesc='Electron-based Mastodon/Pleroma client (git)'
arch=(i686 x86_64)
url=https://whalebird.social
license=(MIT)
provides=(whalebird-desktop)
conflicts=(whalebird-desktop whalebird-bin)
depends=(alsa-lib atk at-spi2-atk cairo dbus gdk-pixbuf2 glib2 gtk3 hicolor-icon-theme libcups libglvnd libx11 libxcb libxcomposite libxcursor libxdamage libxext libxfixes libxi libxrandr libxrender libxss libxtst nspr nss pango)
makedepends=(git npm yarn)
source=(git+https://github.com/h3poteto/whalebird-desktop
        whalebird.desktop)
sha512sums=('SKIP'
            '3e5f29fc6db305957b81abc8e4b4679fbd979bbf41ce0c190b19c31a96a3bfe03b624885961ce6d7410716d286c82548b960ebbc1e547c1cacc0b16175eecee2')

pkgver() {
  cd whalebird-desktop
  git describe --tags | sed 's#-#+#g;s#+#+r#'
}

build() {
  cd whalebird-desktop
  npm i
  npm run build
  npx electron-builder --dir
}

package() {
  install -Dm 644 whalebird.desktop -t "$pkgdir"/usr/share/applications

  cd ${pkgname/-git/}/build

  mkdir "$pkgdir"/usr/{lib,bin}
  cp -a linux-unpacked "$pkgdir"/usr/lib/${pkgname/-git/}
  ln -s /usr/lib/${pkgname/-git/}/whalebird "$pkgdir"/usr/bin/whalebird

  for i in 16 32 128 256 512; do
    install -Dm 644 icons/icon.iconset/icon_${i}x${i}.png \
      "$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/whalebird.png
  done

  install -Dm 644 ../LICENSE.txt -t "$pkgdir"/usr/share/licenses/${pkgname/-git/}
}
