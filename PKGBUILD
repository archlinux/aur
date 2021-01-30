# Maintainer: Haochen Tong <i at hexchain dot org>

pkgname=elvish-git
pkgver=r5024.050863fb
pkgrel=1
pkgdesc='An expressive programming language and versatile interactive shell.'
arch=('i686' 'x86_64')
url="https://github.com/elves/elvish"
license=('custom:2-clause BSD')
provides=('elvish')
conflicts=('elvish')
depends=('glibc')
makedepends=('git' 'go' 'pandoc')
source=("git+https://github.com/elves/elvish.git")
md5sums=('SKIP')
options=(!strip)
install=elvish.install

_repo=elvish

pkgver() {
    cd $_repo
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    export GOPATH=$srcdir/build

    mkdir -p build
    cd elvish
    go mod vendor
    cd website
    go mod vendor
}

build() {
    export GOPATH=$srcdir/build
    export GOFLAGS="-buildmode=pie -trimpath -mod=vendor -modcacherw"
    # Disable cgo for reproducible build
    export CGO_ENABLED=0

	cd $_repo

	LDFLAGS="-X src.elv.sh/pkg/buildinfo.VersionSuffix=-dev.$(git rev-parse HEAD)\
	         -X src.elv.sh/pkg/buildinfo.Reproducible=true"
    go build -v -ldflags="$LDFLAGS" ./cmd/elvish

    cd website
    mkdir -p "$srcdir/doc"
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
    export GOPATH=$srcdir/build
    export GOFLAGS="-trimpath -mod=vendor -modcacherw"
    export CGO_ENABLED=0

    cd $_repo
    make test
}

package() {
    install -Dm755 "$srcdir/elvish/elvish" -t "$pkgdir/usr/bin/"
    install -Dm644 "$srcdir/elvish/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"

    install -dm755 "$pkgdir/usr/share/man/man7"
    cp -rv --no-preserve=ownership "$srcdir/doc/"* "$pkgdir/usr/share/man/man7"
}
