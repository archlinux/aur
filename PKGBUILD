# Maintainer: Sean Enck <enckse@gmail.com>

pkgname=oragono
pkgver=0.8.0
pkgrel=1
pkgdesc="A modern IRC server written in Go."
arch=('x86_64')
url="https://github.com/oragono/oragono"
license=('MIT')
makedepends=('go' 'git' 'zip')
source=("git+$url#commit=f051b43f2737f5ec6b0c97e27f5227f525015c41"
        "oragono.service")
sha256sums=('SKIP'
            'f3a21d66d86d9e90bb080a10e05aef67c9541a6a3c4c4c2e1c963d374f83cb9e')
backup=('opt/oragono/ircd.yaml')           
build() {
    cd ${srcdir}/$pkgname
    export GOPATH=$(pwd)
    go get -v -d
    sed -i "s/DanielOaks/oragono/g" oragono.go
    ./build.sh
}

package() {
    local _opt=/opt/oragono/
    install -Dm 644 oragono.service $pkgdir/usr/lib/systemd/system/oragono.service
    cd ${srcdir}/$pkgname/build/linux
    install -Dm 755 oragono $pkgdir/$_opt/oragono
    install -Dm 644 oragono.motd $pkgdir/$_opt/oragono.motd
    install -Dm 644 oragono.yaml $pkgdir/$_opt/ircd.yaml
}
