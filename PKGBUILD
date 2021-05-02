# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: kappa <kappacurve@gmail.com>

pkgname=wings3d
pkgver=2.2.5
pkgrel=4
pkgdesc='3D modeler using the winged edge data structure'
arch=(x86_64)
url='http://www.wings3d.com/' # https is not available
license=(GPL)
depends=(erlang erlang-cl erlang-sdl)
makedepends=(gendesk)
optdepends=('povray: render scenes with POV-Ray')
source=("https://downloads.sourceforge.net/project/wings/wings/$pkgver/wings-$pkgver.tar.bz2"
        wings.sh)
sha256sums=('95ecf84a8f49bc00b983643e7ccd807f64a3b8b88253037a8ccefbe7a3bedff8'
            '0b1c4a8d89196cd31411e9b388c28f241ed8e5c978732ca006d70dabf4c165d5')

prepare() {
  gendesk -f -n \
    --name 'Wings 3D' \
    --pkgname $pkgname \
    --pkgdesc "$pkgdesc" \
    --genericname '3D Modeler' \
    --categories 'Graphics;3DGraphics'
  sed -i "/desktop-id/ s/com.wings3d.WINGS.desktop/$pkgname.desktop/" ${pkgname%3d}-$pkgver/unix/wings.appdata.xml
}

build() {
  export ERL_LIBS="$srcdir"
  make -C ${pkgname%3d}-$pkgver unix
}

package() {
  install -Dm755 wings.sh "$pkgdir/usr/bin/$pkgname"
  install -Dm644 -t "$pkgdir/usr/share/applications" $pkgname.desktop
  cd ${pkgname%3d}-$pkgver
  install -Dm644 icons/wings_icon_48x48.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/$pkgname.png"
  install -Dm644 icons/wings_icon_256x256.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
  install -Dm644 unix/wings.appdata.xml "$pkgdir/usr/share/metainfo/$pkgname.appdata.xml"
  cd build
  install -d "$pkgdir/usr/lib/$pkgname"
  cp -r wings-$pkgver-linux/lib/wings-$pkgver/* "$pkgdir/usr/lib/$pkgname"
}

# getver: -u=2 github.com/dgud/wings/releases
