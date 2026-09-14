# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=recueil
pkgver=1.0.0
pkgrel=1
pkgdesc="self-hosted webpage bookmarker and archiver"
arch=(aarch64 x86_64)
url=https://recueil.app
license=(AGPL-3.0-or-later)
depends=(glibc)
makedepends=(git go jq pnpm sqlc)
source=("git+https://github.com/mfinelli/recueil.git#tag=v$pkgver")
sha256sums=('ce98fa684a89a8d1acffa6729ec1aa69b130eb1c3ff23c3a33da355ec03f0133')

prepare() {
  cd $pkgname
  git submodule update --init
  go mod download
  pnpm ci
}

build() {
  cd $pkgname

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

  make
}

package() {
  cd $pkgname
  make install DESTDIR="$pkgdir" PREFIX=/usr
}

# vim: set ts=2 sw=2 et:
