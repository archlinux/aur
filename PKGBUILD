# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=fleek
_goslug=github.com/ublue-os/fleek
pkgver=0.9.3
_commit=fa4dddb10798d96bc56e84cd4fe7d8b74367a8f6
pkgrel=1
pkgdesc='"Home as Code" for Humans'
arch=(x86_64)
url="https://$_goslug"
license=(Apache)
makedepends=(go git)
source=("git+$url#commit=$_commit")
b2sums=('SKIP')

prepare() {
	cd "$pkgname"
	mkdir -p build
}

build() {
	cd "$pkgname"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS} -w -extldflags '-static'"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -a -tags netgo "$_goslug/cmd/fleek"
}

package() {
	cd "$pkgname"
	install -Dm755 "$pkgname" -t "$pkgdir/usr/bin"
	install -d "$pkgdir/usr/share/man"
	cp -a man/en/* "$pkgdir/usr/share/man"
	for langdir in $(find man -maxdepth 1 | grep -Ev '^man(/en)?$'); do
		cp -a "$langdir" "$pkgdir/usr/share/man"
	done
	install -Dm644 "completions/${pkgname%-bin}.bash" "$pkgdir/usr/share/bash-completion/completions/${pkgname%-bin}"
	install -Dm644 "completions/${pkgname%-bin}.zsh" "$pkgdir/usr/share/zsh/site-functions/_${pkgname%-bin}"
	install -Dm644 "completions/${pkgname%-bin}.fish" "$pkgdir/usr/share/fish/vendor_completions.d/${pkgname%-bin}.fish"
}
