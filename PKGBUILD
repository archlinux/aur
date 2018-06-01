# Maintainer: Sean Enck <enckse@gmail.com>

pkgname=oragono
pkgver=0.11.0
pkgrel=3
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
        "oragono.tmpfiles"
        "spaces-240.patch")
sha256sums=('SKIP'
            'SKIP'
            'd35dd5205e3b607ee105a1252677d0607d0c35636ee3e6057275b5f13e555858'
            '7e214caa8bee053adac26a00a17ed732970e86665cbe31553b1d3d609f0a49b4'
            'be7b802fa047c94e4b714a9232cccd2d8f5db356fefd4c01bc970d5be23d4943'
            'd56a8935891bc421683e48245786c9f8d9d4c449197de5f455ce7d7804907c7a'
            '21e9280caf4ddd4e940c49921a73b034b87d7c0dbfa4e8172a996df18853f63c')
backup=('etc/oragono.conf')
build() {
    export GOPATH=$(pwd)/..
    cd "${srcdir}/$pkgname"
    local _path=$(pwd)
    git submodule init 
    git config submodule.vendor.url "$srcdir"/oragono-vendor
    git submodule update
    patch -p1 < ../path.patch
    patch -p1 < ../spaces-240.patch
    cd vendor/github.com/$pkgname
    rm -rf $pkgname
    mkdir -p $pkgname
    ln -s "$_path"/irc $pkgname/irc
    ln -s "$_path"/mkcerts $pkgname/mkcerts
    cd "$_path"
    GOOS=linux GOARCH=amd64 go build oragono.go
    rm languages/README.md
    rm languages/example*
}

package() {
    install -Dm 644 oragono.service "$pkgdir/usr/lib/systemd/system/oragono.service"
    install -Dm644 "$srcdir/oragono.sysusers" "$pkgdir/usr/lib/sysusers.d/oragono.conf"
    install -Dm644 "$srcdir/oragono.tmpfiles" "${pkgdir}"/usr/lib/tmpfiles.d/oragono.conf
    cd "${srcdir}/$pkgname"
    install -Dm755 -d "$pkgdir/usr/share/$pkgname/i18n"
    cp languages/* "$pkgdir/usr/share/$pkgname/i18n/"
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm 755 oragono "$pkgdir/usr/bin/oragono"
    install -Dm 644 oragono.yaml "$pkgdir/etc/oragono.conf"
}
