# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Ashwin Vishnu <ashwinvis+arch at pr0t0nm4il dot com>

pkgname=govarnam-git
pkgver=1.9.0.r6.g436d006
pkgrel=1
pkgdesc="Transliteration and reverse transliteration for Indian languages - Go port of libvarnam"
arch=('x86_64')
url="https://varnamproject.github.io/"
license=('AGPL')
makedepends=('go' 'git')
source=("${pkgname}::git+https://github.com/varnamproject/govarnam.git")
sha256sums=('SKIP')
provides=('govarnam')
optdepends=('govarnam-ibus: Ibus engine support'
            'govarnam-schemes: Language schemes support')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//g'
}

prepare() {
  cd "$pkgname"
  go get -u . && go mod tidy
  sed -i 's#EXT_LDFLAGS = -extldflags "-Wl,-soname,$(LIB_NAME).$(SO_NAME),--version-script,$(CURDIR)/govarnam.syms"#EXT_LDFLAGS = -extldflags "-Wl,-soname,$(LIB_NAME).$(SO_NAME)"#g' Makefile
}
build() {
  cd "$pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  make PREFIX=/usr
}

# check() {
#   cd "$pkgname"
#   make test
# }

package() {
  cd "$pkgname"

  install -Dm755 varnamcli "$pkgdir"/usr/bin/varnamcli

  install -Dm644 libgovarnam.so "$pkgdir"/usr/lib/libgovarnam.so

  install -Dm 644 govarnam.pc "${pkgdir}/usr/lib/pkgconfig/govarnam.pc"

  mkdir -p "${pkgdir}/usr/include/libgovarnam"
  cp -a --no-preserve=ownership *.h "${pkgdir}/usr/include/libgovarnam/"
}
