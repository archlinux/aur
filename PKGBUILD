# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Ashwin Vishnu <ashwinvis+arch at pr0t0nm4il dot com>

pkgname=govarnam-ibus-git
epoch=1
pkgver=1.6.2.r3.g18e6d36
pkgrel=1
pkgdesc="IBus engine for GoVarnam providing Indian language input method - Git version"
arch=('x86_64')
url="https://varnamproject.github.io/"
license=('AGPL')
makedepends=('go' 'git')
depends=('govarnam' 'ibus')
source=("${pkgname}::git+https://github.com/varnamproject/govarnam-ibus.git"
    "git+https://github.com/varnamproject/govarnam.git")
sha256sums=('SKIP'
            'SKIP')
provides=('govarnam-ibus')

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
  make INSTALL_PREFIX=/usr ubuntu-14
}

# check() {
#   cd "$pkgname"
#   make test
# }

package() {
  cd "$pkgname"

	install -Dm 755 varnam-ibus-engine "${pkgdir}/usr/bin/varnam-ibus-engine"

	mkdir -p "${pkgdir}/usr/share/varnam/ibus/icons"
	cp -a --no-preserve=ownership icons/*.png "${pkgdir}/usr/share/varnam/ibus/icons/"


	mkdir -p "${pkgdir}/usr/share/ibus/component"
	cp -a --no-preserve=ownership component/*.xml "${pkgdir}/usr/share/ibus/component"
}
