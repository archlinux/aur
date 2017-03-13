# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname='eresi-git'
pkgdesc='Reverse engineering tool suite (includes elfsh)'
pkgver=r1263.c2b0bb66
pkgrel=1
license=('GPL')
url='https://github.com/thorkill/eresi'
source=("${pkgname}::git+${url}")
sha512sums=('SKIP')
arch=('x86_64' 'i686')
depends=('readline' 'termcap' 'bash')

pkgver () {
	cd "${pkgname}"
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build () {
	cd "${pkgname}"
	CFLAGS=-fPIC CXXFLAGS=-fPIC ./configure \
		--enable-32-64 \
		--enable-readline \
		--enable-gstabs+ \
		--prefix=/usr
	cat >> config.h <<-EOF
	CFLAGS32 += -fPIC
	CFLAGS64 += -fPIC
	CFLAGS   += -fPIC
	CXXFLAGS += -fPIC
	LDFLAGS  += -Wl,--as-needed
	EOF
	make -j$(getconf _NPROCESSORS_ONLN)
}

package () {
	cd "${pkgname}"
	make install DESTDIR="${pkgdir}/usr"
}
