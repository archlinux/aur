# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname='wxparaver'
pkgdesc='Expressive powerful and flexible trace visualizer for post-mortem trace analysis (from BSC).'
pkgver='4.9.0.20201210'
pkgrel='1'
arch=('i686' 'x86_64')
url='https://www.bsc.es/discover-bsc/organisation/scientific-structure/performance-tools'
license=('LGPL2.1')
depends=(wxgtk3 webkit2gtk boost libxml2 zlib)
source=("https://ftp.tools.bsc.es/$pkgname/$pkgname-${pkgver%.*}-src.tar.bz2"
        "wxParaver.desktop")
sha512sums=(1043043ec20ddd34cce8b69edcc09b0ffe5171d56e8098aed5eee570c3d63f510574e66e8896ea5d73152bee41ce55c7de705c1cd87075f8787e441c11e48f45
            f1b000ea660765bbd454d9ae54d360233389121e54f8bcab241420b42aefa4f679735500efd43afdcd932f3a7bd339f00ff299f755a62163c1c3e34bd6920f6e)

prepare() {
	cd "$srcdir/$pkgname-${pkgver%.*}"

	# WORKAROUND: By default, it seems that the wxParaver depends on an existing -kernel/-api installation
	cd src/wxparaver
	sed -i 's|-lparaver-kernel -lparaver-api|-L../../paraver-kernel/src/.libs -L../../paraver-kernel/api/.libs -lparaver-kernel -lparaver-api|g' src/Makefile.am
	sed -i 's|^wxparaver_bin_CXXFLAGS =.*|& -I../../paraver-kernel -I../../paraver-kernel/api|' src/Makefile.am
	# shellcheck disable=SC2016
	sed -i 's| -L$PARAVER_LIBDIR||g' configure.ac

	autoreconf -i -f
}

build() {
	cd "$srcdir/$pkgname-${pkgver%.*}"

	# Arch's wx-config is named differently for GTK2/GTK3
	./configure \
		--prefix=/usr \
		--with-wx-config=/bin/wx-config-gtk3

	make
}

package() {
	cd "$srcdir/$pkgname-${pkgver%.*}"

	make DESTDIR="$pkgdir/" install

	# Create a shortcut to execute the application easily from the user's desktop environment
	mkdir -p "$pkgdir/usr/share/applications"
	install -o root -g root -m 644 "$srcdir/wxParaver.desktop" "$pkgdir/usr/share/applications/wxParaver.desktop"
}