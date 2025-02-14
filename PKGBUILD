# Maintainer: Yufan You <ouuansteve at gmail>
# Contributor: Nick Cao <nickcao@nichi.co>
pkgname=auth-thu
pkgver=2.3.5
pkgrel=1
pkgdesc='A commandline Tunet (auth4/6.tsinghua.edu.cn, Tsinghua-IPv4) authentication tool'
arch=('x86_64')
url='https://github.com/z4yx/GoAuthing'
license=('GPL-3.0-only')
makedepends=('go')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('d380777283645c1058ed4667bfd5eb26e4a473e363554c333fe802785664a305')

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

