# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Ashwin Vishnu <ashwinvis+arch at pr0t0nm4il dot com>

pkgname=govarnam-ibus-git
pkgver=1.6.2.r3.g38b3d0b
pkgrel=1
pkgdesc="IBus engine for GoVarnam providing Indian language input method - Git version"
arch=('x86_64')
url="https://varnamproject.github.io/"
license=('AGPL')
makedepends=('go' 'git')
depends=('govarnam' 'ibus')
source=("${pkgname}::git+https://github.com/varnamproject/govarnam-ibus.git"
    "git+https://github.com/varnamproject/govarnam.git"
    "wayland-fix.patch")
sha256sums=('SKIP'
            'SKIP'
            '02479dff418290567b2748d6f23124474fe7b8f7eb89694464c4eb0fa843ed4f')
provides=('govarnam-ibus')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//g'
}

prepare() {
  cd "$pkgname"
  git am ../wayland-fix.patch
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

