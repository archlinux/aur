# 
pkgname=sdn
pkgver=r72.296c0cc
pkgrel=1
pkgdesc="A simple directory navigator"
arch=('x86_64')
url="https://git.janouch.name/p/sdn/"
license=('custom:0BSD')
depends=('ncurses' 'acl')
makedepends=('git')
source=("git+https://git.janouch.name/p/sdn.git")
sha1sums=("SKIP")

pkgver() {
    cd "$pkgname"
    # git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
    ( set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )

}

build() {
    mkdir "$pkgname"/build
    cd "$pkgname"/build
    # cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Debug
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "$pkgname"/build
    # make DESTDIR="$pkgdir" install
    install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
    install -Dm644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm644 ../README.adoc "$pkgdir"/usr/share/doc/$pkgname/README.adoc
}

