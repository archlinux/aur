# Maintainer: Tilman Blumenbach <tilman AT ax86 DOT net>

pkgname=keepass-plugin-rpc
pkgver=1.2.7
pkgrel=2
pkgdesc="RPC plugin for Keepass"
arch=(i686 x86_64)
url="http://keefox.org/"
license=('GPL')
depends=(keepass)
# Technically, mono is already pulled in by the keepass dependency.
makedepends=(mono)
source=("https://github.com/luckyrat/KeeFox/archive/v${pkgver}.tar.gz"
        build-fixes.patch)

prepare() {
    cd "$srcdir/KeeFox-$pkgver"

    # Need --binary option because of DOS line endings.
    patch --binary -Np1 -i "$srcdir/build-fixes.patch"
}

build() {
    cd "$srcdir/KeeFox-$pkgver/KeePassRPC"

    xbuild /property:Configuration=Release KeePassRPC.csproj
}

package() {
    cd "$srcdir/KeeFox-$pkgver/KeePassRPC/bin/Release"

    for f in Jayrock*.dll KeePassRPC.dll; do
        install -m 644 -D "$f" "${pkgdir}/usr/share/keepass/plugins/rpc/${f}"
    done
}

md5sums=('b854bb627b5477d9ef9ac1becc9e4a63'
         '4744511f20a030802cec01e71714b5f3')
