# Maintainer: Tucker Boniface <tucker@boniface.tech>
# Maintainer: Jguer <pkgbuilds at jguer.space>
pkgname="yay-git"
_pkgname="yay"
pkgver=12.3.4.r0.ga1d530c
pkgrel=1
pkgdesc="Yet another yogurt. Pacman wrapper and AUR helper written in go. (development version)"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64' 'riscv64')
url="https://github.com/Jguer/yay"
license=('GPL-3.0-or-later')
depends=(
  'pacman>5'
  'git'
  )
optdepends=(
  'sudo: privilege elevation'
  'doas: privilege elevation'
)
makedepends=('go>=1.21')
options=(!lto)
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
  export GOFLAGS="${GOFLAGS} $(pacman -T 'libalpm.so=14-64' > /dev/null && echo "-tags=next")"
  export CGO_ENABLED=1

  cd "$srcdir/$_pkgname"
  make VERSION=$pkgver DESTDIR="$pkgdir" PREFIX="/usr" build
}

package() {
  cd "$srcdir/$_pkgname"
  make VERSION=$pkgver DESTDIR="$pkgdir" PREFIX="/usr" install
}
