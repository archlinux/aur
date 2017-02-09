# Maintainer: Étienne Deparis <etienne@depar.is>

pkgname=molotov
pkgver=1.2.2
pkgrel=1
pkgdesc="Molotov gives a streaming access to french TV channels."
arch=('i686' 'x86_64')
url="http://www.molotov.tv/"
license=('unknown')
depends=('fuse' 'gconf' 'desktop-file-utils' 'xdg-utils')
makedepends=('p7zip')
options=('!strip')
source=("http://desktop-auto-upgrade.molotov.tv/linux/Molotov-${pkgver}.AppImage"
        'molotov')
sha256sums=('f34e1d4eeefb71fb373c427209114af89ef7765bded2c8e6990a07f864c966ad'
            '2be51f427383ccf086485dc49f5d93855550598371b5ea9e583d4a7d6726534e')

build() {
  cd $srcdir
  sed -i "s/Exec=AppRun/Exec=molotov/" Molotov.desktop
  sed -i "s/Categories=AudioVideo/Categories=Video;Player;AudioVideo;/" Molotov.desktop

  sed -i "s/MOLOTOV_VERSION/${pkgver}/g" molotov
  chmod 755 usr/share/icons
}

package() {
  cd $srcdir

  install -d -m755 $pkgdir/usr/share/{applications,icons/hicolor}
  install -d -m755 $pkgdir/opt/appimages
  # TODO find a decent license
  #install -d -m755 $pkgdir/usr/share/licenses/$pkgname

  for icon_dir in usr/share/icons/default/*; do
    size=$(basename $icon_dir)
    install -d -m755 $pkgdir/usr/share/icons/hicolor/$size/apps
    install -D -m644 $icon_dir/apps/Molotov.png $pkgdir/usr/share/icons/hicolor/$size/apps/Molotov.png
  done

  install -D -m644 Molotov.desktop $pkgdir/usr/share/applications/appimagekit-Molotov.desktop
  install -D -m755 molotov $pkgdir/usr/bin/molotov
  install -D -m755 Molotov-$pkgver.AppImage $pkgdir/opt/appimages/Molotov-$pkgver.AppImage
}
