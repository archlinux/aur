# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-ctrlspace-git
pkgver=r846.7ad53ec
pkgrel=1
pkgdesc="All-in-one buffer, session, and bookmark manager"
arch=('x86_64')
url="https://github.com/vim-ctrlspace/vim-ctrlspace"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
makedepends=('git' 'go')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url"
        'LICENSE')
sha256sums=('SKIP'
            '45850339ab42347c1dfe589698031e1ce620ad1029e5c357acd7569cdebf5e28')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	cd "$pkgname"
	go build -o "file_engine_linux_$CARCH" ./go/file_engine.go
}

package() {
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	cd "$pkgname"
	find autoload doc plugin -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
	install -Dm 644 "file_engine_linux_$CARCH" -t "$pkgdir/usr/share/vim/vimfiles/bin/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
