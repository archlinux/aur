# Maintainer: asm0dey <me@asm0dey.site>
pkgname=ayandict-git
_pkgname=ayandict
pkgver=v2.1.1.r6.gcf6b086
pkgrel=1
pkgdesc="AyanDict - a simple multi-lingual cross-platform offline dictionary based on Qt and written in Go "
arch=('x86_64')
url="https://github.com/ilius/ayandict"
license=('AGPL-3.0-only')
source=("$_pkgname::git+https://github.com/ilius/ayandict.git")
sha256sums=('SKIP')
makedepends=('go' 'git')

prepare() {
    cd "$_pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
build(){
    cd $srcdir/$_pkgname
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -tags gui
}
package() {
    install -dm 755 $pkgdir/usr/bin
    install -Dm755 $srcdir/$_pkgname/$_pkgname "$pkgdir/usr/bin/$_pkgname"
}
