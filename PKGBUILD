# Maintainer: Yufan You <ouuansteve at gmail>
# Contributor: Nick Cao <nickcao@nichi.co>
pkgname=auth-thu
pkgver=2.4.0
pkgrel=1
pkgdesc='A commandline Tunet (auth4/6.tsinghua.edu.cn, Tsinghua-IPv4) authentication tool'
arch=('x86_64')
url='https://github.com/z4yx/GoAuthing'
license=('GPL-3.0-only')
makedepends=('go')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('bd05ebe3849eec1318f4a37e5042538a5c71b1ea3baad92e52a38967fc4fd650')

build() {
    cd "GoAuthing-$pkgver"
    export CGO_CPPFLAGS="$CPPFLAGS"
    export CGO_CFLAGS="$CFLAGS"
    export CGO_CXXFLAGS="$CXXFLAGS"
    export CGO_LDFLAGS="$LDFLAGS"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o auth-thu ./cli
}

package() {
    cd "GoAuthing-$pkgver"
    install -Dm755 auth-thu -t "$pkgdir/usr/bin"
    cd "docs/systemd"
    sed -i "s|/usr/local/bin/auth-thu|/usr/bin/auth-thu|g" ./*/*.service
    install -Dm644 user/*.service -t "$pkgdir/usr/lib/systemd/user"
    install -Dm644 system/*.service -t "$pkgdir/usr/lib/systemd/system"
}

