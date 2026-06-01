# Maintainer: Imperator Storm <ImperatorStorm11@protonmail.com>
pkgbase=piuparts
pkgname=(piuparts piuparts-doc)
pkgver=1.6.0
pkgrel=2
pkgdesc=".deb package installation, upgrading, and removal testing tool"
arch=(x86_64 aarch64)
url="https://piuparts.debian.org/"
license=(GPL-2.0-or-later)
depends=(debsums lsof util-linux python-sphinx python-debian python-apt python-debianbts python-distro-info python-pytest python-sphinx python-yaml)
makedepends=(go)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
source=("https://deb.debian.org/debian/pool/main/p/piuparts/piuparts_$pkgver.tar.xz")
noextract=()
sha256sums=('5d8d3e6d796337498e4e4d5a9a25b5ab3d1a07ce4650584710b19ac6ce765602')
validpgpkeys=()

# prepare() {
# 	cd "$pkgname_$pkgver"
# 	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
# }

build() {
	export GOPATH="${srcdir}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	cd "$pkgname-$pkgver"
	make prefix=/usr build build-doc
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package_piuparts() {
	cd "$pkgbase-$pkgver"
	make DESTDIR="$pkgdir/" prefix=/usr etcdir=/etc install install-conf
}

package_piuparts-doc() {
	cd "$pkgbase-$pkgver"
	make DESTDIR="$pkgdir/" prefix=/usr etcdir=/etc install-doc
}
