pkgname='gst-bt-git'
pkgver=r57.fb2680d
pkgrel=1
pkgdesc='GStreamer plug-in which provides BitTorrent sources'
license='LGPL'
url='https://github.com/turran/gst-bt'
source=("${pkgname}::git+${url}.git")
sha1sums=('SKIP')
arch=('i686' 'x86_64' 'arm')
depends=('gstreamer' 'libtorrent-rasterbar')
builddepends=('gst-plugins-base' 'automake' 'autoconf')
options=('strip')
provides=('gst-bt')
conflicts=('gst-bt')

pkgver () {
	cd "${srcdir}/${pkgname}"
	( set -o pipefail
	  git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build () {
	cd "${srcdir}/${pkgname}"
	./autogen.sh --with-gstreamer-api=1.0 --prefix=/usr
	make PREFIX=/usr
}

package () {
	cd "${srcdir}/${pkgname}"
	install -Dm755 src/.libs/libgstbt.so.0.0.0 \
		"${pkgdir}/usr/lib/gstreamer-1.0/libgstbt.so"
}
