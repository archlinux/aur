# Maintainer: Mariusz Libera <mariusz.libera@gmail.com>
# Contributor: mortdeus <mortdeus@gocos2d.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: Simon Rutishauser <simon.rutishauser@gmx.ch>
pkgname=htmldoc
pkgver=1.8.27
pkgrel=4
pkgdesc="Produce PDF or Postscript from HTML documents including TOCs and Indices"
arch=('i686' 'x86_64')
url="http://www.htmldoc.org"
license=('GPL2')
depends=('libxpm' 'fltk' 'libjpeg' 'openssl' 'shared-mime-info')
conflicts=('htmldoc-svn')
changelog=Changelog
install=$pkgname.install
source=("http://www.msweet.org/files/project1/htmldoc-${pkgver}-source.tar.gz"
	'cve-2009-3050.patch'
	'fortify-fail.patch'
	'libpng15.patch'
	'manpage-fixes.patch'
	'useful-build-info.patch')
sha256sums=('64f6d9f40f00f9cc68df6508123e88ed30fef924881fd28dca45358ecd79d320'
            'a742b1d66d0832ee8aa5ea8e854a31eb2c6e3417d196f8c2ecfac411bfaef6c1'
            'd8d5a5d9ebf5225a32b4f00d80e89a5576122d8c70c5ef60f36c3717c3770746'
            '69a08e3f349b518081109c47b38672f9c8a19a1957b614d7eac8e420fe3bc817'
            'df92c446af6c4d7aef9b69c70e62a31cd992dc8a04f13734bedb1d83257f0e5a'
            'e3494c1cb21dc7daf8774f60060e4fb67d85d563ff294fcf81656718018021e5')

prepare() {
	cd $srcdir/$pkgname-$pkgver

	# apply patches
	for patch in ../*.patch ; do
		patch -Np1 -i $patch
	done

	# fix desktop file
	echo "MimeType=application/vnd.htmldoc-book;" >> desktop/htmldoc.desktop
	sed -i 's/X-Red-Hat.*$//' desktop/htmldoc.desktop
	sed -i 's/htmldoc.png/htmldoc/' desktop/htmldoc.desktop
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make install \
		prefix="$pkgdir/usr" \
		bindir="$pkgdir/usr/bin" \
		mandir="$pkgdir/usr/share/man"

	# documentation
	install -m644 \
		CHANGES.txt \
		README.txt \
		"$pkgdir/usr/share/doc/htmldoc"

    # documentation in .ps is way to heavy - this saves ~150M
    rm "$pkgdir/usr/share/doc/htmldoc/htmldoc.ps"

	# desktop file
	install -Dm644 desktop/htmldoc.desktop \
		"$pkgdir/usr/share/applications/htmldoc.desktop"

	# icons
	for s in 16 24 32 48 64 96 128; do
		install -Dm644 desktop/htmldoc-${s}.png \
			"$pkgdir/usr/share/icons/hicolor/${s}x${s}/apps/htmldoc.png"
	done

	# mime
	install -Dm644 desktop/htmldoc.xml \
		"$pkgdir/usr/share/mime/packages/htmldoc.xml"
}
