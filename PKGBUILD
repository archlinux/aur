# Maintainer: Étienne Deparis <etienne@depar.is>

pkgname=molotov
pkgver=1.1.0
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
sha256sums=('9e4c699dd2346c35204fdba784bc2568ee60e14e368a2e77e9fea9c9ce90d3dc'
            '9bd2c4a0081868f6ab66b3184820e2c8929fa8df31159c3cce1fca2ae1a6bfe1')

build() {
  cd $srcdir
  sed -i "s/Exec=AppRun/Exec=molotov/" Molotov.desktop
  echo "Categories=Video;Player;AudioVideo;" >> Molotov.desktop

  sed -i "s/MOLOTOV_VERSION/${pkgver}/g" molotov
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
