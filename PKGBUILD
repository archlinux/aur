# Maintainer: Matthias Lisin <ml@visu.li>
pkgname=kube-prompt-git
pkgrel=2
pkgver=v1.0.5.r20.g048ea99
pkgdesc="An interactive kubernetes client featuring auto-complete using go-prompt."
arch=(any)
url="https://github.com/c-bata/kube-prompt"
license=('MIT')
depends=("kubectl")
makedepends=("dep" "git" "go")
provides=("kube-prompt")
conflicts=("kube-prompt")
source=("$pkgname::git+https://github.com/c-bata/kube-prompt.git")
sha512sums=('SKIP')

_devpath=gopath/src/github.com/c-bata
_fullpath="$_devpath/${pkgname%-git}"

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/-/.r/;s/-/./'
}

prepare() {
    export GOPATH="$srcdir"/gopath

    # no go.mod yet, so we have to symlink the project
    mkdir -p "$_devpath"
    ln -rTsf "$pkgname" "$_fullpath"

    cd "$_fullpath"
    dep ensure
}

build() {
    export GOPATH="$srcdir/gopath"
    cd "$_fullpath"
    # used to display version when kube-prompt is executed
    LDFLAGS+=" -X 'main.version=$(git describe --tags --abbrev=0)'"
    LDFLAGS+=" -X 'main.revision=$(git rev-parse --short HEAD)'"
    go build \
        -o kube-prompt \
        -gcflags "all=-trimpath=${PWD}" \
        -asmflags "all=-trimpath=${PWD}" \
        -ldflags "-extldflags ${LDFLAGS}"
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 kube-prompt "${pkgdir}/usr/bin/kube-prompt"
}

