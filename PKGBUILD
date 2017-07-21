# Maintainer: Jesús Castro <51v4n@openmailbox.org>
pkgname=glide-git
pkgver=0.12.3
pkgrel=2
pkgdesc="Simplified Go project management, dependency management, and vendoring."
arch=('any')
url='https://github.com/Masterminds/glide'
licence=('MIT')
makedepends=('git' 'go>=1.5')
provides=('glide')
conflicts=('glide')
source=(${pkgname}::git+https://github.com/Masterminds/glide.git)
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$pkgname"
    export GOPATH="$srcdir"
    go get ./... || true
    make build
}

package() {
    export GOPATH="$srcdir"
    export GO15VENDOREXPERIMENT="1"
    mkdir -p $srcdir/src/github.com/Masterminds/
    ln -s $srcdir/$pkgname $srcdir/src/github.com/Masterminds/glide
    cd $srcdir/src/github.com/Masterminds/glide
    make DESTDIR="$pkgdir/" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"2
}

