# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname='wxparaver'
pkgdesc='Expressive powerful and flexible trace visualizer for post-mortem trace analysis (from BSC).'
pkgver='4.11.4.20240307'
pkgrel='1'
arch=('x86_64')
url='https://www.bsc.es/discover-bsc/organisation/scientific-structure/performance-tools'
license=('LGPL2.1')
depends=(wxwidgets-gtk3 webkit2gtk boost libxml2 zlib)
source=("https://ftp.tools.bsc.es/$pkgname/$pkgname-${pkgver%.*}-src.tar.bz2"
        "wxParaver.desktop")
sha512sums=(1097aa45ca8b23ef718e13026f32e16d6e1e4c292fcb0e674c0a600f6f89d04a3cb9ff6d7e6c154dfc159701e4d541deb03cb195d289ba34b7c9f2369b6a7b23
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
