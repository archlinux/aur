# $Id$
# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: kappa <kappacurve@gmail.com>

pkgname=wings3d
_pkgname=wings
pkgver=1.4.1
pkgrel=15
pkgdesc='3D modeling program'
arch=('x86_64' 'i686')
url='http://www.wings3d.com/'
license=('GPL')
depends=('erlang-sdl>=1.2-7' 'erlang-cl>=1.0-3' 'bash' 'desktop-file-utils' 'erlang')
makedepends=('setconf' 'gendesk')
optdepends=('povray: rendering support via POV-Ray')
install=$pkgname.install
#source=("http://sourceforge.net/projects/wings/files/wings/1.4.1/wings-1.4.1-linux.bzip2.run.gz"
source=("$pkgname-$pkgver.tar.gz::https://github.com/dgud/wings/archive/master.tar.gz"
        "$pkgname.sh"
        "$pkgname.png::http://img299.imageshack.us/img299/2538/wingsiconblackshiningew5.png")
sha256sums=('760e19fa4973ed0fc75057897135a8efa241e834b078fc05c28786672137b322'
            '46513cd05f8b6e778120af4a87b239c5250799c17b591592893d98cbf082359e'
            '6658977cc3bc8db2c9358edf3a2d6cb6bb8084c9a1d96ca573a83dd4e8781f1a')
_genericname=('3D Modeler')

build() {
  cd "$srcdir"
  gendesk
  setconf "$pkgname.desktop" Categories "Graphics;3DGraphics;"

  #chmod +x "$_pkgname-$pkgver-linux.bzip2.run"
  #mkdir -p "$_pkgdir/usr/share/$pkgname"
  #./$_pkgname-$pkgver-linux.bzip2.run --nox11 --nochown --tar xvf

  cd "$_pkgname-master"
  export ESDL_PATH=$(echo /usr/lib/erlang/lib/esdl-*)
  make
  make lang
}

package() {
  cd "$srcdir/$_pkgname-master"

  mkdir -p "$pkgdir/usr/lib/$pkgname"
  for subdir in ebin fonts patches plugins shaders textures; do
    cp -r "$srcdir/$_pkgname-master/$subdir/" "$pkgdir/usr/lib/$pkgname"
  done

  install -Dm644 license.terms "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  cd "$srcdir"
  install -Dm755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
}

# vim:set ts=2 sw=2 et:
