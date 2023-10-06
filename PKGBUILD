# Maintainer: Joshua Wong <joshuawong AT anticentri DOT st>
# Contributor: Joshua Wong <joshuawong AT anticentri DOT st>
# Contributor: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=vcluster-git
_pkgname=vcluster
pkgdesc='Create fully functional virtual Kubernetes clusters'
pkgver=0.16.1.r4.ga45458f2
pkgrel=2
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="https://vcluster.com"
license=('apache')
provides=(vcluster)
conflicts=(vcluster)
makedepends=(
    'go'
    'git'
)
depends=(
    'glibc'
)

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

source=(
    "$_pkgname::git+https://github.com/loft-sh/vcluster#branch=main"
)

sha256sums=(
    'SKIP'
)

prepare() {
    cd "$srcdir/$_pkgname"
    mkdir -p build/
}

build() {
    cd "$srcdir/$_pkgname"
    export GOPATH="$srcdir/gopath"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"

    go build \
       -trimpath \
       -buildmode=pie \
       -mod=readonly \
       -modcacherw \
       -ldflags "\
        -linkmode=external \
        -buildid='' \
        -extldflags=\"${LDFLAGS}\"" \
       -o build/$_pkgname ./cmd/vclusterctl/main.go
}

check() {
    cd "$srcdir/$_pkgname"
    go test ./cmd/vclusterctl/...
}

package() {
    cd "$srcdir/$_pkgname"

    install -Dm755 "build/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

    "build/$_pkgname" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
    "build/$_pkgname" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
}
