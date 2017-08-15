# $Id$
# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: kappa <kappacurve@gmail.com>

pkgname=wings3d
pkgver=2.1.5
pkgrel=3
pkgdesc='3D modeling program'
arch=('x86_64' 'i686')
url='http://www.wings3d.com/'
license=('GPL')
depends=('desktop-file-utils' 'erlang-sdl' 'erlang-cl')
makedepends=('gendesk' 'imagemagick')
optdepends=('povray: rendering support via POV-Ray')
source=("https://downloads.sourceforge.net/project/wings/wings/$pkgver/wings-$pkgver.tar.bz2"
        $pkgname.sh)
sha256sums=('f0f03cfe9f0ee0ee6c734a2b7e50410d5f21238441cb1f34422b0ecde25b582c'
            'b44102a5c4f9f3cf71c17ef45ce534c5723b3aeb2f78298abdaf77b401982128')
_p=${pkgname%3d}-$pkgver

prepare() {
  gendesk -f -n \
    --name Wings3D \
    --pkgname $pkgname \
    --pkgdesc "$pkgdesc" \
    --genericname '3D Modeler' \
    --categories 'Graphics;3DGraphics'

  convert $_p/win32/wings.ico $pkgname.png

  # Path fix for building wpc_lwo
  ln -s $_p $_p/plugins_src/import_export/wings
  ln -s $_p wings

  sed -i 's/-Werror//' $_p/{src,e3d,plugins_src/import_export}/Makefile
}

build() {
  export ESDL_PATH="$(echo /usr/lib/erlang/lib/esdl-*)"
  export ERL_LIBS="$srcdir"

  make -C $_p all lang
}

package() {
  install -Dm755 $pkgname.sh "$pkgdir/usr/bin/$pkgname"

  install -Dm644 $pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 $pkgname-3.png "$pkgdir/usr/share/pixmaps/$pkgname.png"

  install -d "$pkgdir/usr/lib/$pkgname"
  for subdir in e3d ebin icons plugins psd shaders src textures tools; do
    cp -r $_p/$subdir/ "$pkgdir/usr/lib/$pkgname"
  done
}

# getver: wings3d.com/?page_id=84
# vim:ts=2 sw=2 et:
