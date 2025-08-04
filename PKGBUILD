# Maintainer: Alexandre Pujol <alexandre@pujol.io>

pkgname=apparmor.d-git
pkgver=0.3713
pkgrel=1
pkgdesc="Full set of apparmor profiles"
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/roddhjav/apparmor.d"
license=('GPL-2.0-only')
depends=('apparmor>=4.1.0' 'apparmor<5.0.0')
makedepends=('go' 'git' 'just')
conflicts=('apparmor.d')
source=("$pkgname::git+https://github.com/roddhjav/apparmor.d.git")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo "0.$(git rev-list --count HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="${srcdir}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  export DISTRIBUTION=arch
  just complain
}

package() {
  cd "$srcdir/$pkgname"
  just destdir="$pkgdir" install
}
