# $Id: PKGBUILD 61589 2012-01-03 23:37:49Z arodseth $
# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: kappa <kappacurve@gmail.com>

pkgname=wings3d
_pkgname=wings
pkgver=1.4.1
pkgrel=7
pkgdesc="3D modeling program"
arch=('x86_64' 'i686')
url="http://www.wings3d.com/"
license=('GPL')
depends=('esdl' 'bash' 'desktop-file-utils' 'cl')
makedepends=('setconf' 'gendesk')
optdepends=('povray: rendering support via POV-Ray')
#            'kerkythea: rendering support via Kerkythea'
replaces=('wings' 'wings-devel')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://nodeload.github.com/dgud/wings/tarball/dgud/r15b-driver-compat"
        "$pkgname"
        "$pkgname.png::http://img299.imageshack.us/img299/2538/wingsiconblackshiningew5.png")
sha256sums=('cbe917601b31b7d469c2f9ed0de1b016be86f14f9e757860990d9489a84585dd'
            '46513cd05f8b6e778120af4a87b239c5250799c17b591592893d98cbf082359e'
            '6658977cc3bc8db2c9358edf3a2d6cb6bb8084c9a1d96ca573a83dd4e8781f1a')
_genericname=('3D Modeler')
_dirname='dgud-wings-4f3a3ff'

build() {
  cd "$srcdir"
  gendesk
  setconf "$pkgname.desktop" Categories "Graphics;3DGraphics;"

  cd "$_dirname"
  export ESDL_PATH=$(echo /usr/lib/erlang/lib/esdl-*)
  make
  make lang
}

package() {
  cd "$srcdir/$_dirname"

  mkdir -p "$pkgdir/usr/lib/$pkgname"
  for subdir in ebin fonts patches plugins shaders textures; do
    cp -r "$srcdir/$_dirname/$subdir/" "$pkgdir/usr/lib/$pkgname"
  done

  install -Dm644 license.terms "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  cd "$srcdir"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
}

# vim:set ts=2 sw=2 et:
