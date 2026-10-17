# Maintainer: Mubashshir ahmubashshir@gmail.com

pkgname=qt5gtk3-git
pkgver=r14.5c856b9
pkgrel=1
pkgdesc="Qt 5 GTK 3 platform theme backported from Qt 6"
arch=('x86_64' 'aarch64')
url="https://github.com/ahmubashshir/qt5gtk3"
license=('GPL-3.0-only')
depends=('qt5-base' 'gtk3')
makedepends=('cmake' 'git')
provides=('qt5gtk3')
conflicts=('qt5gtk3')
source=("$pkgname::git+$url")
sha256sums=('SKIP')


pkgver()
{
    cd "$srcdir/$pkgname"
    (
        set -o pipefail
        git describe --tags --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
	cmake -B "$srcdir/build" -S "$srcdir/$pkgname" \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_SKIP_INSTALL_RPATH=YES \
		-DCMAKE_SKIP_RPATH=YES \
		-DCMAKE_INSTALL_PREFIX="/usr"
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
