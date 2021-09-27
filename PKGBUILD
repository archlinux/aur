pkgname=gtksu-git
pkgver=0.1.6.r3.ga8528e7
pkgrel=1
pkgdesc="A simple replacement for gksu"
arch=('x86_64')
url="https://github.com/KeithDHedger/GtkSu"
license=('GPL')
depends=('qt5-base')
makedepends=('git')
provides=("${pkgname%-git}" 'gksu')
conflicts=("${pkgname%-git}" 'gksu')
source=(""${pkgname%-git}"::git+https://github.com/KeithDHedger/GtkSu.git")
md5sums=('SKIP')
 
pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long --tags | sed 's/^gtksu.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
 
prepare() {
    cd "$srcdir/${pkgname%-git}"
 
    # Fix building with aclocal 1.16
    find . -type f -exec sed -i 's|1.15|1.16|g' {} \;
}
 
build() {
     cd "$srcdir/${pkgname%-git}"
     ./autogen.sh
     ./configure --prefix=/usr --enable-qt5
     make
}
 
package() {
    cd "$srcdir/${pkgname%-git}"
    make DESTDIR="$pkgdir" install
 
    ln -s "/usr/bin/$_pkgname" "$pkgdir/usr/bin/gksu"
}
