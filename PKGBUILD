pkgname=arrpc-git
pkgver=3.7.0.r1.g3c4e1ce
pkgrel=1
pkgdesc="Open Discord RPC server for atypical setups"
arch=('x86_64')
url="https://github.com/OpenAsar/arRPC"
license=('MIT')
depends=('nodejs')
makedepends=('git' 'npm')
provides=('arrpc')
conflicts=('arrpc')
install=arrpc.install
source=("${pkgname}::git+https://github.com/OpenAsar/arRPC.git"
    "arrpc.service"
    "arrpc.install")
sha256sums=('SKIP'
    '3fa5e7791f0eadf2c955361da0c3b4b313dc336336bc67d13dd5e0928917c5d9'
    '4da6c27d088a97a6f38f2104eb7ae95321b786625370320a0eae72663d66bd20')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd "$pkgname"
    npm install --production
}

package() {
    cd "$pkgname"

    install -dm755 "$pkgdir/usr/lib/arrpc"
    cp -r . "$pkgdir/usr/lib/arrpc/"

    install -dm755 "$pkgdir/usr/bin"
    printf "#!/bin/sh\nexec node /usr/lib/arrpc/src/index.js \"\$@\"" >"$pkgdir/usr/bin/arrpc"
    chmod +x "$pkgdir/usr/bin/arrpc"

    install -Dm644 "$srcdir/arrpc.service" "$pkgdir/usr/lib/systemd/user/arrpc.service"

    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
