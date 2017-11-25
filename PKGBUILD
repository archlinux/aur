pkgname=headmaster-git
pkgver=0.27.r55.gf6a265e
pkgrel=2

pkgdesc='translate c header files to another language'
url='https://github.com/ytomino/headmaster'
arch=('i686' 'x86_64')
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
    cd headmaster
    install -Dm0755 main/bin/main.native "$pkgdir"/usr/bin/headmaster
    install -Dm0644 main/man1/headmaster.1 "$pkgdir"/usr/share/man/man1/headmaster.1
    install -Dm0644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
