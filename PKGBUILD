# Maintainer: Zhanibek Adilbekov <zhnaibek.adilbekov@proton.me>
# Original Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
# shellcheck disable=2034,2154,2164
pkgname=gibo
pkgver=3.0.14
pkgrel=1
pkgdesc='Command-line tool to help you easily access .gitignore boilerplates'
arch=('x86_64')
url="https://github.com/simonwhitaker/gibo"
license=('Unlicense')
makedepends=('go')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
    "$pkgname.install")
b2sums=('38a21c06b47cbecadd2301f8fe78c79ef354308b83a1d46d2cb8d1d1ca3c5952afdbcfb747dba567ac2b01a81142bfa3a3da097dd8e680f05ccecc97c1163a2d'
        'a8516b43198e9353eaf0fe49d50cb50ea2ac096b0366deabd33795b2c6d52ede6264d5615acdf78117550dbd2dc13999bca66fc9d1b10a090e7cee344c487f97')

prepare() {
	cd "$pkgname-$pkgver"
	mkdir -p build
}

build() {
	cd "$pkgname-$pkgver"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o build ./...
	"build/gibo" completion bash >build/gibo-completion.bash
	"build/gibo" completion zsh >build/gibo-completion.zsh
	"build/gibo" completion fish >build/gibo.fish
}

check() {
	cd "$pkgname-$pkgver"
	go test ./...
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 "build/gibo" "$pkgdir/usr/bin/gibo"

    # license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # bash
    mkdir -p "$pkgdir/usr/share/bash-completion"
    install -Dm644 build/gibo-completion.bash "$pkgdir/usr/share/bash-completion/completions/gibo"

    # zsh
    mkdir -p "$pkgdir/usr/share/zsh/site-functions"
    install -Dm644 build/gibo-completion.zsh "$pkgdir/usr/share/zsh/site-functions/_gibo"

    # fish
    mkdir -p "$pkgdir/usr/share/fish/vendor_completions.d"
    install -Dm644 build/gibo.fish "$pkgdir/usr/share/fish/vendor_completions.d/gibo.fish"
}
