_pkgname=fluidkeys
pkgname=$_pkgname-git
pkgver=release.r87.g63f3e8e
pkgrel=1
pkgdesc='Fluidkeys helps teams protect themselves with strong encryption.'
arch=('any')
url="https://www.fluidkeys.com"
license=('AGPL3')
makedepends=('go-pie' 'rsync')
provides=("fluidkeys=$pkgver")
source=("git+https://github.com/fluidkeys/fluidkeys.git")
sha256sums=('SKIP')

_gopath="gopath/src/github.com/fluidkeys/fluidkeys"

pkgver() {
  cd $_pkgname

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
  mkdir -p "$srcdir/gopath/src/github.com/fluidkeys"
  ln -rTsf $_pkgname "$srcdir/$_gopath"
  export GOPATH="$srcdir/gopath"
  cd $srcdir/$_gopath
  dep ensure
}

build() {
  cd "$srcdir/$_gopath"
  export GOPATH="$srcdir/gopath"
  make
}

package() {
  cd $srcdir/$_gopath
  export GOPATH="$srcdir/gopath"

  make install PREFIX="$pkgdir/usr"
}
