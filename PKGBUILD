# Maintainer: Spyros Stathopoulos <foucault.online@gmail.com>
# Contributor: richli <rich at dranek dot com>
# Contributor: rememberthemer <rememberthemer@_GMAIL_DOT_COM_>

pkgname=python-netcdf4
pkgver=1.2.7pre
_pkgver=1.2.6
pkgrel=1
pkgdesc="A python3 library for reading, manpiulating and creating netcdf files"
arch=('x86_64' 'i686')
url="https://unidata.github.io/netcdf4-python/"
license=('MIT')

depends=('python<=3.6.99' 'python>3.5.99' 'python-numpy' 'netcdf>=4.1.2' 'hdf5')

makedepends=('cython' 'xz')
optdepends=('python2-netcdf4: python 2 version, includes docs and examples'
            'curl: for OPeNDAP suport')
source=("https://github.com/Unidata/netcdf4-python/archive/v${_pkgver}rel.tar.gz"
        "git6350c32.diff.xz")
md5sums=('2f131c845b279d233105b226bc632798'
         '9f4c3c98762c9d5bf5d7a9fef0a526cb')

prepare() {
    cd "$srcdir"/netcdf4-python-${_pkgver}rel
    patch -p1 < ../'git6350c32.diff'
}

build() {
    cd "$srcdir"/netcdf4-python-${_pkgver}rel
    2to3 -vnw setup.py
    USE_NCCONFIG=1 python setup.py clean --all
    USE_NCCONFIG=1 python setup.py build
}

check() {
    cd "${srcdir}"/netcdf4-python-${_pkgver}rel
    cd "test"
    NO_NET=1 PYTHONPATH="../build/lib.linux-${CARCH}-3.6" python -B ./run_all.py
}

package() {
    cd "$srcdir"/netcdf4-python-${_pkgver}rel
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
