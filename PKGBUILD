# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pkgname=evo
pkgname=$_pkgname-git
pkgver=r6.8251d06
pkgrel=1
pkgdesc='Version control that works the way you think'
arch=(x86_64)
url="https://github.com/crazywolf132/$_pkgname"
license=('MIT')
makedepends=(go
             git)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd "$_pkgname"
	go mod download
}

build () {
	cd "$_pkgname"
	go build \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-ldflags "-extldflags \"$LDFLAGS\"" \
		./cmd/$_pkgname
}

package() {
	cd "$_pkgname"
	install -Dm0755 -t "$pkgdir/usr/bin/" $_pkgname
}
