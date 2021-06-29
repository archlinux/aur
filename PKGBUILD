# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname='wxparaver'
pkgdesc='Expressive powerful and flexible trace visualizer for post-mortem trace analysis (from BSC).'
pkgver='4.9.2.20210302'
pkgrel='2'
arch=('i686' 'x86_64')
url='https://www.bsc.es/discover-bsc/organisation/scientific-structure/performance-tools'
license=('LGPL2.1')
depends=(wxgtk3 webkit2gtk boost libxml2 zlib)
source=("https://ftp.tools.bsc.es/$pkgname/$pkgname-${pkgver%.*}-src.tar.bz2"
        "wxparaver-Build-fix-for-GCC-11-invocable-as-const.patch"
        "wxParaver.desktop")
sha512sums=(f1fbe6dbd467f38a1d50bd8108ab2174128c337206b304644f57d966d1d67b7e159a60756dce0976bdaabe10170d7862eb2bfdf10437f5d8ef599066f2fad152
            a42b6481594cbab6bf4018f09bb83578cfd2fb06ad80766ece509fd48b0af76f77fd9b4b1d15129b7d1fe9b15c53e1efaea1e47bb7e76c1442f8089c0e0904b3
            f1b000ea660765bbd454d9ae54d360233389121e54f8bcab241420b42aefa4f679735500efd43afdcd932f3a7bd339f00ff299f755a62163c1c3e34bd6920f6e)

prepare() {
	cd "$srcdir/$pkgname-${pkgver%.*}"

	# Fix build for GCC 11
	patch -Np1 -i "${srcdir}/wxparaver-Build-fix-for-GCC-11-invocable-as-const.patch"

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