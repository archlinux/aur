# Maintainer: Sean Enck <enckse@gmail.com>

pkgname=oragono
pkgver=0.10.3
pkgrel=1
pkgdesc="A modern IRC server written in Go."
arch=('x86_64')
url="https://github.com/oragono/oragono"
license=('MIT')
install=install
makedepends=('go' 'git')
source=("git+$url#tag=v$pkgver"
        "git+https://github.com/oragono/oragono-vendor"
        "oragono.service"
        "path.patch"
        "oragono-rotate")
sha256sums=('SKIP'
            'SKIP'
            '131097e2803dee6f0b00de41b80fb790a44dd6c90bf1b1004078535150ff64cc'
            '25a1c0f764283059e95088f3b9cb66fe6a0c95df0d9dc8375856f41097c04fb0'
            '896f394a7c62ce7961778c4664a02ffe0370ccec9a7f2569fb7d0b9119632d4b')
backup=('etc/oragono.conf')
build() {
    export GOPATH=$(pwd)/..
    cd ${srcdir}/$pkgname
    local _path=$(pwd)
    git submodule init 
    git config submodule.vendor.url $srcdir/oragono-vendor
    git submodule update
    patch -p0 < ../path.patch
    cd vendor/github.com/$pkgname
    rm -rf $pkgname
    mkdir -p $pkgname
    ln -s $_path/irc $pkgname/irc
    ln -s $_path/mkcerts $pkgname/mkcerts
    cd $_path
    make linux
    echo "Arch Linux AUR: $pkgver-$pkgrel" >> build/linux/oragono.motd
}

package() {
    local _conf=/var/lib/oragono/
    install -Dm 644 oragono.service $pkgdir/usr/lib/systemd/system/oragono.service
    install -Dm 644 oragono-rotate $pkgdir/etc/logrotate.d/oragono
    cd ${srcdir}/$pkgname/build/linux
    install -Dm 755 oragono $pkgdir/usr/bin/oragono
    install -Dm 644 oragono.motd $pkgdir/$_conf/ircd.motd
    install -Dm 644 oragono.yaml $pkgdir/etc/oragono.conf
}
