# Maintainer: Haochen Tong <i at hexchain dot org>

pkgname=elvish-git
_pkgname=elvish
pkgver=0.14.0.r20.gd2e72011
pkgrel=1
pkgdesc="A friendly and expressive Unix shell."
arch=('i686' 'x86_64')
url="https://github.com/elves/elvish"
license=('custom:2-clause BSD')
provides=('elvish')
conflicts=('elvish')
depends=('glibc')
makedepends=('git' 'go' 'pandoc')
source=("git+https://github.com/elves/elvish.git")
md5sums=('SKIP')
install=elvish.install

pkgver() {
    cd "$_pkgname"
    ( set -o pipefail;
      git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
          printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
    mkdir -p "$srcdir/build"
    export GOPATH="$srcdir/build"
    export CGO_LDFLAGS="$LDFLAGS"
    export GOFLAGS="-buildmode=pie -trimpath -mod=vendor -modcacherw"
    cd "$srcdir/elvish"
    go mod vendor
}

build() {
    export GOPATH="$srcdir/build"
    export CGO_LDFLAGS="$LDFLAGS"
    export GOFLAGS="-buildmode=pie -trimpath -mod=vendor -modcacherw"
    cd "$srcdir/elvish"
    go build -v -ldflags="-X github.com/elves/elvish/pkg/buildinfo.Version=$pkgver" .

    cd website
    mkdir "$srcdir/doc"
    go build -v ./cmd/elvdoc/
    for file in builtin edit epm language math platform readline-binding re store str unix; do
        ./elvdoc -filter < "ref/$file.md" | pandoc \
            -s -f gfm -t man -V section:7 \
            -V header:"Miscellaneous Information Manual" \
            -V footer:"Elvish $pkgver" -M date:"$(date -u --date=@${SOURCE_DATE_EPOCH} "+%b %d, %Y")" \
            -M title:"elvish-$file" \
            -o "$srcdir/doc/elvish-$file.7"
    done
}

check() {
    export GOPATH="$srcdir/build"
    export CGO_LDFLAGS="$LDFLAGS"
    export GOFLAGS="-trimpath -mod=vendor -modcacherw"
    cd "$srcdir/elvish"
    make test
}

package() {
    install -Dm755 "$srcdir/elvish/elvish" -t "$pkgdir/usr/bin/"
    install -Dm644 "$srcdir/elvish/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"

    install -dm755 "$pkgdir/usr/share/man/man7"
    cp -rv --no-preserve=ownership "$srcdir/doc/"* "$pkgdir/usr/share/man/man7"
}
