# Maintainer: Daniel Appelt <daniel.appelt@gmail.com>
pkgname=open-stage-control
pkgver=0.36.0
pkgrel=1
pkgdesc='A libre desktop OSC bi-directionnal control surface application'
arch=(i686 x86_64 armv7h)
url='http://osc.ammd.net/'
license=('GPL3')
depends=('alsa-lib' 'gconf' 'gtk2' 'libxss' 'libxtst' 'nss')
depends_i686=('gcc-libs')
depends_x86_64=('gcc-libs-multilib')
optdepends=('python-pyrtmidi: send and receive midi messages')
makedepends=('npm')
source=("https://github.com/jean-emmanuel/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('df7457bfb9df0dd8545a8658926241c74c4a13ad2e2c449c74124dfd635945f8')
_platform=linux
case "$CARCH" in
  i686)
    _arch=ia32
    ;;
  x86_64)
    _arch=x64
    ;;
  armv7h)
    _arch=armv7l
    ;;
esac

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # Use PKBUILD conforming environment variables and allow redefining the build location.
  sed -i "s/PLATFORM/_platform/g" scripts/package.js
  sed -i "s/ARCH/_arch/g" scripts/package.js
  sed -i "s/out:.*/out: process.env._dist,/g" scripts/package.js

  # pkgdir only seems to be available inside PKGBUILD functions
  export _dist="$pkgdir/usr/share/"

  # Make sure to run this inside build() with non-fakeroot privileges
  npm install # --cache 'node_modules' --production
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  npm run package

  install -d "$pkgdir/usr/bin"
  cd "$pkgdir/usr/bin"
  ln -s "/usr/share/$pkgname-$_platform-$_arch/$pkgname"
}
