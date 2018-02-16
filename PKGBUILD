# Maintainer: Dana Sorensen <dana.r.sorensen@gmail.com>

pkgname=iio-oscilloscope-git
pkgver=v0.7.r44.9eadbd9
pkgrel=1
pkgdesc="A GTK+ based oscilloscope application for interfacing with various IIO devices"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/analogdevicesinc/iio-oscilloscope"
license=('GPL2')
depends=('gtkdatabox' 'libmatio' 'fftw' 'jansson' 'libad9361-iio-git' 'curl')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/analogdevicesinc/iio-oscilloscope.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-master//g;s/-/./g'
}

prepare() {
    # don't ldconfig or update xdg caches (pacman does this)
    sed -i '/ldconfig/s/^/#/' "$srcdir/${pkgname%-git}/Makefile"
    sed -i '/--noupdate/! s/\(xdg-icon-resource\) \(\(un\)\?install\)/\1 \2 --noupdate/' "$srcdir/${pkgname%-git}/Makefile"
    sed -i '/--noupdate/! s/\(xdg-desktop-menu\) \(\(un\)\?install\)/\1 \2 --noupdate/' "$srcdir/${pkgname%-git}/Makefile"
    # change config.h prefix to "/usr"
    sed -i 's/\/usr\/local\//\/usr/' "$srcdir/${pkgname%-git}/config.h"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/${pkgname%-git}"
    install -d "${pkgdir}"/usr/share/{applications,desktop-directories,icons/hicolor}
    make DESTDIR="$pkgdir" PREFIX=/usr XDG_DATA_DIRS="$pkgdir/usr/share" install
}

