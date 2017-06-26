# Maintainer: Sean Enck <enckse@gmail.com>

pkgname=oragono
pkgver=0.8.1
pkgrel=1
pkgdesc="A modern IRC server written in Go."
arch=('x86_64')
url="https://github.com/oragono/oragono"
license=('MIT')
install=install
makedepends=('go' 'git')
source=("git+$url#commit=325ed3e112f076aa0d717437a18ef331281db821"
        "oragono.service"
        "path.patch")
sha256sums=('SKIP'
            '131097e2803dee6f0b00de41b80fb790a44dd6c90bf1b1004078535150ff64cc'
            '25a1c0f764283059e95088f3b9cb66fe6a0c95df0d9dc8375856f41097c04fb0')
backup=('etc/oragono.conf')
build() {
    cd ${srcdir}/$pkgname
    patch -p0 < ../../path.patch
    export GOPATH=$(pwd)
    go get -v -d
    make linux
    echo "Arch Linux AUR: $pkgver-$pkgrel" >> build/linux/oragono.motd
}

package() {
    local _conf=/var/lib/oragono/
    install -Dm 644 oragono.service $pkgdir/usr/lib/systemd/system/oragono.service
    cd ${srcdir}/$pkgname/build/linux
    install -Dm 755 oragono $pkgdir/usr/bin/oragono
    install -Dm 644 oragono.motd $pkgdir/$_conf/ircd.motd
    install -Dm 644 oragono.yaml $pkgdir/etc/oragono.conf
}
