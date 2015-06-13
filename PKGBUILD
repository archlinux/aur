# Maintainer: Spyros Stathopoulos <foucault.online@gmail.com>
# Contributor: richli <rich at dranek dot com>
# Contributor: rememberthemer <rememberthemer@_GMAIL_DOT_COM_>

pkgname=python-netcdf4
pkgver=1.1.8
pkgrel=1
pkgdesc="A python3 library for reading, manpiulating and creating netcdf files"
arch=('x86_64' 'i686')
url="https://unidata.github.io/netcdf4-python/"
license=('MIT')

depends=('python' 'python-numpy' 'netcdf>=4.1.2' 'hdf5'
         'curl' 'zlib' 'libssh2' 'openssl' 'python-dateutil')
makedepends=('cython')
optdepends=('python2-netcdf4: python 2 version, includes docs and examples')
source=(https://github.com/Unidata/netcdf4-python/archive/v${pkgver}rel.tar.gz)
md5sums=('1c63b736e8479b263832690b399a7660')

build() {
    cd "$srcdir"/netcdf4-python-${pkgver}rel
    2to3 -vnw setup.py
    USE_NCCONFIG=1 python setup.py clean --all
    USE_NCCONFIG=1 python setup.py build
}

check() {
    cd "${srcdir}"/netcdf4-python-${pkgver}rel
    cd "test"
    PYTHONPATH="../build/lib.linux-${CARCH}-3.4" python -B ./run_all.py
}

package() {
    cd "$srcdir"/netcdf4-python-${pkgver}rel
     USE_NCCONFIG=1 python setup.py install --prefix=/usr \
         --root="$pkgdir" --skip-build --optimize 2

    mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
    cp -d -r --no-preserve=ownership test "${pkgdir}/usr/share/doc/${pkgname}"
    cp -d -r --no-preserve=ownership docs "${pkgdir}/usr/share/doc/${pkgname}"
    # cp -d -r --no-preserve=ownership examples "${pkgdir}/usr/share/doc/${pkgname}"

    rm -r "$pkgdir"/usr/bin
    install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}

# vim: set et sw=4 ts=4 sts=4:
