# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=uroboros-mon-git
_pkgname=uroboros
pkgver=r45.13993dd
pkgrel=1
pkgdesc="A GNU/Linux (resource) monitoring tool focused on single processes."
arch=('x86_64')
url="https://github.com/evilsocket/uroboros"
license=('GPL')
makedepends=('git' 'go') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("uroboros-mon")
conflicts=("uroboros-mon")
source=("${_pkgname}::git+https://github.com/evilsocket/uroboros.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  # Git, no tags available
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_pkgname}"
  make clean
}

build() {
  cd "$srcdir/${_pkgname}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  make all
}

check() {
  cd "$srcdir/${_pkgname}"
  make test-process
}

package() {
  cd "$srcdir/${_pkgname}"
  install -Dm755 _build/uro "${pkgdir}/usr/bin/uro"
}
