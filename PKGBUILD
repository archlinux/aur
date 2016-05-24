# $Id$
# Maintainer: Alexander F Rødseth <rodseth@gmail.com>
# Contributor: kappa <kappacurve@gmail.com>

pkgname=wings3d
_pkgname=wings
pkgver=1.5.4
pkgrel=2
pkgdesc='3D modeling program'
arch=('x86_64' 'i686')
url='http://www.wings3d.com/'
license=('GPL')
depends=('erlang-sdl' 'erlang-cl' 'bash' 'desktop-file-utils' 'erlang')
makedepends=('gendesk' 'imagemagick')
optdepends=('povray: rendering support via POV-Ray')
source=("http://downloads.sourceforge.net/project/wings/wings/$pkgver/wings-$pkgver.tar.bz2"
        "$pkgname.sh")
sha256sums=('bd04ca1c1237f3a6f29ce3f653015e21142b849b338a3d1ab8633e3c6bcde663'
            '46513cd05f8b6e778120af4a87b239c5250799c17b591592893d98cbf082359e')

prepare() {
  gendesk -f -n \
    --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name 'Wings3D' \
    --genericname '3D Modeler' --categories 'Graphics;3DGraphics'

  convert "$_pkgname-$pkgver/win32/wings.ico" "$pkgname.png"

  # Path fix for building wpc_lwo
  ln -s "$srcdir/$_pkgname-$pkgver" \
    "$_pkgname-$pkgver/plugins_src/import_export/wings"
}

build() {
  export ESDL_PATH=$(echo /usr/lib/erlang/lib/esdl-*)
  make -C "$_pkgname-$pkgver" all lang
}

package() {
  install -Dm644 "$pkgname-3.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -d "$pkgdir/usr/lib/$pkgname"

  cd "$_pkgname-$pkgver"
  for subdir in ebin fonts patches plugins shaders textures; do
    cp -r "$srcdir/$_pkgname-$pkgver/$subdir/" "$pkgdir/usr/lib/$pkgname"
  done
}

# getver: wings3d.com/?page_id=84
# vim:set ts=2 sw=2 et:
