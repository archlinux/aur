# Maintainer: Stefan Tatschner <stefan@sevenbyte.org>

pkgname=syncthing-inotify
pkgver=0.6.4
pkgrel=1
pkgdesc="Inotify file watcher for Syncthing"
url="https://github.com/syncthing/syncthing-inotify"
license=('MPLv2')
arch=('i686' 'x86_64')
depends=('syncthing>=0.11')
makedepends=('git' 'go' 'godep')
source=("$pkgname-$pkgver::git+https://github.com/syncthing/syncthing-inotify.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
    cd "${srcdir}"
    mkdir -p "src/github.com/syncthing"
    mv "${pkgname}-${pkgver}" "src/github.com/syncthing/${pkgname}"
}

build() {
    export GOPATH="${srcdir}"
    cd "${srcdir}/src/github.com/syncthing/${pkgname}"
    go get
    go build
}

check() {
    export GOPATH="${srcdir}"
    cd "${srcdir}/src/github.com/syncthing/${pkgname}"
    go test
}

package() {
    cd "${srcdir}/src/github.com/syncthing/${pkgname}"
    install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "etc/linux-systemd/user/syncthing-inotify.service" "${pkgdir}/usr/lib/systemd/user/syncthing-inotify.service"
    install -Dm644 "etc/linux-systemd/system/syncthing-inotify@.service" "${pkgdir}/usr/lib/systemd/system/syncthing-inotify@.service"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
