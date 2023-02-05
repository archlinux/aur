
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=buongiorno-git
_pkgname=buongiorno
pkgver=0.1.1.r0.g3b4e223
pkgrel=1
pkgdesc='Modal TUI greeter for greetd.'
arch=('x86_64')
url='https://sr.ht/~andreafeletto/buongiorno'
license=('GPL3')
depends=('greetd')
makedepends=('zig' 'git')
provides=('buongiorno')
conflicts=('buongiorno-git')
source=(
    "git+https://git.sr.ht/~andreafeletto/$_pkgname"
    'git+https://git.sr.ht/~leon_plickat/zig-spoon'
    'git+https://github.com/Hejsil/zig-clap'
)
sha256sums=(
    'SKIP'
    'SKIP'
    'SKIP'
)

prepare() {
   cd "$srcdir/$_pkgname"
   git submodule init
   for dep in spoon clap; do
       git config "submodule.deps/zig-$dep.url" "$srcdir/zig-$dep"
   done
   git -c protocol.file.allow=always submodule update
}

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long | sed 's/v//;s/-/.r/;s/-/./'
}

build() {
    cd "$srcdir/$_pkgname"
    zig build -Drelease-safe -Dsystemd
}

package() {
    cd "$srcdir/$_pkgname"
    DESTDIR="$pkgdir" zig build -Drelease-safe -Dsystemd --prefix '/usr'
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
