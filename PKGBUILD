# Maintainer: alister (major) <alister@kamikishi.net>
pkgname=gopherbook
pkgver=1.2.000
pkgrel=1
pkgdesc="Web-based comic book library manager for CBZ/CBT files"
arch=('x86_64')
url="https://codeberg.org/riomoo/gopherbook"
license=('PIL')
depends=('glibc')
makedepends=('go>=1.25.2' 'git')
install=gopherbook.install

options=('!debug' '!strip')

# Included the local files back into the source array
source=("$pkgname::git+$url#branch=main"
        "gopherbook.service"
        "gopherbook.conf"
        "gopherbook.install")

# 'SKIP' for the git repo and local files where you don't want to manage hashes
sha256sums=('SKIP'
            '98f3a7f4851504e92d9a2c94fc2295f6fc640199d91d6e8a5ac4ec5c22800962'
            '49f7059e97849be55063dfb7fbba39a04580f7371a95b2339bc63bfdf93875e7'
            '07c888c0b7a66feddd1b151d5313b39b3f3a50555ae06a7495ca37458e404cd5')

build() {
    cd "$srcdir/$pkgname"
    # Your specific build flags integrated into the build function
    export CGO_ENABLED=1
    export GOOS=linux
    export GOARCH=amd64

    go mod download

    go build -a \
      -ldflags="-s -w -linkmode external -X main.GOMEMLIMIT=512MiB -X runtime.defaultGOGC=50" \
      -trimpath \
      -o gopherbook \
      ./app/gopherbook
}

package() {
    # 1. Install the binary from the git build folder
    install -Dm755 "$srcdir/$pkgname/gopherbook" "$pkgdir/usr/bin/gopherbook"

    # 2. Install the local files provided in the source array (from $srcdir)
    install -Dm644 "$srcdir/gopherbook.service" "$pkgdir/usr/lib/systemd/user/gopherbook.service"
    install -Dm644 "$srcdir/gopherbook.conf" "$pkgdir/etc/gopherbook/gopherbook.conf"
}
