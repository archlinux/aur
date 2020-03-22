# Maintainer: Neal Miller <ac9qd@protonmail.com>

pkgname=wsjtx-superbuild-git
pkgver=r35.491536f
pkgrel=3
pkgdesc='Software for Amateur Radio Weak-Signal Communication (JT9 and JT65) - Superbuild/git version, hamlib not required'
arch=('i686' 'x86_64')
url='http://physics.princeton.edu/pulsar/k1jt/wsjtx.html'
license=('GPL-3')
depends=('qt5-base' 'qt5-multimedia' 'qt5-serialport' 'libusb' 'libusb-compat' 'fftw' 'gcc-fortran')
makedepends=('cmake' 'git' 'asciidoc' 'asciidoctor' 'qt5-tools')
provides=('wsjtx')
conflicts=('wsjtx')
source=('git+https://git.code.sf.net/p/wsjt/wsjtx-superbuild/'
        'wsjtx.patch'
        'repo.patch')
md5sums=('SKIP'
         'f50bfe0cb3d7bf91ee9b6b6302b78d65'
         'd7446a4c8d44880b1c772493a7f170c6')
#set branch to build with WSJTX_TAG variable, or a specific version eg. wsjtx-1.9.0
_wsjtx_tag=wsjtx-2.1.2

pkgver() {
	cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    patch -p1 -i repo.patch
    cp wsjtx.patch "$srcdir/${pkgname%-git}"
	mkdir -p "$srcdir/${pkgname%-git}/build"
	cd "$srcdir/${pkgname%-git}/build"
        cmake -DWSJTX_TAG=$_wsjtx_tag -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
	make
}

package() {
	cd "$srcdir/${pkgname%-git}/build"
	make DESTDIR="$pkgdir/" install
}
