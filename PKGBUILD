# Maintainer: Jiri Tyr <jiri.tyr@gmail.com>

_pkg='gbt'
_gopkg="github.com/jtyr/$_pkg"

pkgname="$_pkg-git"
pkgver=r91.92387be
pkgrel=1
pkgdesc='Highly configurable prompt builder for Bash and ZSH written in Go'
url='https://github.com/jtyr/gbt'
arch=('any')
license=('MIT')
makedepends=('go')
optdepends=('nerd-fonts-complete')


pkgver() {
    msg2 'Getting version'
    cd "$srcdir/src/$_gopkg"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


prepare() {
    msg2 'Fetching Go package'
    GOPATH="$srcdir" go get -u "$_gopkg"
}


build() {
    msg2 'Building binary'
    rm -f "$srcdir/bin/$_pkg"
    GOPATH="$srcdir" go install "$_gopkg"
}


package() {
    msg2 'Installing files'
    install -Dm755 "$srcdir/bin/$_pkg" -t "$pkgdir/usr/bin"
    install -Dm644 "$srcdir/src/$_gopkg/"/{LICENSE,README.md} -t "$pkgdir/usr/doc/$_pkg"
    mkdir -p "$pkgdir/usr/share/$_pkg/"
    cp -r "$srcdir/src/$_gopkg/"{sources,themes} "$pkgdir/usr/share/$_pkg/"
}
