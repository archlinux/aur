# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname='wxparaver'
pkgdesc='Expressive powerful and flexible trace visualizer for post-mortem trace analysis (from BSC).'
pkgver='4.13.2.20261118'
pkgrel='1'
arch=('x86_64')
url='https://www.bsc.es/discover-bsc/organisation/scientific-structure/performance-tools'
license=('LGPL-2.1-or-later')
depends=(wxwidgets-gtk3 boost libxml2 zlib)
source=("https://ftp.tools.bsc.es/$pkgname/$pkgname-${pkgver%.*}-src.tar.bz2"
        "wxparaver-tutorialsdownload-Fix-Boost-ASIO-1.87.0-removals.patch"
        "wxParaver.desktop")
sha512sums=(b135278bf56d5dc4f2218423d2a0b4e8fcce8b0faa0594434965967986fcb916dce7131a3a20c763ecf46d86548674ee56dac372f92f56fdc829fab3ea63601d
            942fd0f3df5fb8fed60b5a56e29b3b5b3c8e84d1c81de254824224aa584fbd367371556c9b38ae7f6db97f1025919ba2ff8c6bf121d31e68e429693e431c4806
            50dd3ff677895b9aad9b17a67c6791f96acc2b9c5bf65b3991a1b92cb17c6567735a740188aaedcf211ca9bfbfb7ef758109d57296315afdd35707b49955cb3c)

prepare() {
	cd "$srcdir/$pkgname-${pkgver%.*}"

	# WORKAROUND: By default, it seems that the wxParaver depends on an existing -kernel/-api installation
	#             We want to use the ones we just built, so replace the references to point to them instead
	cd src/wxparaver
	sed -i \
	    -e 's|-lparaver-api -lparaver-kernel|-L../../paraver-kernel/src/.libs -L../../paraver-kernel/api/.libs -lparaver-api -lparaver-kernel|g' \
	    -e '$awxparaver_bin_CXXFLAGS = @CXXFLAGS@ -I../../paraver-kernel -I../../paraver-kernel/api' \
	    src/Makefile.am
	# shellcheck disable=SC2016
	sed -i 's| -L$PARAVER_LIBDIR||g' configure.ac

	patch -Np1 -i "$srcdir/wxparaver-tutorialsdownload-Fix-Boost-ASIO-1.87.0-removals.patch"

	autoreconf -i -f
}

build() {
	cd "$srcdir/$pkgname-${pkgver%.*}"

	# Arch's wx-config is named differently for GTK2/GTK3
	./configure \
		--prefix=/usr \
		--with-wx-config=/bin/wx-config

	make
}

package() {
	cd "$srcdir/$pkgname-${pkgver%.*}"

	make DESTDIR="$pkgdir/" install

	# Create a shortcut to execute the application easily from the user's desktop environment
	mkdir -p "$pkgdir/usr/share/applications"
	install -o root -g root -m 644 "$srcdir/wxParaver.desktop" "$pkgdir/usr/share/applications/wxParaver.desktop"
}
