# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Contributor: B. Lee <darklin20 /at/ gmail.com>
pkgname=gle-graphics
pkgver=4.2.4c
pkgrel=3
arch=('i686' 'x86_64')
pkgdesc='Graphics scripting language for creating graphs, plots, diagrams and figures'
url='http://www.gle-graphics.org/'
license=('BSD' 'GPL')
depends=('libtiff' 'libjpeg' 'libpng15' 'ghostscript')
makedepends=('qt4' 'openssl' 'zlib'	'ghostscript' 'texlive-bin' 'texlive-core' 'texlive-latexextra')
optdepends=('texlive: latex labels in gle scripts' 'qt4: qgle')
source=(http://prdownloads.sourceforge.net/glx/gle-graphics-${pkgver}f-src.tar.gz
	gle-graphics-$pkgver-libloader.patch
	gle-graphics-$pkgver-transperancy.patch
	gle-graphics-$pkgver-non-ascii.patch)
install=gle-graphics.install
md5sums=('5eef0a63ee0077237b8a36fe1a24407f'
	'92f81bd634975bb96154ebfc2337629e'
	'cecfbdf3d18390485a8a963448fd55aa'
	'2196ee0a27645b764ac84f59957c79f3')

# I didn't split building into build() and package() because it works
# incorrectly with gle-graphics. And I don't know why!!

build() {
	cd $srcdir/$pkgname-$pkgver

	unset MAKEFLAGS
	sed -i -e 's:GLE_INSTALL_DATA=$prefix/share/$PACKAGE_TARNAME/$GLE_VERSION:GLE_INSTALL_DATA=$prefix/share/$PACKAGE_TARNAME:' configure

#	patch -p1 -i $srcdir/gle-graphics-$pkgver-libloader.patch
	patch -p1 -i $srcdir/gle-graphics-$pkgver-transperancy.patch
	patch -p1 -i $srcdir/gle-graphics-$pkgver-non-ascii.patch

	./configure --prefix=/usr --with-qt --with-jpeg --with-png --with-tiff --with-z \
	            --with-manip --with-libgle --with-rpath=no --with-extrafonts --with-x

	make

	# Add just compiled GLE to path in order to build documentation
	set PATH=$PATH:$srcdir/$pkgname-$pkgver/build/bin
	make doc

	make DESTDIR=$pkgdir install

	install -D -m644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
	install -D -m644 platform/autopackage/gle.png $pkgdir/usr/share/icons/hicolor/48x48/apps/gle.png
	install -D -m644 platform/autopackage/gle.xml $pkgdir/usr/share/mime/packages/gle.xml
	install -D -m644 platform/autopackage/gle.desktop $pkgdir/usr/share/applications/gle.desktop
}
