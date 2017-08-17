# Maintainer: Daniel Appelt <daniel.appelt@gmail.com>
pkgname=open-stage-control
pkgver=0.19.0
pkgrel=1
pkgdesc='A libre desktop OSC bi-directionnal control surface application'
arch=(i686 x86_64)
url='http://osc.ammd.net/'
license=('GPL3')
depends=('alsa-lib' 'gconf' 'gtk2' 'libxss' 'libxtst' 'nodejs' 'nss')
depends_i686=('gcc-libs')
depends_x86_64=('gcc-libs-multilib')
# optdepends=('pyrtmidi: midi support') # TODO: create a package for this
makedepends=('npm')
source=("https://github.com/jean-emmanuel/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('f78ac819fc9bd20cc7431fa7cd727b276cac5bbcc23ecf50fa2922c6cc82eea7')
_platform=linux
case "$CARCH" in
  i686)
    _arch=ia32
    ;;
  x86_64)
    _arch=x64
    ;;
esac

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # Use PKBUILD conforming environment variables and allow redefining the build location.
  sed -i "s/PLATFORM/_platform/g" package.json
  sed -i "s/ARCH/_arch/g" package.json
  sed -i "s/--out dist\//--out=\$_dist/g" package.json

  # pkgdir only seems to be available inside PKGBUILD functions
  export _dist="$pkgdir/usr/share/"

  # Make sure to run this inside build() with non-fakeroot privileges
  npm install # --cache 'node_modules' --production
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  npm run build

  install -d "$pkgdir/usr/bin"
  cd "$pkgdir/usr/bin"
  ln -s "/usr/share/$pkgname-$_platform-$_arch/$pkgname"
}
