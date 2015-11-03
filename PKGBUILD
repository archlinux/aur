# Maintainer: Visa Jokelainen <visaj |a| iki |.| fi>
# Contributor: Thomas Robinson <robinsthom |a| gmail |.| com>
pkgname=robotframework
pkgver=2.9.2
pkgrel=1
pkgdesc="A keyword-driven test automation framework"
arch=('any')
url="http://www.robotframework.org"
license=('Apache')
depends=('python2')
optdepends=('jython: for using robotframework with Java (must be installed before running PKGBUILD)')
source=("https://pypi.python.org/packages/source/r/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('5b7ed3cd22130044fe80f3165f5e0f52')

package() {
    cd "$srcdir/$pkgname-$pkgver"

    echo "creating pybot scripts"
    python2 setup.py install --prefix=/usr --root="$pkgdir" || return 1

    if pacman -Qsq ^jython$;
    then
        echo "creating jybot scripts"
        jython setup.py install --prefix=/opt/jython --root="$pkgdir" || return 1
        mv $pkgdir/opt/jython/bin/* $pkgdir/usr/bin/
    fi

    # Replace python with python2 in shebangs
    cd $pkgdir
    find . -name "*.py" |xargs sed -i 's/^\(#!.*\) python$/\1 python2/'
}
