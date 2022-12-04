# Maintainer: Markus Richter <mqus at disroot dot org>
_pkgbase=boilr
pkgname="$_pkgbase"-git
pkgver=0.4.5.r16.g5c29306
pkgrel=1

pkgdesc="A CLI tool for creating and using templates for common actions"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/timsolov/boilr"
license=('Apache')
depends=()
optdepends=()
makedepends=('go')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
source=("git+https://github.com/timsolov/$_pkgbase.git")
sha512sums=('SKIP')
pkgver() {
	cd "$srcdir/$_pkgbase"
	( set -o pipefail
	    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	#build boilr binary
	cd "$srcdir/$_pkgbase"
	
	go build \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-gcflags "all=-trimpath=${PWD}" \
		-ldflags "-linkmode external -extldflags \"${LDFLAGS}\""
}

package() {
	# copy binary
	install -D -m 0755 "$srcdir/$_pkgbase/$_pkgbase" "$pkgdir/usr/bin/$_pkgbase"
}
