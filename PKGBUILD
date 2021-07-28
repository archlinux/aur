# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: kappa <kappacurve@gmail.com>

pkgname=wings3d
pkgver=2.2.7
pkgrel=1
pkgdesc='3D modeler using the winged edge data structure'
arch=(x86_64)
url='http://www.wings3d.com/' # https is not available
license=(GPL)
depends=(erlang erlang-cl erlang-sdl)
makedepends=(gendesk)
optdepends=('povray: render scenes with POV-Ray')
source=("https://downloads.sourceforge.net/project/wings/wings/$pkgver/wings-$pkgver.tar.bz2"
        wings.sh)
b2sums=('a7b8273788f26cdaaecfd90a14687703960855d3b72a034d8c78ed58d1e08008ecf1a17dee839471c4ac719efcb723de912db3163b8ce0adb3000eeba9235233'
        '99865e6e7489dd5f1f76e6a1a9c2c2a02e32b50dff34c54e40f08720f39abe46dc659ad13af8f7c888a7f6c45f30c5f235855fe2f277a1bdd1782a41a1c9e3c9')

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
