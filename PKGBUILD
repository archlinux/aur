# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Alex Brinister <alex_brinister at yahoo dot com>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Gabriel Martinez < reitaka at gmail dot com >

pkgname=libimobiledevice-git
epoch=1
pkgver=1.3.0.r179.g860ffb7
pkgrel=1
pkgdesc="Library that talks the protocols to support iPhone and iPod Touch devices on Linux"
url="http://www.libimobiledevice.org/"
arch=(x86_64)
license=(GPL2 LGPL2.1)
depends=(
  gnutls
  libgcrypt
  libplist-git
  libtasn1
  libusbmuxd-git
  libimobiledevice-glue-git
)
makedepends=(
  autoconf-archive
  cython
  git
  python
  python-setuptools
)
optdepends=('python: for the Python bindings')
provides=(libimobiledevice-1.0.so "libimobiledevice=$pkgver")
conflicts=(libimobiledevice)
source=("git+https://github.com/libimobiledevice/libimobiledevice")
sha256sums=('SKIP')

pkgver() {
	cd libimobiledevice
	git describe --long --tags | sed 's/-/.r/;s/-/./'
}

prepare() {
	cd libimobiledevice
	NOCONFIGURE=1 ./autogen.sh
}

build() {
	cd libimobiledevice
	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
		--without-openssl \
		--with-gnutls
	#sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool # not needed anymore (libtool honors $LDFLAGS now)
	make
}

check() {
	cd libimobiledevice
	make check
}

package() {
	cd libimobiledevice
	make DESTDIR="$pkgdir" install
}
