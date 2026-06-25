# Maintainer: Henrik Holst <hholst80@gmail.com>
pkgname=eukleides
pkgver=1.5.4
pkgrel=3
pkgdesc="Euclidean geometry drawing language"
arch=(x86_64)
url="https://web.archive.org/web/20110716232813/http://www.eukleides.org/"
license=(GPL-3.0-or-later)
depends=(bash readline)
makedepends=(flex bison texinfo)
optdepends=(
	"pstoedit: convert EPS output to other vector formats"
	"texlive-bin: LaTeX and dvips support for helper scripts"
	"texlive-fontutils: epstopdf support for euktopdf"
	"texlive-latex: LaTeX base files for helper scripts"
	"texlive-pstricks: PSTricks support for helper scripts"
)
source=(
	"https://web.archive.org/web/20110716232813id_/http://www.eukleides.org/files/$pkgname-$pkgver.tar.bz2"
	"old-patches.diff"
	"spelling-mistakes.diff"
	"ld-as-needed.diff"
	"fix_gcc-10.patch"
	"cross.patch"
	"utf-8.patch"
	"fixes-for-gcc15.patch"
)
sha256sums=(
	"18c489460cb2cb98f4ea9c0187519ef77b4422117fd43bcd4e4836580ef40c69"
	"996986e1b1e45ea50d1607c77f6a5e61da3c9ef7c33d4e790aaa919daba796cc"
	"c7d572ff4cefd9a8d055b19c5b5fd38e969adc790d041b60b9c75c80b7279f53"
	"a22305a6f3b550a19ed4a075c911dbe396e7c9155ad640b107c90401908be1d3"
	"1874968edcc5541f7ea45da2e0c4924632b3219ad61158ad00028caef3578dd2"
	"3fcd8fe273228394b7dd3ea3088845e01c8b402aca3acf4d72a5d68211da6bcc"
	"f84779933a1074bba998e457fa687328d1c897afe3d36e4d8d27c520262bf423"
	"63916f626ec3d2178341acee95f5d44e4143e74afcf85eb3be4d8de8ac768cc1"
)

prepare() {
	cd "$pkgname-$pkgver"

	local patch_file
	for patch_file in \
		old-patches.diff \
		spelling-mistakes.diff \
		ld-as-needed.diff \
		fix_gcc-10.patch \
		cross.patch \
		utf-8.patch \
		fixes-for-gcc15.patch; do
		patch -Np1 -i "$srcdir/$patch_file"
	done

	sed -i 's|@$(CC) $^ -o $@ $(LIBS)|@$(CC) $(LDFLAGS) $^ -o $@ $(LIBS)|' build/Makefile
	sed -i 's|@$(INSTALL) -s $< $(BIN_DIR)|@$(INSTALL) $< $(BIN_DIR)|' build/Makefile
}

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	install -d "$pkgdir/usr/bin"
	make DESTDIR="$pkgdir" install
	install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
