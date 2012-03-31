# $Id: PKGBUILD 61589 2012-01-03 23:37:49Z arodseth $
# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: kappa <kappacurve@gmail.com>

pkgname=wings3d
_pkgname=wings
pkgver=1.4.1
pkgrel=5
pkgdesc="3D modeling program"
arch=('x86_64' 'i686')
url="http://www.wings3d.com/"
license=('GPL')
depends=('esdl')
makedepends=('setconf' 'gendesk')
optdepends=('povray: rendering support via POV-Ray'
            'kerkythea: rendering support via Kerkythea')
replaces=('wings' 'wings-devel')
install=$pkgname.install
source=("http://downloads.sourceforge.net/wings/$_pkgname-$pkgver.tar.bz2"
        "$pkgname"
        "$pkgname.png")
sha256sums=('51aea431e18935e5634ea673caa945f586db2203855554d8dcab5e9545f2789a'
            '46513cd05f8b6e778120af4a87b239c5250799c17b591592893d98cbf082359e'
            'ad49fded5e503131ee0e2e03a6db0974aa60f50e1ec6cd697fcacef126c40f52')
_genericname=('3D Modeler')

build() {
  cd "$srcdir"
  gendesk
  setconf "$pkgname.desktop" Categories "Graphics;3DGraphics;"

  cd "$_pkgname-$pkgver"
  export ESDL_PATH=$(echo /usr/lib/erlang/lib/esdl-*)
  make 
  make lang
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  mkdir -p "$pkgdir/usr/lib/$pkgname"
  for subdir in ebin fonts patches plugins shaders textures; do
    cp -r "$srcdir/$_pkgname-$pkgver/$subdir/" "$pkgdir/usr/lib/$pkgname"
  done

  install -D -m 755 "$srcdir/wings3d" "$pkgdir/usr/bin/wings3d"
  install -D -m 644 "$srcdir/wings3d.desktop" \
    "$pkgdir/usr/share/applications/wings3d.desktop"
  install -D -m 644 "$srcdir/wings3d.png" \
    "$pkgdir/usr/share/pixmaps/wings3d.png"
  install -D -m 644 license.terms \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
