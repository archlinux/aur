# Maintainer: Thomas Girod <tgirod@altu.fr>
# Co-Maintainer: Daniel Appelt <daniel.appelt@gmail.com>
pkgname=open-stage-control
pkgver=1.7.2
pkgrel=1
pkgdesc='A libre desktop OSC bi-directional control surface application'
arch=(i686 x86_64 armv7h aarch64)
url='http://osc.ammd.net/'
license=('GPL3')
depends=('alsa-lib' 'gtk3' 'libxss' 'libxtst' 'nss')
depends_i686=('gcc-libs')
depends_x86_64=('gcc-libs-multilib')
optdepends=('python-rtmidi: send and receive midi messages')
makedepends=('npm')
source=("https://github.com/jean-emmanuel/$pkgname/archive/v${pkgver//_/-}.tar.gz")
sha256sums=('f86611ce268544af35218560142809a6b99c3dff0e54dda0f8017bda03a6c8d3')
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
  aarch64)
    _arch=arm64
    ;;
esac

build() {
  cd "$srcdir/$pkgname-${pkgver//_/-}"

  # Use PKBUILD conforming environment variables and allow redefining the build location.
  sed -i "s/PLATFORM/_platform/g" scripts/package.js
  sed -i "s/ARCH/_arch/g" scripts/package.js
  sed -i "s/out:.*/out: process.env._dist,/g" scripts/package.js

  # pkgdir only seems to be available inside PKGBUILD functions
  export _dist="$pkgdir/usr/share/"

  # Make sure to run this inside build() with non-fakeroot privileges
  npm install --arch=$_arch
  npm run build
}

package() {
  cd "$srcdir/$pkgname-${pkgver//_/-}"

  npm run package

  install -d "$pkgdir/usr/bin"
  cd "$pkgdir/usr/bin"
  ln -s "/usr/share/$pkgname-$_platform-$_arch/$pkgname"
}
