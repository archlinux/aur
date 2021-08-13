# Contributor: Alberto Santini <alberto dot santini at upf dot edu>

pkgname='discorde-git'
pkgdesc='C and C++ wrapper around Concorde API'

pkgver=r11.349c753
pkgrel=1
arch=('x86_64')
url='https://github.com/andremaravilha/discorde-tsp'
license=('MIT')
depends=('concorde')
makedepends=('git')
source=('git+https://github.com/andremaravilha/discorde-tsp.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/discorde-tsp"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
    cd "$srcdir/discorde-tsp"

    cd src/api/c
    make all
    
    cd ../cpp
    make all
}

package() {
    install -dm755 "$pkgdir/usr/include/discorde"
    install -m644 "$srcdir/discorde-tsp/src/api/c/src/discorde_c.h" "$pkgdir/usr/include/discorde"
    install -m644 "$srcdir/discorde-tsp/src/api/cpp/src/discorde_cpp.h" "$pkgdir/usr/include/discorde"

    install -dm755 "$pkgdir/usr/lib"
    install -m755 "$srcdir/discorde-tsp/src/api/c/dist/Release/"**/libdiscorde.a "$pkgdir/usr/lib/libdiscorde_c.a"
    install -m755 "$srcdir/discorde-tsp/src/api/cpp/dist/Release/"**/libdiscorde_cpp.a "$pkgdir/usr/lib/libdiscorde_cpp.a"

    install -dm755 "$pkgdir/usr/share/doc/discorde/examples"
    install -m644 "$srcdir/discorde-tsp/README.md" "$pkgdir/usr/share/doc/discorde"
    cp -R "$srcdir/discorde-tsp/examples/src"* "$pkgdir/usr/share/doc/discorde/examples"
    chmod -R 644 "$pkgdir/usr/share/doc/discorde/examples"
}