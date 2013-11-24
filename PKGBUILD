# $Id$
# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: kappa <kappacurve@gmail.com>

pkgname=wings3d
_pkgname=wings
pkgver=1.5.1
pkgrel=1
pkgdesc='3D modeling program'
arch=('x86_64' 'i686')
url='http://www.wings3d.com/'
license=('GPL')
depends=('erlang-sdl' 'erlang-cl' 'bash' 'desktop-file-utils' 'erlang')
makedepends=('gendesk')
optdepends=('povray: rendering support via POV-Ray')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/dgud/wings/archive/master.tar.gz"
        "$pkgname.sh"
        "$pkgname.png::http://img299.imageshack.us/img299/2538/wingsiconblackshiningew5.png")
sha256sums=('23009e113a3b6b39bee6e4a1c9e65353a1504ccbfd437f8187751f0d495e5d11'
            '46513cd05f8b6e778120af4a87b239c5250799c17b591592893d98cbf082359e'
            '6658977cc3bc8db2c9358edf3a2d6cb6bb8084c9a1d96ca573a83dd4e8781f1a')

prepare() {
  gendesk --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name 'Wings3D' \
    --genericname '3D Modeler' --categories 'Graphics;3DGraphics'
}

build() {
  export ESDL_PATH=$(echo /usr/lib/erlang/lib/esdl-*)
  make -C "$_pkgname-master"
  make -C "$_pkgname-master" lang
}

package() {
  install -Dm644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  cd "$_pkgname-master"
  install -d "$pkgdir/usr/lib/$pkgname"
  for subdir in ebin fonts patches plugins shaders textures; do
    cp -r "$srcdir/$_pkgname-master/$subdir/" "$pkgdir/usr/lib/$pkgname"
  done
}

# vim:set ts=2 sw=2 et:
