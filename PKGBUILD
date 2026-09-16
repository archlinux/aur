# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=recueil
pkgver=1.0.1
pkgrel=1
pkgdesc="self-hosted webpage bookmarker and archiver"
arch=(aarch64 x86_64)
url=https://recueil.app
license=(AGPL-3.0-or-later)
depends=(glibc)
makedepends=(git go jq pnpm sqlc)
source=("git+https://github.com/mfinelli/recueil.git#tag=v$pkgver?signed")
sha256sums=('f265a98728e9f110934b6503391cc998541736ec5533a52ce5f90e86bcc385a4')
validpgpkeys=(C3CD75B002978A8468CA7B1F6C3ADDDE36FDA306)

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
