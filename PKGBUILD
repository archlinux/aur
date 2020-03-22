# Maintainer: Neal Miller <ac9qd@protonmail.com>
# Contributor: Thomas Gatzweiler <thomas.gatzweiler@gmail.com> wsjtx-svn maintainer

pkgname=wsjtx-git
pkgver=r5497.0068f9bc
pkgrel=1
pkgdesc='Software for Amateur Radio Weak-Signal Communication (JT9 and JT65)'
# change _wsjtx_tag to other versions such as wsjtx-2.1.0-rc5
_wsjtx_tag=master
arch=('i686' 'x86_64')
url='http://physics.princeton.edu/pulsar/k1jt/wsjtx.html'
license=('GPL-3')
depends=('qt5-base' 'qt5-multimedia' 'qt5-serialport' 'libusb' 'libusb-compat' 'fftw' 'gcc-fortran' 'hamlib')
makedepends=('cmake' 'git' 'asciidoctor' 'asciidoc' 'qt5-tools')
provides=('wsjtx')
conflicts=('wsjtx')
source=("git+https://git.code.sf.net/p/wsjt/wsjtx/#tag=$_wsjtx_tag"
        "wsjtx.patch")
md5sums=('SKIP'
         '337acf49878ae0f9980c2c9c9a0b7d7b')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cp wsjtx.patch "$srcdir/${pkgname%-git}"
	cd "$srcdir/${pkgname%-git}"
    patch -i wsjtx.patch
}

build() {
	mkdir -p "$srcdir/${pkgname%-git}/build"
	cd "$srcdir/${pkgname%-git}/build"
        cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
	make
}

# make pkg file and reverse patch so its ready for next update
package() {
	cd "$srcdir/${pkgname%-git}/build"
	make DESTDIR="$pkgdir/" install
	cd "$srcdir/${pkgname%-git}"
}
