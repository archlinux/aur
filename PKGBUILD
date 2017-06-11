# Maintainer: Étienne Deparis <etienne@depar.is>

pkgname=molotov
pkgver=1.5.1
pkgrel=1
pkgdesc="Molotov gives a streaming access to french TV channels."
arch=('i686' 'x86_64')
url="http://www.molotov.tv/"
license=('unknown')
depends=('fuse' 'gconf' 'desktop-file-utils' 'xdg-utils')
makedepends=('p7zip')
options=('!strip')
source=("Molotov-${pkgver}.AppImage::http://desktop-auto-upgrade.molotov.tv/linux/${pkgver}/molotov"
        'molotov')
sha256sums=('99ee816e777e9547a9d15ec9a3317d9f75e7d39eaeecfe78355b4a88c36fc674'
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
