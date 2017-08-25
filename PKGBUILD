# Maintainer: Daniel Appelt <daniel.appelt@gmail.com>
pkgname=open-stage-control
pkgver=0.19.3
pkgrel=1
pkgdesc='A libre desktop OSC bi-directionnal control surface application'
arch=(i686 x86_64)
url='http://osc.ammd.net/'
license=('GPL3')
depends=('alsa-lib' 'gconf' 'gtk2' 'libxss' 'libxtst' 'nodejs' 'nss')
depends_i686=('gcc-libs')
depends_x86_64=('gcc-libs-multilib')
optdepends=('python-pyrtmidi: send and receive midi messages')
makedepends=('npm')
source=("https://github.com/jean-emmanuel/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('ed6a55682d55ff4eb870c42a4918ff5d24f5747866fefc683bea85835b1a0c55')
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
