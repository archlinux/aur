# Maintainer: Tucker Boniface <tucker@boniface.tech>
# Maintainer: Jguer <joaogg3@gmail.com>
pkgname="yay-git"
_pkgname="yay"
pkgver=10.1.2.r0.g7d849a8
pkgrel=1
pkgdesc="Yet another yogurt. Pacman wrapper and AUR helper written in go. (development version)"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/Jguer/yay"
license=('GPL')
options=('!strip' '!emptydirs')
depends=(
  'pacman>5'
  'git'
  'sudo')
makedepends=('go')
conflicts=('yay')
provides=('yay')
source=("yay::git+https://github.com/Jguer/yay.git#branch=next")
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  export GOPATH="$srcdir"/gopath
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_ENABLED=1

  cd "$srcdir/$_pkgname"
  LDFLAGS="-extldflags \"${LDFLAGS}\"" \
    make VERSION=$pkgver DESTDIR="$pkgdir" PREFIX="/usr" build
}

package() {
  cd "$srcdir/$_pkgname"
  make VERSION=$pkgver DESTDIR="$pkgdir" PREFIX="/usr" install
}
