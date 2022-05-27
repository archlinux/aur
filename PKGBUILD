# Maintainer: Kian Kasad <kian@kasad.com>

pkgname=numb-git
pkgver=v0.0.1.r0.75090e6
pkgrel=1
pkgdesc="A tool for workinng with numbers, units, and dates"
arch=('any')
url="https://github.com/nkanaev/numb"
license=('MIT')
depends=()
makedepends=('go' 'git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	# Generate version number
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"

	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"

	# Note: I don't fully understand what the last two options do since I'm
	# not a Go developer. They were copied from the 'hugo' PKGBUILD.
	export GOFLAGS="-buildmode=exe -trimpath -mod=readonly -modcacherw"

	go build
}

package() {
	cd "$srcdir/${pkgname%-git}"

	# Install license
	install -Dm0644 license "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"

	# Install documentation
	install -d  "${pkgdir}/usr/share/doc/${pkgname%-git}"
	sed 's:doc/::' readme.txt > "${pkgdir}/usr/share/doc/${pkgname%-git}/readme.txt"
	install -Dm0644 -t "${pkgdir}/usr/share/doc/${pkgname%-git}" doc/*

	# Install executable
	install -Dm0755 "${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
}
