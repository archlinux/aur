# Maintainer: Sean Enck <enckse@gmail.com>

pkgname=oragono
pkgver=0.10.3
pkgrel=4
pkgdesc="A modern IRC server written in Go."
arch=('x86_64')
url="https://github.com/oragono/oragono"
license=('MIT')
install=install
depends=('glibc')
makedepends=('go' 'git')
source=("git+$url#tag=v$pkgver"
        "git+https://github.com/oragono/oragono-vendor"
        "oragono.service"
        "path.patch")
sha256sums=('SKIP'
            'SKIP'
            '88cf6274839ac8d9f32f9a81068d11e762ddfc28f8fada305b693a8524e593ce'
            '8972e3fc24d0aca75614048f14487b6eb1e43a9edf212626f5a74b59f1051d8c')
backup=('etc/oragono.conf')
build() {
    export GOPATH=$(pwd)/..
    cd ${srcdir}/$pkgname
    local _path=$(pwd)
    git submodule init 
    git config submodule.vendor.url $srcdir/oragono-vendor
    git submodule update
    patch -p1 < ../path.patch
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
    cd ${srcdir}/$pkgname
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    cd build/linux
    install -Dm 755 oragono $pkgdir/usr/bin/oragono
    install -Dm 644 oragono.motd $pkgdir/$_conf/ircd.motd
    install -Dm 644 oragono.yaml $pkgdir/etc/oragono.conf
}
