# Maintainer: Sven Lechner <sven[dot]lechner[at]rwth-aachen[dot]de>
# Maintainer: Oleg Shparber <trollixx+aur@gmail.com>
# Maintainer: Yoan Blanc <yoan@dosimple.ch>

pkgname="act-git"
_pkgname="act"
pkgver=0.2.24.r0.g0ff204b
pkgrel=1
pkgdesc='Run your GitHub Actions locally'
arch=('x86_64')
url='https://github.com/nektos/act'
license=('MIT')
provides=('act')
conflicts=('act')
depends=('docker')
makedepends=('go' 'git')
source=("act::git+https://github.com/nektos/act.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    # https://wiki.archlinux.org/index.php/Go_package_guidelines
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    export GOPATH="$srcdir"/gopath

    cd "$srcdir/$_pkgname"
    go build -ldflags "-X main.version=$pkgver" -o dist/local/act main.go
}

package() {
    # Install binary.
    install -Dm755 "$srcdir/$_pkgname/dist/local/act" "$pkgdir/usr/bin/act"

    # Install license.
    install -Dm644 "$srcdir/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
