# Maintainer: richli <rich at dranek dot com>
# Contributor: Spyros Stathopoulos <foucault.online@gmail.com>
# Contributor: rememberthemer <rememberthemer@_GMAIL_DOT_COM_>

pkgname=python2-netcdf4
pkgver=1.2.4
pkgrel=1
pkgdesc="Python/numpy interface to the netCDF version 4 library."
arch=('x86_64' 'i686')
url="https://unidata.github.io/netcdf4-python/"
license=('MIT')

depends=('python2-numpy' 'netcdf' 'hdf5' 'curl' 'zlib')
makedepends=('python2-setuptools' 'cython2')
optdepends=('python-netcdf4: python 3 version')
source=(https://github.com/Unidata/netcdf4-python/archive/v${pkgver}rel.tar.gz)
md5sums=('b79eb6c7daa7d9c5ed28df130915eb0b')

build() {
    cd "$srcdir"/netcdf4-python-${pkgver}rel
    # USE_NCCONFIG=1 python2 setup.py clean --all
    USE_NCCONFIG=1 python2 setup.py build
}

check() {
    cd "$srcdir"/netcdf4-python-${pkgver}rel
    cd "test"
    PYTHONPATH="../build/lib.linux-${CARCH}-2.7" python2 -B ./run_all.py
}

package() {
    cd "$srcdir"/netcdf4-python-${pkgver}rel

    # Note that this installs the python2 package as well as some scripts in /usr/bin
    USE_NCCONFIG=1 python2 setup.py install --prefix=/usr \
        --root="$pkgdir" --skip-build --optimize 2

    # We don't need to install the test suite if we already use it in check()
    # install -m755 -d "$pkgdir"/usr/share/doc/$pkgname/test
    # install -m644 -t "$pkgdir"/usr/share/doc/$pkgname/test test/*

    # Install documentation
    install -m755 -d "$pkgdir/usr/share/doc/$pkgname/docs"
    install -m644 -t "$pkgdir/usr/share/doc/$pkgname/docs" docs/netCDF4/*

    # The examples include over 100 MB of binary data, so we don't install it by default
    # install -m755 -d "$pkgdir/usr/share/doc/$pkgname/examples"
    # install -m755 -d "$pkgdir/usr/share/doc/$pkgname/examples/data"
    # find examples -maxdepth 1 -type f -execdir install -m644 -t "$pkgdir/usr/share/doc/$pkgname/examples" {} \+
    # find examples/data -maxdepth 1 -type f -execdir install -m644 -t "$pkgdir/usr/share/doc/$pkgname/examples/data" {} \+

    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set et sw=4 ts=4 sts=4:
