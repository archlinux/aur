# Maintainer: "Darren Ng <$(base64 --decode <<<VW4xR2ZuQGdtYWlsLmNvbQo=)>"
pkgname=genimage
pkgver=14
pkgrel=1
pkgdesc="tool to generate multiple filesystem and flash images from a tree"
arch=($CARCH)
url=https://github.com/pengutronix/$pkgname
license=(GPL2)
depends=(confuse)
# https://sphinx-rtd-theme.readthedocs.io/en/stable/
# makedepends=(python-sphinx python-sphinx_rtd_theme)
source=($pkgname-$pkgver.tar.gz::https://github.com/pengutronix/$pkgname/archive/v$pkgver.tar.gz
        index.html::https://github.com/pengutronix/genimage/blob/v14/README.rst)
sha1sums=(043fed792abe0280b830c61765fd44870f1fdf61 SKIP)

build() {

	cd $pkgname-$pkgver
  # cp configure.ac{,\~}
  # autoupdate # Corrupts ./configure
  # diff -u configure.ac{\~,}
  ./autogen.sh
  ./configure --prefix=/usr --enable-silent-rules --disable-dependency-tracking
	make

  # https://www.sphinx-doc.org/en/master/man/sphinx-quickstart.html
  # sphinx-quickstart --sep -p genimage -a "Michael Olbrich" -v 14 -r 14 -l en -d master_doc=README --ext-autodoc --ext-viewcode --ext-githubpages --no-batchfile .
  # https://www.sphinx-doc.org/en/master/man/sphinx-build.html
  # sphinx-build -b dirhtml -d .doctrees -n -v . ./build

}

# https://github.com/pengutronix/genimage/issues/157
# check() {
# 	cd $pkgname-$pkgver
# 	make -k check
# }

package() {
	cd $pkgname-$pkgver
	make DESTDIR="$pkgdir/" install
  install -vdm755 "$pkgdir/usr/share/doc/$pkgname"; cp -Lv "$srcdir/index.html" "$_"
}
