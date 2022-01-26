# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Ashwin Vishnu <ashwinvis+arch at pr0t0nm4il dot com>

pkgname=govarnam-git
pkgver=1.7.2.r0.gddcabaa
pkgrel=1
pkgdesc="Transliteration and reverse transliteration for Indian languages"
arch=('x86_64')
url="https://varnamproject.github.io/"
license=('AGPL')
makedepends=('go')
source=("${pkgname}::git+https://github.com/varnamproject/govarnam.git")
sha256sums=('SKIP')
provides=('govarnam' 'varnamcli')

prepare() {
  cd "$pkgname"
  # mkdir -p build
}

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//g'
}

build() {
  cd "$pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  PREFIX=/usr make
}

# check() {
#   cd "$pkgname"
#   make test
# }

package() {
  cd "$pkgname"

  install -Dm755 varnamcli "$pkgdir"/usr/bin/varnamcli
  install -Dm644 libgovarnam.so "$pkgdir"/usr/lib/libgovarnam.so
}

