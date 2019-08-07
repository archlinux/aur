# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=yuna
pkgver=1.3.9
pkgrel=1
pkgdesc='Anime player integating AniList, Crunchyroll, and Hidive'
arch=(i686 x86_64)
url=https://yuna.moe
license=(AGPL3)
depends=(alsa-lib atk at-spi2-atk at-spi2-core cairo dbus gdk-pixbuf2 glib2 gtk3 hicolor-icon-theme libcups libx11 libxcb libxcomposite libxcursor libxdamage libxext libxfixes libxi libxrandr libxrender libxss libxtst nspr nss pango)
makedepends=(yarn 'nodejs>=10' python2)
options=(!strip)
source=($pkgname-$pkgver.tar.gz::https://github.com/BeeeQueue/yuna/archive/v$pkgver.tar.gz
        electron-builder.patch
        yuna.desktop)
sha512sums=('519f3ec59b265a757b17617e26d55a36486cbf63785386c894b5afc055ca958c96d8fbe1c08d5d3b69cfeb76dc4b7a6dd798db4c946b1b9991e1febb9d3e5470'
            'e6b50f112b1123e0308edb0fd28a7ebaf56af006b6c20fc6fbc078f95fdf85b9f5e5f024951b7a10599cdaeaee6f47ead9647c3698615216e774976100c354e7'
            '8cff81afac9ed702d14bfdf28cc8f5db83895360ab7b68c94aa59e260cf3a0c94597a6a083f86cd00a9b85be751a263879eca7ed25d8a91a8a0cc6c3f36a393a')

prepare() {
  cd $pkgname-$pkgver
  # Tell Electron Builder to only target a directory build
  patch -Np1 < ../electron-builder.patch
}

build() {
  cd $pkgname-$pkgver
  yarn
  yarn build
}

package() {
  install -Dm 644 yuna.desktop -t "$pkgdir"/usr/share/applications

  cd yuna-$pkgver

  mkdir "$pkgdir"/usr/{lib,bin}
  cp -a dist_electron/linux-unpacked "$pkgdir"/usr/lib/yuna
  ln -s /usr/lib/yuna/yuna "$pkgdir"/usr/bin

  for i in 64 128 256 512; do
    install -Dm 644 public/icons/${i}x${i}.png \
      "$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/yuna.png
  done

  install -Dm 644 LICENSE.md -t "$pkgdir"/usr/share/licenses/yuna
}
