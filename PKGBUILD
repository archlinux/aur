# Maintainer: Egor Kovetskiy <e.kovetskiy@gmail.com>
pkgname=taskfile-git
_pkgname=task
pkgver=2.8.1.r7.g7dcb3af
pkgrel=1
pkgdesc="A task runner / simpler Make alternative written in Go"
arch=('any')
license=('GPL')
depends=(
)
url="https://github.com/go-task/task"
makedepends=(
    'go'
    'git'
)

_goname="github.com/go-task/task"
source=(
    "$_pkgname::git://github.com/go-task/task#branch=${BRANCH:-master}"
)

md5sums=(
    'SKIP'
)

backup=(
)

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd "$srcdir/$_pkgname"

    rm -rf "$srcdir/go/src"

    mkdir -p "$srcdir/go/src/$(dirname $_goname)"

    export GOPATH="$srcdir/go"

    cp -r "$srcdir/$_pkgname" "$srcdir/go/src/$_goname"
    cd "$srcdir/go/src/$_goname/"

    echo ":: Building binary"
    go get -v \
        -gcflags "-trimpath $GOPATH/src" ./cmd/...
}

package() {
    find "$srcdir/go/bin/" -type f -executable | while read filename; do
        install -DT "$filename" "$pkgdir/usr/bin/$(basename $filename)"
    done

    install -DT "$srcdir/$_pkgname/completion/zsh/_task" \
        "$pkgdir/usr/share/zsh/site-functions/_task"
}
