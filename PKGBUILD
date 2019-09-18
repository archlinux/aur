# Maintainer: Matthias Lisin <ml@visu.li>
pkgname=kube-prompt-git
pkgrel=1
pkgver=1.0.8.r0.geed9b10
pkgdesc='An interactive kubernetes client featuring auto-complete using go-prompt.'
arch=('x86_64' 'i686' 'aarch64')
url='https://github.com/c-bata/kube-prompt'
license=('MIT')
depends=('kubectl')
makedepends=('git' 'go')
provides=('kube-prompt')
conflicts=('kube-prompt')
source=("$pkgname::git+https://github.com/c-bata/kube-prompt.git")
sha512sums=('SKIP')


pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
    cd "$pkgname"
    LDFLAGS+=" -X 'main.version=$(git describe --tags --abbrev=0)'"
    LDFLAGS+=" -X 'main.revision=$(git rev-parse --short HEAD)'"
    go build \
        -o kube-prompt \
        -trimpath \
        -ldflags "-extldflags ${LDFLAGS}"
}

package() {
    cd "$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 kube-prompt "${pkgdir}/usr/bin/kube-prompt"
}

