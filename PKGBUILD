# Maintainer : Legacy Installer <contact [dot] legacyinstaller [at] gmail [dot] com>
# Contributor: Özgür Sarıer <echo b3pndXJzYXJpZXIxMDExNjAxMTE1QGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Auguste Pop <auguste [at] gmail [dot] com>

pkgname=crafty
pkgver=25.2
pkgrel=4
makedepends=('gzip')
pkgdesc="A free, open-source computer chess program developed by Dr. Robert M. (Bob) Hyatt"
arch=('i686' 'x86_64')
url="http://www.craftychess.com/"
license=('custom')
source=("https://web.archive.org/web/20210304095819/https://www.craftychess.com/downloads/source/$pkgname-$pkgver.zip"
	"https://web.archive.org/web/20170315111827/https://www.craftychess.com/downloads/book/start.pgn.gz"
	"https://web.archive.org/web/20170315114413/https://www.craftychess.com/downloads/book/startc.pgn.gz"
	"https://web.archive.org/web/20170315073701/https://www.craftychess.com/downloads/book/book.bin"
	"copyright"
	"crafty.6"
	"crafty.doc.v18.html"
	"crafty.faq"
	"crafty.rc"
	"readme"
	"tournament.howto"
	"security-203541.patch"
	"paths.patch"
	"Makefile.patch")
md5sums=('d8ad87d9b0fc39a437595203d7b302fc'
	 '880279c223dc34164837a351faafe2f0'
	 '7a53d5f09d2baa5e7f0df4ee81961cfb'
	 'f8f93189c64324b1959a489da822438e'
	 '438cec9f32fb79f58822f97cf64e7afb' 
	 '8f9c577aa6e99bb3e5ada83d1868a8ad' 
	 '584ef65843016328d67a7c9df4007e87' 
	 'f744727e291b6dec7e7c69bb3586b6dd' 
	 '1f8f06ace9f9703297c4adae867e8d34'
	 'd345e23aea028ead565d608002b2e353' 
	 '1e911ca0812ef14f21e40821dda5c1cd'
         '02c7ab07c0ff8f77738a055772f4406d'
         '9db34746e90ceb116d162a5fa727f7e0'
         '178436e4fdacdecd58d0bbdeb9aba924')

prepare() {
	cd "$srcdir"
	patch -Np0 -i "${srcdir}/security-203541.patch"
	patch -Np1 -i "${srcdir}/paths.patch"
	patch -Np0 -i "${srcdir}/Makefile.patch"
	sed -i -e "s:mt=4:mt=$(nproc):" Makefile
	sed -i -e "s:mt=4:mt=$(nproc):" crafty.rc
	gzip -df *.pgn.gz
}

build() {
	cd "$srcdir"
	make CFLAGS="${CFLAGS} `grep -q "popcnt" /proc/cpuinfo && echo "-mpopcnt"`" opt="-DUNIX -DCPUS=$(nproc)" unix-gcc

	cd "$srcdir"
	# create crafty's rc-files within the BUILD directory
	homeorj=$HOME; HOME=.
	msg "Creating bookfiles, this might take a moment..."
	# create books.bin (for crafty's opening strategy)
	msg "Creating books.bin..."
	./crafty "books create start.pgn 60" quit
	# create  bookc.bin (computer opening book)
	msg "Creating bookc.bin..."
	./crafty "bookc create startc.pgn 60 3" quit
	HOME=$homeorj
}

package() {
	cd "$srcdir"
	install -Dpm 0755 crafty "$pkgdir/usr/bin/crafty"
	install -Dpm 0644 crafty.6 "$pkgdir/usr/share/man/man6/crafty.6.gz"
	install -dm 0755 "$pkgdir/usr/share/crafty/syzygy/"
	install -Dpm 0666 book.bin "$pkgdir/usr/share/crafty/book.bin"
	install -pm 0644 bookc.bin books.bin crafty.hlp "$pkgdir/usr/share/crafty/"
	install -Dpm 0644 crafty.rc "$pkgdir/etc/crafty.rc"
	install -Dpm 0644 copyright "$pkgdir/usr/share/licenses/crafty/copyright"
	install -dm 0755 "$pkgdir/usr/share/doc/crafty/"
	install -pm 0644 crafty.doc.v18.html crafty.faq readme tournament.howto "$pkgdir/usr/share/doc/crafty/"
}
