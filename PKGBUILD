# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: kappa <kappacurve@gmail.com>

pkgname=wings3d
pkgver=2.2.5
pkgrel=1
pkgdesc='3D modeler using the winged edge data structure'
arch=(x86_64)
url='http://www.wings3d.com/'
license=(GPL)
depends=(erlang erlang-cl erlang-sdl)
makedepends=(gendesk imagemagick)
optdepends=('povray: render scenes with POV-Ray')
source=("https://downloads.sourceforge.net/project/wings/wings/$pkgver/wings-$pkgver.tar.bz2"
        "$pkgname.sh")
sha256sums=('95ecf84a8f49bc00b983643e7ccd807f64a3b8b88253037a8ccefbe7a3bedff8'
            '8e5e8f31d47ea55a0e9d311b7cc0eaac4e6050ac40506d3548b6ebae5d3618be')
_p=${pkgname%3d}-$pkgver

prepare() {
  gendesk -f -n \
    --name Wings3D \
    --pkgname $pkgname \
    --pkgdesc "$pkgdesc" \
    --genericname '3D Modeler' \
    --categories 'Graphics;3DGraphics'

  # Convert the icon in a reproducable way
  convert +set date:create +set date:modify "$_p"/win32/wings.ico $pkgname.png

  # Path fix for building wpc_lwo
  ln -s "$_p" "$_p"/plugins_src/import_export/wings
  ln -s "$_p" wings

  sed -i 's/-Werror//' "$_p"/{src,e3d,plugins_src/import_export}/Makefile
}

build() {
  export ESDL_PATH="$(echo /usr/lib/erlang/lib/esdl-*)"
  export ERL_LIBS="$srcdir"

  make -C "$_p" all lang
}

package() {
  install -Dm755 $pkgname.sh "$pkgdir/usr/bin/$pkgname"

  install -Dm644 $pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 $pkgname-3.png "$pkgdir/usr/share/pixmaps/$pkgname.png"

  install -d "$pkgdir/usr/lib/$pkgname"
  for subdir in e3d ebin icons plugins psd shaders src textures tools; do
    cp -r "$_p"/$subdir/ "$pkgdir/usr/lib/$pkgname"
  done
}

# getver: -u=2 github.com/dgud/wings/releases
# vim: ts=2 sw=2 et:
