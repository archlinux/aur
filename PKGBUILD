# Maintainer:

pkgname=ubuntu-emulator-bzr
_pkgname=ubuntu-emulator
pkgver=r227
pkgrel=1
pkgdesc="Create and destroy Ubuntu Touch instances and run them with the emulator"
url="https://launchpad.net/goget-ubuntu-touch"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('android-tools')
makedepends=('go' 'bzr')
provides=('ubuntu-emulator')
conflicts=('ubuntu-emulator')
# options='!emptydirs'
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

  echo "go build: building executable..."
  # Prepare executable
  go build
}

package() {
  SOURCE_PATH="$srcdir/goget-ubuntu-touch"
  # Package license (if available)
  install -Dm644 "$SOURCE_PATH/COPYING" \
        "$pkgdir/usr/share/licenses/$_pkgname/COPYING"

  # Package executables
  install -Dm755 "$SOURCE_PATH/${_pkgname}/${_pkgname}" \
    "$pkgdir/usr/bin/$_pkgname"
}
