# $Id$
# Maintainer: Alexander F Rødseth <rodseth@gmail.com>
# Contributor: kappa <kappacurve@gmail.com>

pkgname=wings3d
pkgver=2.1.5
pkgrel=1
pkgdesc='3D modeling program'
arch=('x86_64' 'i686')
url='http://www.wings3d.com/'
license=('GPL')
depends=('erlang-sdl' 'erlang-cl' 'bash' 'desktop-file-utils' 'erlang')
makedepends=('gendesk' 'imagemagick')
optdepends=('povray: rendering support via POV-Ray')
source=("http://downloads.sourceforge.net/project/wings/wings/$pkgver/wings-$pkgver.tar.bz2"
        "$pkgname.sh")
sha256sums=('f0f03cfe9f0ee0ee6c734a2b7e50410d5f21238441cb1f34422b0ecde25b582c'
            '9f91da23a91bd5808a4f3ce38472e262706f648804628648703ad3695df22e27')

prepare() {
  gendesk -f -n \
    --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name 'Wings3D' \
    --genericname '3D Modeler' --categories 'Graphics;3DGraphics'

  convert "${pkgname%3d}-$pkgver/win32/wings.ico" "$pkgname.png"

  # Path fix for building wpc_lwo
  ln -s "$srcdir/${pkgname%3d}-$pkgver" \
    "${pkgname%3d}-$pkgver/plugins_src/import_export/wings"
  ln -s "$srcdir/${pkgname%3d}-$pkgver" "$srcdir/wings"
}

build() {
  export ESDL_PATH="$(echo /usr/lib/erlang/lib/esdl-*)"
  export ERL_LIBS="$srcdir"
  make -C "${pkgname%3d}-$pkgver" all lang
}

package() {
  install -Dm644 "$pkgname-3.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -d "$pkgdir/usr/lib/$pkgname"

  cd "${pkgname%3d}-$pkgver"
  for subdir in e3d ebin icons plugins psd shaders src textures tools; do
    cp -r "$srcdir/${pkgname%3d}-$pkgver/$subdir/" "$pkgdir/usr/lib/$pkgname"
  done
}

# getver: wings3d.com/?page_id=84
# vim:set ts=2 sw=2 et:
