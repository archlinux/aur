# Maintainer: Moritz 'e1mo' Fromm <git@e1mo.de>

_pkgname=nishanths-license
_binname=license
pkgname=$_pkgname-git
pkgver=v5.0.0.r2.g39dde89
pkgrel=1
pkgdesc='Command line license text generator'
arch=('x86_64')
url='https://github.com/nishanths/license'
provides=("${_pkgname}")
license=('MIT')
conflicts=('license' "${_pkgname}")
depends=('glibc')
makedepends=('go' 'git')
options=('!emptydirs')
source=("$pkgname::git+https://github.com/nishanths/license")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$pkgname/"
	go build \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-ldflags "-X main.Version=$pkgver -linkmode external -extldflags $LDFLAGS" \
		-o "${_binname}" .
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 "${_binname}" "$pkgdir/usr/bin/${_binname}"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
