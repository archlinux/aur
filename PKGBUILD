# $Id$
# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: kappa <kappacurve@gmail.com>

pkgname=wings3d
_pkgname=wings
pkgver=1.5.3
pkgrel=2
pkgdesc='3D modeling program'
arch=('x86_64' 'i686')
url='http://www.wings3d.com/'
license=('GPL')
depends=('erlang-sdl' 'erlang-cl' 'bash' 'desktop-file-utils' 'erlang')
makedepends=('gendesk' 'imagemagick')
optdepends=('povray: rendering support via POV-Ray')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/project/wings/wings/$pkgver/wings-$pkgver.tar.bz2"
        "$pkgname.sh")
sha256sums=('c08060016f83679ce08947942d31af0e3b5d105525d0df5e993ec6f1a81fdd8e'
            '46513cd05f8b6e778120af4a87b239c5250799c17b591592893d98cbf082359e')

prepare() {
  gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name 'Wings3D' \
    --genericname '3D Modeler' --categories 'Graphics;3DGraphics'
  convert "$_pkgname-$pkgver/win32/wings.ico" "$pkgname.png"
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
  cd "$_pkgname-$pkgver"
  install -d "$pkgdir/usr/lib/$pkgname"
  for subdir in ebin fonts patches plugins shaders textures; do
    cp -r "$srcdir/$_pkgname-$pkgver/$subdir/" "$pkgdir/usr/lib/$pkgname"
  done
}

# vim:set ts=2 sw=2 et:
