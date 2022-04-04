#Maintainer: Benjamin Reich <aur@benjaminreich.de>
pkgname=smap-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=0.1.0.rc.r3.gb331526
pkgrel=1
pkgdesc="a drop-in replacement for Nmap powered by shodan.io "
arch=('x86_64')
url="https://github.com/s0md3v/${pkgname%-git}"
license=('GPL3')
groups=()
depends=()
makedepends=('git' 'go')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/s0md3v/${pkgname%-git}')
noextract=()
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git -C "${pkgname%-git}" describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	mkdir -p build
}

build() {
	cd "$srcdir/${pkgname%-git}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o build ./cmd/...
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 build/${pkgname%-git} "$pkgdir"/usr/bin/${pkgname%-git}
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
}
