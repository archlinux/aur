# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname='wxparaver'
pkgdesc='Expressive powerful and flexible trace visualizer for post-mortem trace analysis (from BSC).'
pkgver='4.10.6.20230314'
pkgrel='1'
arch=('x86_64')
url='https://www.bsc.es/discover-bsc/organisation/scientific-structure/performance-tools'
license=('LGPL2.1')
depends=(wxwidgets-gtk3 webkit2gtk boost libxml2 zlib)
source=("https://ftp.tools.bsc.es/$pkgname/$pkgname-${pkgver%.*}-src.tar.bz2"
        "wxParaver.desktop")
sha512sums=(3af6c1c02a906574060e97167664078d973d7eef4abfaceec8ad232b87bacb62dc1f0c4282fd2351378d92621361ae23868f342fe165276a985022c1d6ddc3e6
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
