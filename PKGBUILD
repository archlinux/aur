# Contributor: Lothar_m <lothar_m at riseup dot net>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Jack Roehr <jack@seatgull.com>
# Contributor: tee <teeaur at duck dot com>

pkgname='ticker-git'
_gitname='ticker'
pkgver=0.3.0.r428.g0a22557
pkgrel=1
arch=('x86_64')
url="https://github.com/achannarasappa/ticker"
depends=('glibc')
makedepends=('git')
license=('GPL-3.0-or-later')
pkgdesc="Terminal stock ticker with live updates and position tracking"
provides=(ticker)
#conflicts=(ticker)
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"
	# Use tag of the last commit, but removing the prefix
	git describe --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
	cd "$_gitname"
	mkdir -p build/
	go mod download
}

build() {
	local CGO_CPPFLAGS="${CPPFLAGS}"
	local CGO_CFLAGS="${CFLAGS}"
	local CGO_CXXFLAGS="${CXXFLAGS}"
	local CGO_LDFLAGS="${LDFLAGS}"
	local GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	cd "$_gitname"
	go build -o build -ldflags "-linkmode=external -X '${url#https://}/cmd.Version=v$pkgver'"
}

package() {
	cd "$_gitname"
	install -Dv "build/$_gitname" -t "$pkgdir/usr/bin/"
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$_gitname/"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$_gitname/"

    cd build
	mkdir -p "${pkgdir}/usr/share/bash-completion/completions"
	./ticker completion bash > "${pkgdir}/usr/share/bash-completion/completions/ticker"

	mkdir -p "${pkgdir}/usr/share/zsh/site-functions"
	./ticker completion zsh > "${pkgdir}/usr/share/zsh/site-functions/_ticker"

	mkdir -p "${pkgdir}/usr/share/fish/vendor_completions.d/"
	./ticker completion fish > "${pkgdir}/usr/share/fish/vendor_completions.d/ticker.fish"
}
