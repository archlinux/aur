# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname='wxparaver'
pkgdesc='Expressive powerful and flexible trace visualizer for post-mortem trace analysis (from BSC).'
pkgver='4.8.1'
pkgrel='2'
arch=('i686' 'x86_64')
url='https://www.bsc.es/discover-bsc/organisation/scientific-structure/performance-tools'
license=('LGPLv2.1')
depends=('wxgtk3' 'webkit2gtk' 'boost')
source=(https://ftp.tools.bsc.es/wxparaver/wxparaver-4.8.1-src.tar.bz2
        wxParaver.desktop)
sha512sums=(80481fc75b977f85476658e25e9d091530f64f1b04b15d826715fb5e9646c33c14e46ef8d5233f1b57c442895cf96206b8812bded482f58dce76888745cc88e6
            f1b000ea660765bbd454d9ae54d360233389121e54f8bcab241420b42aefa4f679735500efd43afdcd932f3a7bd339f00ff299f755a62163c1c3e34bd6920f6e)

build() {
	cd "$srcdir/$pkgname-$pkgver"

	# FIXME: By default, it seems that the wxParaver depends on an existing -kernel/-api installation
	cd src/wxparaver
	sed -i 's|-lparaver-kernel -lparaver-api|-L../../paraver-kernel/src/.libs -L../../paraver-kernel/api/.libs -lparaver-kernel -lparaver-api|g' src/Makefile.am
        sed -i 's|^wxparaver_bin_CXXFLAGS =.*|& -I../../paraver-kernel -I../../paraver-kernel/api|' src/Makefile.am
	aclocal
	automake --add-missing
	autoconf
	cd ../..

	# Arch's wx-config is named differently for GTK2/GTK3
	./configure \
		--prefix=/usr \
		--with-wx-config=/bin/wx-config-gtk3

	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	make DESTDIR="$pkgdir/" install

	mkdir -p "$pkgdir/usr/share/applications"
	install -o root -g root -m 644 "$srcdir/wxParaver.desktop" "$pkgdir/usr/share/applications/wxParaver.desktop"
}