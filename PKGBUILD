# Maintainer: Simon Walker <s.r.walker101@googlemail.com>
pkgname=nvidia-exporter-git
pkgver=r4.f38931eea308
pkgrel=1
epoch=
pkgdesc="Query information about the installed Nvidia GPUs."
arch=("x86_64")
url="https://github.com/BugRoger/nvidia-exporter"
license=("Apache")
groups=()
depends=("glibc")
makedepends=('go-pie')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=nvidia-exporter.install
changelog=
source=("git+${url}" nvidia-exporter.service)
noextract=()
md5sums=()
validpgpkeys=()
sha256sums=('SKIP' 'SKIP')

prepare() {
    mkdir -p gopath/src/github.com/pkgbuild
    ln -rTsf nvidia-exporter gopath/src/github.com/pkgbuild/nvidia-exporter
    export GOPATH="$srcdir"/gopath
    cd gopath/src/github.com/pkgbuild/nvidia-exporter
    echo $GOPATH
    go get -u
}

pkgver() {
    cd nvidia-exporter
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    export GOPATH="$srcdir"/gopath
    cd gopath/src/github.com/pkgbuild/nvidia-exporter
    GOOS=linux GOARCH=amd64 go build \
        -ldflags "-X github.com/bugroger/nvidia-exporter/main.VERSION=$(date +%Y%m%d%H%M) -extldflags=-zrelro -extldflags=-znow" \
        -i -o nvidia-exporter
}

package() {
	(
        cd "nvidia-exporter"
        install -Dm755 ./nvidia-exporter "${pkgdir}/usr/bin/nvidia-exporter"
    )
    install -Dm644 nvidia-exporter.service -t "${pkgdir}/usr/lib/systemd/system"
}
