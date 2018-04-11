# Maintainer: Sean Enck <enckse@gmail.com>

pkgname=oragono
pkgver=0.10.3
pkgrel=6
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
        "oragono.sysusers"
        "path.patch"
        "oragono.tmpfiles")
sha256sums=('SKIP'
            'SKIP'
            'd35dd5205e3b607ee105a1252677d0607d0c35636ee3e6057275b5f13e555858'
            '7e214caa8bee053adac26a00a17ed732970e86665cbe31553b1d3d609f0a49b4'
            '8972e3fc24d0aca75614048f14487b6eb1e43a9edf212626f5a74b59f1051d8c'
            'd56a8935891bc421683e48245786c9f8d9d4c449197de5f455ce7d7804907c7a')
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
    GOOS=linux GOARCH=amd64 go build oragono.go
}

package() {
    local _conf=/var/lib/oragono/
    install -Dm 644 oragono.service $pkgdir/usr/lib/systemd/system/oragono.service
    install -Dm644 "$srcdir/oragono.sysusers" "$pkgdir/usr/lib/sysusers.d/oragono.conf"
    install -Dm644 "$srcdir/oragono.tmpfiles" "${pkgdir}"/usr/lib/tmpfiles.d/oragono.conf
    cd ${srcdir}/$pkgname
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm 755 oragono $pkgdir/usr/bin/oragono
    install -Dm 644 oragono.yaml $pkgdir/etc/oragono.conf
}
