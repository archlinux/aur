# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from Qwen 3.5 Plus (Alibaba).

pkgname=mikumikubeam-git
pkgver=r42.224d905
pkgrel=1
pkgdesc="An open-source network stresser tool but it's Hatsune Miku (Git version)"
arch=('x86_64')
url="https://github.com/sammwyy/MikuMikuBeam"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
provides=('mikumikubeam')
conflicts=('mikumikubeam')
options=('!debug' '!strip')

_commit=224d905571342e1a2f223061f347766c5a52170c
source=("$pkgname::git+https://github.com/sammwyy/MikuMikuBeam.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$pkgname"
    export GOPATH="$srcdir/gopath"
    export GOFLAGS="-mod=mod"
}

build() {
    cd "$pkgname"
    export GOPATH="$srcdir/gopath"
    export GOFLAGS="-mod=mod"
    export CGO_ENABLED=0
    go build -v -trimpath -ldflags="-s -w" -o mmb-server ./cmd/mmb-server
    go build -v -trimpath -ldflags="-s -w" -o mmb-cli ./cmd/mmb-cli
}

package() {
    cd "$pkgname"
    install -Dm755 mmb-server "$pkgdir/usr/bin/mmb-server"
    install -Dm755 mmb-cli "$pkgdir/usr/bin/mmb-cli"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
