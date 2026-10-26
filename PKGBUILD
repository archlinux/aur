# Maintainer: TryA <tryagainprod@gmail.com>
# Contributor: Eric Belanger <belanger@astro.umontreal.ca>

pkgname=csmash
pkgver=0.6.6
pkgrel=5
pkgdesc="A 3D table tennis game"
arch=('i686' 'x86_64')
url="http://cannonsmash.sourceforge.net"
license=('GPL')
makedepends=('icoutils')
depends=('libxmu' 'gtk2' 'mesa' 'glu' 'sdl_image' 'sdl_mixer')
source=(http://prdownloads.sourceforge.net/cannonsmash/$pkgname-$pkgver.tar.gz
        cannonsmash-0.6.6-gcc41.patch
        cannonsmash-0.6.6-sizeof-cast.patch
        cannonsmash-0.6.6-x-inc.patch
        cannonsmash-0.6.6-sdl-x11.patch
        csmash.desktop)
sha256sums=('1be0b27dac46ba891b955bf8f122151baea6ee05b3c29616a09423250cfd9d3d'
            'ddb1ba2f17057f72d620437fdfc7248199009464fae276a297ae0ecbe43b81f3'
            '6696f48e3aae40a23461f628ec2919850a54b6c4e0818641cefd4f41183cf310'
            '921b0807447292dc35ed4a747081035417035e4a32a97c432021f7791baa855c'
            '9475193ad8ad111dc7f72482210fdb1fcc5dfce77e876d68fb4f669de2e568a9'
            'de7fc1f847a9c15a4901b74559c4e1a784fecac40f79ee9737b820c2832dfc4f')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 < ../cannonsmash-0.6.6-gcc41.patch
  patch -p1 < ../cannonsmash-0.6.6-sizeof-cast.patch
  patch -p1 < ../cannonsmash-0.6.6-x-inc.patch
  patch -p1 < ../cannonsmash-0.6.6-sdl-x11.patch
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --with-sdl-prefix=/usr --disable-sdltest
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/csmash.desktop" "$pkgdir/usr/share/applications/csmash.desktop"
  # upstream ships only a Windows icon; extract the 32x32 8-bit image
  icotool -x -i 1 -o "$srcdir/csmash.png" win32/orange.ico
  install -Dm644 "$srcdir/csmash.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/csmash.png"
}
