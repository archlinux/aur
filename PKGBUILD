# Maintainer : Özgür Sarıer <echo b3pndXJzYXJpZXIxMDExNjAxMTE1QGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Auguste Pop <auguste [at] gmail [dot] com>

_build_book=0 # 0=Uses defauld book.bin
	      # 1=Builds book.bin from book.pgn (Recommended if big book file not bothers you.)

pkgname=crafty
pkgver=25.2
pkgrel=1
pkgdesc="A free, open-source computer chess program developed by Dr. Robert M. (Bob) Hyatt"
arch=('i686' 'x86_64')
url="http://www.craftychess.com/"
license=('custom')
source=("http://www.craftychess.com/downloads/source/$pkgname-$pkgver.zip"
	"`[[ "$_build_book" = '0' ]] && echo book.bin.orj::`http://www.craftychess.com/downloads/book/book.`[[ "$_build_book" = '0' ]] && echo bin || echo pgn.gz`"
	"http://www.craftychess.com/downloads/book/start.pgn.gz"
	"http://www.craftychess.com/downloads/book/startc.pgn.gz"
	"COPYRIGHT")
md5sums=('d8ad87d9b0fc39a437595203d7b302fc'
	 "`[[ "$_build_book" = '0' ]] && echo f8f93189c64324b1959a489da822438e || echo 05efad71289b2d328da5110df4a19f85`"
	 '880279c223dc34164837a351faafe2f0'
	 '7a53d5f09d2baa5e7f0df4ee81961cfb'
	 '438cec9f32fb79f58822f97cf64e7afb')

prepare() {
	cd "$srcdir"
	sed -i -e 's:./runprof:sh ./runprof:' -e "s:-DTEST:-DBOOKDIR=\"\\\\\"/usr/share/crafty\\\\\"\" -DTEST:" Makefile
	sed -i 's:"crafty.hlp":BOOKDIR"/crafty.hlp":' option.c
	sed -i '/PopCnt/s/arg1/x/' boolean.c # bug fix
}

build() {
	cd "$srcdir"
	unset LDFLAGS
	make unix-gcc-profile

	cd "$srcdir"
    
	msg "Creating books.bin..."
	./crafty "book create start.pgn 60" quit
	mv book.bin books.bin

	msg "Creating bookc.bin..."
	./crafty "book create startc.pgn 60" quit
	mv book.bin bookc.bin

	if [[ "$_build_book" = '0' ]]; then
		mv book.bin.orj book.bin
	else
		msg "Creating book.bin..."
		./crafty "book create book.pgn 60" quit
	fi
}

package() {
	cd "$srcdir"
	install -Dm755 crafty "$pkgdir/usr/bin/crafty"
	install -Dm644 crafty.hlp "$pkgdir/usr/share/crafty/crafty.hlp"

	cd "$srcdir"
	install -m777 book.bin "$pkgdir/usr/share/crafty/"
	install -m644 books.bin "$pkgdir/usr/share/crafty/"
	install -m644 bookc.bin "$pkgdir/usr/share/crafty/"
	install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/COPYRIGHT"
}
