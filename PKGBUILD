_pkgname=kcptun
pkgname=${_pkgname}-git
pkgver=v20160811.r9.g8ea071f
pkgrel=1
pkgdesc="An extremely simple udp tunnel based on KCP, git compile version"
arch=("i686" "x86_64")
url="https://github.com/xtaci/kcptun"
license=("MIT")
makedepends=('go' 'git')
depends=('glibc')
provides=('kcptun' 'kcptun-bin')
conflicts=('kcptun' 'kcptun-bin')
source=("git+https://github.com/xtaci/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	mkdir -p "$srcdir/${_pkgname}/go_path"
	cd "$srcdir/${_pkgname}/server"
	GOPATH="$srcdir/go_path" go get -d -v
	GOPATH="$srcdir/go_path" go build -v

	cd "$srcdir/${_pkgname}/client"
	GOPATH="$srcdir/go_path" go get -d -v
	GOPATH="$srcdir/go_path" go build -v
}

package() {
	install -Dm755 "$srcdir/${_pkgname}/client/client" \
		"$pkgdir/usr/bin/kcptun-client"
	install -Dm755 "$srcdir/${_pkgname}/server/server" \
		"$pkgdir/usr/bin/kcptun-server"
	install -Dm644 "$srcdir/${_pkgname}/README.en.md" \
		"$pkgdir/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "$srcdir/${_pkgname}/README.md" \
		"$pkgdir/usr/share/doc/${pkgname}/README.zh_CN.md"
	install -Dm644 "$srcdir/${_pkgname}/LICENSE.md" \
		"$pkgdir/usr/share/licenses/${pkgname}/README.zh_CN.md"
}
