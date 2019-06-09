# Maintainer: Árni Daugr <arnidg@protonmail.ch>
pkgname=futhark-git
pkgver=0.11.1.r1.g34b0ec388
pkgrel=1
pkgdesc='A data-parallel functional programming language'
arch=('x86_64')
url='https://futhark-lang.org/'
license=('ISC')
groups=()
depends=('ncurses5-compat-libs')
makedepends=('stack' 'python-sphinx') 
provides=('futhark')
conflicts=('futhark')
source=('git+https://github.com/diku-dk/futhark.git')
sha512sums=('SKIP')

pkgver() {
  cd futhark
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//'
}

build() {
    cd futhark
    mkdir -p bin
    stack --jobs "$(nproc)" --local-bin-path bin install
    make -C docs man
}

package() {
    cd futhark
    install -Dm755 bin/futhark "$pkgdir/usr/bin/futhark"
    install -Dm644 docs/_build/man/*.1 -t "$pkgdir/usr/share/man/man1"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/futhark/LICENSE"
}

# vim: ts=4:sts=4:sw=4:et
