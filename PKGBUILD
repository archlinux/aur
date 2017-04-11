# Maintainer: asaka <aisk1988@gmail.com>
pkgname=lean-cli-git
pkgver=r317.2799385
pkgrel=1
pkgdesc="LeanCloud command line tool"
arch=('i686' 'x86_64')
url="https://leancloud.cn"
license=('Apache')
groups=()
depends=()
makedepends=('git' 'go')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/leancloud/lean-cli')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    export GOPATH="$srcdir/go"
	cd "$srcdir"
    mkdir -p $srcdir/go/src/github.com/leancloud
    ln -s -f $srcdir/lean-cli/ $srcdir/go/src/github.com/leancloud/lean-cli
	go build -o lean -ldflags="-X main.pkgType=aur-git -s -w" github.com/leancloud/lean-cli/lean
}

check() {
	cd "$srcdir"
    ./lean --version | grep -q 'lean version'
}

package() {
	cd "$srcdir"
    install -Dm755 "lean" "$pkgdir/usr/bin/lean"
    install -Dm644 "${pkgname%-git}/LICENSE.txt" "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE.txt"
}
