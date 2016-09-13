# Maintainer: arjan5 <aur@anymore.nl>
pkgname=jpeg-archive
pkgver=2.1.1.r13.b4f705d
pkgrel=1
pkgdesc="Utilities for archiving JPEGs for long term storage"
arch=("x86_64" "i686")
url="https://github.com/danielgtaylor/jpeg-archive/"
license=('MIT')
groups=()
depends=()
makedepends=('git' 'nasm')
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
replaces=()
backup=()
options=()
install=
changelog=
source=('jpeg-archive::git+https://github.com/danielgtaylor/jpeg-archive.git' 'mozjpeg::git+https://github.com/mozilla/mozjpeg.git')
noextract=()
md5sums=('SKIP' 'SKIP')

pkgver() {
    cd "$pkgname"
    printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
    cd "$srcdir/mozjpeg"
    autoreconf -fiv
    ./configure --with-jpeg8 --prefix="$srcdir/mozjpeg-install"
    make
    make install
    [ -d "$srcdir/mozjpeg-install/lib64" ] || ln -s "$srcdir/mozjpeg-install/lib" "$srcdir/mozjpeg-install/lib64"
    cd "$srcdir/${pkgname%-VCS}"
    MOZJPEG_PREFIX="$srcdir/mozjpeg-install" make
}

package() {
    cd "$srcdir/${pkgname%-VCS}"
    make PREFIX="$pkgdir/usr" install
}
