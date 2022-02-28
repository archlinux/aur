# Maintainer: slomomojo <slomomojo@gmail.com>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: kappa <kappacurve@gmail.com>

pkgname=wings3d
pkgver=2.2.9
pkgrel=1
pkgdesc='3D modeler using the winged edge data structure'
arch=(x86_64)
url='http://www.wings3d.com/' # https is not available
license=(GPL)
depends=(erlang erlang-cl)
makedepends=(gendesk git)
optdepends=('povray: render scenes with POV-Ray')
source=("https://sourceforge.net/projects/wings/files/wings/$pkgver/wings-$pkgver.tar.bz2"
        wings.sh)
b2sums=('f28b2a9628442b0d1b96cf9e7826ef40a608137638995a39702b50e6b253e3241f976269ddee31cc79f8c8373bf5eca9776cd86cb11ccbde4048c968469dd268'
        '2d9af245044293479786177c9169035b258c299fda67ee94eaf0f82fe509797553e843e87bf0ea7814b6a4ccbcca7d1e32f345e5eb1e536aaae06033030e86fd')

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
