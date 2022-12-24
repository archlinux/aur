# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=gobuster-git
pkgver=3.4.0.r1.gc49ddbf
pkgrel=1
pkgdesc="A directory/file & DNS busting tool."
arch=('x86_64')
url="https://github.com/OJ/gobuster"
license=('Apache')
makedepends=('go>=1.10' 'git')
conflicts=('gobuster')
provides=('gobuster')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"

    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

prepare() {
    cd "${srcdir}/${pkgname}"

    install -m755 -d "${srcdir}/go/src/github.com/OJ/"
    ln -sf "${srcdir}/${pkgname}" "${srcdir}/go/src/github.com/OJ/gobuster"
}

build() {
    cd "${srcdir}/go/src/github.com/OJ/gobuster"

    mkdir -p build

    export GOPATH="${srcdir}/go"
    go build \
        -trimpath -modcacherw -ldflags "-s -w" \
        -o build/gobuster .
}

check() {
    cd "${srcdir}/go/src/github.com/OJ/gobuster"

    export GOPATH="${srcdir}/go"
    make test
}

package() {
    cd "${srcdir}/go/src/github.com/OJ/gobuster"

    install -Dm755 build/gobuster "${pkgdir}/usr/bin/gobuster"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
