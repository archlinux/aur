# Maintainer: Azat Khuzhin <a3at.mail@gmail.com>
pkgname=chdig-git
pkgver=v0.3.0.r46.gfd9bdff
pkgrel=1
pkgdesc="Dig into ClickHouse with TUI interface"
arch=('x86_64')
depends=('bash')
makedepends=('git' 'rust' 'pyoxidizer')
conflicts=("chdig")
provides=("chdig")
url="https://github.com/azat/chdig"
license=('MIT')

source=(
    "$pkgname::git+$url"
    "git+https://github.com/4rtzel/tfg"
)

sha256sums=(
    'SKIP'
    'SKIP'
)

# Some of this may have fortify sources of whatever this could break musl build
CFLAGS=
CXXFLAGS=
LDFLAGS=
LTOFLAGS=

prepare() {
    cd "$srcdir/$pkgname"
    git submodule init
    git config submodule.contrib/tfg.url "$srcdir/tfg"
    git -c protocol.file.allow=always submodule update
}

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$pkgname"
    make build build_completion
}

package() {
    cd $srcdir/$pkgname
    make install DESTDIR="$pkgdir/usr"
}
# vim set: ts=4 sw=4 et
