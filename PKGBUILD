# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

## You must import the GPG keys separately before installing
## Keys are located at https://github.com/torchedsammy.gpg

pkgname=hilbish-git
pkgver=2.0.0.rc1.r23.g1024f93
pkgrel=1
pkgdesc="The flower shell for Lua users"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/rosettea/hilbish"
license=('MIT')
depends=('lua-lunacolors' 'lua-succulent' 'lua-inspect')
makedepends=('git' 'go')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=hilbish.install
options=('!emptydirs')
source=("$pkgname::git+$url?signed")
sha256sums=('SKIP')
validpgpkeys=('784DF7A14968C5094E16839C904FC49417B44DCD') ## TorchedSammy

pkgver() {
	git -C "$pkgname" describe --long --tags | sed 's/^v//;s/-rc/.rc/;s/-/.r/;s/-/./'
}

prepare() {
	cd "$pkgname"
	go mod download
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

	cd "$pkgname"
	go build -ldflags "-linkmode=external -X main.version=$pkgver"
}

package() {
	cd "$pkgname"
	install -Dv hilbish -t "$pkgdir/usr/bin/"
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dvm644 .hilbishrc.lua -t "$pkgdir/usr/share/hilbish/"
	cp -av --no-preserve=ownership nature "$pkgdir/usr/share/hilbish/"
	install -dv "$pkgdir/usr/share/hilbish/libs/"
	cp -avp --no-preserve=ownership libs/ansikit "$pkgdir/usr/share/hilbish/libs/"
}
