# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=scotty-git
pkgver=0.7.1.r4.g3770f00
pkgrel=1
pkgdesc="Transfer listens and loves between music services"
arch=('x86_64')
url="https://git.sr.ht/~phw/scotty"
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('go' 'git')
provides=('scotty')
conflicts=('scotty')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname::-4}"
	git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/${pkgname::-4}"
	GOPATH="${srcdir}" go mod download -modcacherw
}

build() {
	cd "$srcdir/${pkgname::-4}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	GOPATH="${srcdir}" go build
}

package() {
	cd "$srcdir/${pkgname::-4}"
	install -Dm755 "$srcdir/${pkgname::-4}/${pkgname::-4}" "$pkgdir/usr/bin/${pkgname::-4}"
	install -Dm644 "$srcdir/${pkgname::-4}/config.example.toml" "$pkgdir/usr/share/doc/${pkgname}/config.example.toml"
	install -Dm644 "$srcdir/${pkgname::-4}/COPYING" "$pkgdir/usr/share/licenses/${pkgname}/COPYING"
}
