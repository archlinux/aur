# Maintainer: Neal Miller <ac9qd@protonmail.com>

pkgname=wsjtx-superbuild-git
pkgver=r35.491536f
pkgrel=5
pkgdesc='Software for Amateur Radio Weak-Signal Communication (JT9 and JT65) - Superbuild/git version, hamlib not required'
arch=('i686' 'x86_64')
url='http://physics.princeton.edu/pulsar/k1jt/wsjtx.html'
license=('GPL-3')
depends=('qt5-base' 'qt5-multimedia' 'qt5-serialport' 'libusb' 'libusb-compat' 'fftw')
makedepends=('cmake' 'git' 'asciidoc' 'asciidoctor' 'qt5-tools' 'gcc-fortran')
provides=('wsjtx')
conflicts=('wsjtx')
source=('git+https://git.code.sf.net/p/wsjt/wsjtx-superbuild/'
        'repo.patch')
md5sums=('SKIP'
         'd7446a4c8d44880b1c772493a7f170c6')
#set branch to build with WSJTX_TAG variable, or a specific version eg. wsjtx-1.9.0
_wsjtx_tag=master

pkgver() {
	cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    patch -p1 -i repo.patch
	mkdir -p "$srcdir/${pkgname%-git}/build"
	cd "$srcdir/${pkgname%-git}/build"
        cmake -DWSJTX_TAG=$_wsjtx_tag -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
	make
}

package() {
	cd "$srcdir/${pkgname%-git}/build"
	make DESTDIR="$pkgdir/" install
}
