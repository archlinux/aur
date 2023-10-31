# Maintkiner: LoaD Accumulator <lda@freetards.xyz>
pkgname=cytoplasm-git
pkgver=0.4.0
pkgrel=3
pkgdesc="The Telodendria core library"
arch=('i686' 'x86_64' 'aarch64')
url="https://git.telodendria.io/Telodendria/Cytoplasm"
license=('Telodendria')
depends=('openssl')
makedepends=('git')
provides=('cytoplasm')
source=($pkgname::git+https://git.telodendria.io/Telodendria/Cytoplasm.git)
md5sums=()
validpgpkeys=()
md5sums=("SKIP")

prepare() {
        cd "$pkgname"
}

pkgver() {
        cd "$pkgname"
        # Cytoplasm doesn't have tags(at least right now), so the only 
        # reasonable way is to trick the configure script into giving 
        # us the version.
        ./configure info                |
                tr ' ' '\n'             | 
                grep -x "\\--[a-z].*"   | 
                awk '/^--lib-version=/' | 
                cut -d'=' -f2
}

build() {
        cd "$pkgname"
        # By default, it uses the c99 compiler instead of cc?????
        export CC=cc
        ./configure --prefix=$pkgdir/usr --no-static
        make
}

package() {
        cd "$pkgname"
        make DESTDIR="$pkgdir/" install
}
