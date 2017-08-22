# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Giancarlo Bianchi <giancarlobianchi76-[remove this]-@-[and this]-gmail-[and this]-.com>
pkgname=subcli
pkgver=0.4
pkgrel=3
pkgdesc="CLI program to modify text based subtitles"
arch=('any')
url="https://code.google.com/p/subcli"
license=('GPL')
depends=('python2')
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/${pkgname}/${pkgname}_v${pkgver}.tar.gz")
md5sums=('2a69e2db27f048abf2e97f957f83fb7d')

package() {
	cd "$srcdir/$pkgname"
	install -d "$pkgdir/usr/share/$pkgname/modules"

  msg "Compiling and installing python modules"
  cd modules
	for i in *.py; do
    echo "$i"
		sed -i '1i#\!\/usr\/bin\/env\ python2' "$i"
    python2 -c "import py_compile; py_compile.compile('$i')"
		install -m 0644 "${i/.py/.pyc}" "$pkgdir/usr/share/$pkgname/modules/${i/.py/.pyc}"
	done
  install -m 0644 default.{ass,ssa} "$pkgdir/usr/share/$pkgname/modules"

  msg "Compiling and installing main binaries"
  cd "$srcdir/$pkgname"
	python2 -c "import py_compile; py_compile.compile('subcli.py')"
	install -m 0755 subcli.pyc "$pkgdir/usr/share/$pkgname/subcli.pyc"

  sed -i 's!/usr/local/share/apps!exec\ python2\ /usr/share!' subcli
	install -Dm 0755 subcli "$pkgdir/usr/bin/subcli"
}

# vim:set ts=2 sw=2 et:
