# Maintainer: Jiri Tyr <jiri.tyr@gmail.com>

_pkg='gbt'

pkgname="$_pkg-git"
pkgver=r306.fd9fbf3
pkgrel=1
pkgdesc='Highly configurable prompt builder for Bash and ZSH written in Go'
url='https://github.com/jtyr/gbt'
arch=('any')
license=('MIT')
conflicts=('gbt')
depends=('git')
makedepends=('go')
optdepends=('nerd-fonts-complete')
source=("gbt::git+https://github.com/jtyr/gbt.git")
sha256sums=("SKIP")

pkgver() {
    cd "$srcdir/$_pkg/"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    msg2 'Building binary'
    cd "$srcdir/$_pkg/"
    GOPATH="$srcdir" go mod vendor
    GOPATH="$srcdir" CGO_ENABLED=0 go build -o "bin/$_pkg" -trimpath -ldflags="-s -w -X main.version=git -X main.build=$(git rev-parse --short HEAD)" "./cmd/$_pkg"
}

package() {
    msg2 'Installing files'
    install -Dm755 "$srcdir/$_pkg/bin/$_pkg" -t "$pkgdir/usr/bin"
    install -Dm644 "$srcdir/$_pkg/"/{LICENSE,README.md} -t "$pkgdir/usr/share/doc/$_pkg"
    mkdir -p "$pkgdir/usr/share/$_pkg/"
    cp -r "$srcdir/$_pkg/"{sources,themes} "$pkgdir/usr/share/$_pkg/"
}
