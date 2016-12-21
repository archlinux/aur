# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Oliver Kuster <oliver.kuster[at]gmail[dot]com>
  
pkgname=ubuntu-device-flash
pkgver=0.34
pkgrel=2
pkgdesc="Tools to work with Ubuntu Touch"
url="https://launchpad.net/goget-ubuntu-touch"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('android-tools')
makedepends=('go' 'bzr' 'git')
# options='!emptydirs'
provides=("ubuntu-device-flash")
conflicts=("ubuntu-device-flash")
source=("https://launchpad.net/ubuntu/+archive/primary/+files/goget-ubuntu-touch_${pkgver}.orig.tar.gz")
md5sums=('b8bddb2db18d1b47098bb94531b23c78')

build() {
  export GOPATH="$srcdir/build"

  cd $srcdir/goget-ubuntu-touch-${pkgver}/${pkgname}

  #download deps
  echo "go get: downloading dependencies..."
  go get -v -d

  cd $GOPATH/src/github.com/jessevdk/go-flags
  git checkout e790d18a5622970eed9448823164da625077784d

  echo "go build: building executable..."
  # Prepare executable
  cd $GOPATH/src/launchpad.net/goget-ubuntu-touch/ubuntu-device-flash
  go install
}

package() {
  SOURCE_PATH="$srcdir/goget-ubuntu-touch-${pkgver}"
  # Package license (if available)
  install -Dm644 "$SOURCE_PATH/COPYING" \
        "$pkgdir/usr/share/licenses/$pkgname/COPYING"

  # Package executables
  install -Dm755 "$srcdir/build/bin/$pkgname" \
    "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:

