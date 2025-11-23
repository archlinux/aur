# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname='wxparaver'
pkgdesc='Expressive powerful and flexible trace visualizer for post-mortem trace analysis (from BSC).'
pkgver='4.12.0.20241204'
pkgrel='3'
arch=('x86_64')
url='https://www.bsc.es/discover-bsc/organisation/scientific-structure/performance-tools'
license=('LGPL-2.1-or-later')
depends=(wxwidgets-gtk3 webkit2gtk boost libxml2 zlib)
source=("https://ftp.tools.bsc.es/$pkgname/$pkgname-${pkgver%.*}-src.tar.bz2"
        "wxparaver-tutorialsdownload-Fix-Boost-ASIO-1.87.0-removals.patch"
        "wxParaver.desktop")
sha512sums=(9d44e08cb0372d1bda5d859c8cdc3aa17e4ea211694969b520c85b79fb70cc9584a9f408403ca3f3153404cf66c3484c6891fa16d09fde3d297366b11fd684c1
            942fd0f3df5fb8fed60b5a56e29b3b5b3c8e84d1c81de254824224aa584fbd367371556c9b38ae7f6db97f1025919ba2ff8c6bf121d31e68e429693e431c4806
            f1b000ea660765bbd454d9ae54d360233389121e54f8bcab241420b42aefa4f679735500efd43afdcd932f3a7bd339f00ff299f755a62163c1c3e34bd6920f6e)

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
