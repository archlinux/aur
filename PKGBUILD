# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=ubuntu-device-flash-bzr
_pkgname=ubuntu-device-flash
pkgver=r233
pkgrel=2
pkgdesc="Tools to work with Ubuntu Touch"
url="https://launchpad.net/goget-ubuntu-touch"
arch=('x86_64' 'i686')
license=('GPL3')
makedepends=('go' 'bzr' 'git')
depends=('android-tools')
# options='!emptydirs'
provides=("ubuntu-device-flash")
conflicts=("ubuntu-device-flash")
source=("bzr+lp:goget-ubuntu-touch")
md5sums=('SKIP')

pkgver() {
  cd $srcdir/goget-ubuntu-touch
  printf "r%s" "$(bzr revno)"
}

build() {
  export GOPATH="$srcdir/build"

  cd $srcdir/goget-ubuntu-touch/${_pkgname}

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
  SOURCE_PATH="$srcdir/goget-ubuntu-touch"
  # Package license (if available)
  install -Dm644 "$SOURCE_PATH/COPYING" \
        "$pkgdir/usr/share/licenses/$_pkgname/COPYING"

  # Package executables
  install -Dm755 "$srcdir/build/bin/ubuntu-device-flash" \
    "$pkgdir/usr/bin/$_pkgname"
}

# vim:set ts=2 sw=2 et:
