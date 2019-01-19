pkgname=headmaster-git
pkgver=0.28.r15.g96c3387
pkgrel=2

pkgdesc='translate c header files to another language'
url='https://github.com/ytomino/headmaster'
arch=('x86_64')
license=('BSD')

# XXX -jN where N > 1 causes race condition failures
options=('!makeflags')

depends=('mpfr')
makedepends=('git' 'ocamlbuild' 'python-docutils')

provides=('headmaster')
conflicts=('headmaster')

source=('git+https://github.com/ytomino/headmaster'
        'git+https://github.com/ytomino/gmp-ocaml'
        'git+https://github.com/ytomino/unicode-ocaml')

sha256sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
    cd headmaster
    git describe --long --tags | sed -r 's/^v//; s/([^-]*-g)/r\1/; s/-/./g'
}

prepare() {
    cd headmaster
    git submodule init
    git config submodule.lib/gmp-ocaml.url "$srcdir"/gmp-ocaml
    git config submodule.lib/unicode-ocaml.url "$srcdir"/unicode-ocaml
    git submodule update lib/gmp-ocaml lib/unicode-ocaml
}

build() {
    cd headmaster/main
    make
}

package() {
    cd headmaster/main
    make BINDIR="$pkgdir"/usr/bin MANDIR="$pkgdir"/usr/share/man install
    install -Dm0644 "$srcdir"/headmaster/LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
