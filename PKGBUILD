# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=liamstask-goose-git
_pkgname=goose
pkgdesc="Goose is a database migration tool."
pkgver=0.0.1.r0.8488cc4
pkgrel=3
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="https://bitbucket.org/liamstask/goose"
_namespace="bitbucket.org/liamstask"
license=('MIT')
conflicts=(
    goose
    goose-bin
)
provides=(
    goose
)
makedepends=(
    go
    git
)

source=(
    "$_pkgname::git+https://bitbucket.org/liamstask/goose.git#branch=master"
)

sha256sums=(
    "SKIP"
)

prepare() {
    mkdir -p ${srcdir}/usr/lib/go/{bin,pkg,src}
    export GOROOT=/usr/lib/go/
    export GOPATH=${srcdir}/usr/lib/go
    mkdir -p ${GOPATH}/src/${_namespace}

    cd "$srcdir/$_pkgname"
    if [ ! -f go.mod ] ; then
        go mod init "${url#https://}"
        go mod tidy
    fi

    mv $srcdir/$_pkgname ${GOPATH}/src/${_namespace}/
}

pkgver() {
    export GOROOT=/usr/lib/go
    export GOPATH=${srcdir}/usr/lib/go

    cd ${GOPATH}/src/${_namespace}/$_pkgname
    echo "0.0.1.r0.$(git describe --always)"
}

build() {
    export GOROOT=/usr/lib/go
    export GOPATH=${srcdir}/usr/lib/go

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_ENABLED=1

    cd $GOPATH/src/$_namespace/$_pkgname

    go build \
       -trimpath \
       -buildmode=pie \
       -mod=readonly \
       -modcacherw \
       -o "$_pkgname" \
       -ldflags "-linkmode=external -s -w" \
       $_namespace/$_pkgname/cmd/goose
}

package() {
    install -D -m0755 "$srcdir/usr/lib/go/src/$_namespace/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

    install -D -m0644 "$srcdir/usr/lib/go/src/$_namespace/$_pkgname/MIT-License.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
