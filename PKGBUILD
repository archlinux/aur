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
depends=('erlang' 'erlang-sdl' 'erlang-cl' 'bash' 'desktop-file-utils')
makedepends=('setconf' 'gendesk')
optdepends=('povray: rendering support via POV-Ray')
install=$pkgname.install
options=('!emptydirs')
# Using the binary release, but would prefer using a source release, if there is one that compiles
source=("http://sourceforge.net/projects/$_pkgname/files/$_pkgname/$pkgver/$_pkgname-$pkgver-linux.bzip2.run.gz"
        "$pkgname.png::http://img299.imageshack.us/img299/2538/wingsiconblackshiningew5.png")
sha256sums=('760e19fa4973ed0fc75057897135a8efa241e834b078fc05c28786672137b322'
            '6658977cc3bc8db2c9358edf3a2d6cb6bb8084c9a1d96ca573a83dd4e8781f1a')
_genericname=('3D Modeler')

build() {
  cd "$srcdir"
  gendesk
  setconf "$pkgname.desktop" Categories "Graphics;3DGraphics;"

  chmod +x "$_pkgname-$pkgver-linux.bzip2.run"
  "./$_pkgname-$pkgver-linux.bzip2.run" --nox11 --nochown --tar xf > /dev/null
  setconf install_wings INSTALL_DIR "$pkgdir/opt/$pkgname-$pkgver"
}

package() {
  cd "$srcdir"
  ./install_wings

  cd "$pkgdir"
  setconf "opt/$pkgname-$pkgver/$_pkgname" ROOTDIR "/opt/$pkgname-$pkgver"
  install -Dm755 "opt/$pkgname-$pkgver/$_pkgname" "$pkgdir/usr/bin/$pkgname"

  cd "$srcdir"
  install -Dm644 license.terms "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
}

# vim:set ts=2 sw=2 et:
