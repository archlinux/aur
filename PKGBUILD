# Maintainer: caiye <ye.jingchen[at]gmail[dot]com>
# Contributor: Alvie Zhang <alvie.zhang {AT} gmail {DOT} com>
pkgname=meow-proxy-git
pkgver=r1164.4dc7bec
pkgrel=1
pkgdesc="A fork of MEOW that uses whitelist mode and bypasses IPv6"
arch=('i686' 'x86_64')
url="https://github.com/netheril96/MEOW"
license=('BSD')
depends=()
makedepends=('go' 'git')
conflicts=(meow-proxy)

source=(
        'git+https://github.com/netheril96/MEOW'
        meow@.service
        meow_user.service
        )

sha1sums=(
          'SKIP'
          'bf9f1c5c58807e39c969d1ec5cb6535579f0dc92'
          '4ab8d5afaf78c992bdd7c45a7fcd7dd4ae3875d5'
          )

install=$pkgname.install

pkgver() {
    cd "$srcdir/MEOW"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir"
    mkdir -p gopath
    export GOPATH="$srcdir/gopath"
    for gopkg in 'github.com/shadowsocks/shadowsocks-go/shadowsocks' 'github.com/cyfdecyf/'{leakybuf,color,bufio}; do
        go get -d -fix -v -x -u "$gopkg"
    done
}

build() {
    export GOPATH="$srcdir/gopath"
    cd "$srcdir/MEOW"
    go build -v
}

package() {
    install -Dm755 "$srcdir/MEOW/MEOW" "$pkgdir/usr/bin/meow"
    install -Dm644 meow@.service ${pkgdir}/usr/lib/systemd/system/meow@.service
    install -Dm644 meow_user.service ${pkgdir}/usr/lib/systemd/user/meow.service
    install -Dm644 "$srcdir/MEOW/LICENSE" "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
