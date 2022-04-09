# Maintainer: database64128 <free122448@hotmail.com>

_pkgname=cubic-spacy-bot
pkgname=$_pkgname-git
pkgver=1.1.1.r0.g1b3339b
pkgrel=1
pkgdesc="An inline Telegram bot that gives you plenty of space"
arch=('x86_64' 'aarch64')
url="https://github.com/database64128/$_pkgname"
license=('AGPL3')
makedepends=('git' 'go')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
    cd $pkgname
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $pkgname
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build -ldflags='-s -w -linkmode=external'
}

package() {
    cd $pkgname
    install -Dm644 systemd/$_pkgname.service "$pkgdir"/usr/lib/systemd/system/$_pkgname.service
    install -Dm755 $_pkgname "$pkgdir"/usr/bin/$_pkgname
}
