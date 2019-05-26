# Maintainer : Daniel Bermond < archlinux-org: dbermond >

pkgbase=python-sureal
pkgname=('python-sureal' 'python2-sureal')
_srcname=sureal
pkgver=0.3.4
pkgrel=1
pkgdesc='Subjective quality scores recovery from noisy measurements'
arch=('any')
url='https://github.com/Netflix/sureal/'
license=('APACHE')
makedepends=('git' 'python' 'python-setuptools' 'python-numpy'
             'python2' 'python2-setuptools' 'python2-numpy')
checkdepends=('python-pandas' 'python-matplotlib' 'python-scipy' 'python-pytz'
              'python-dateutil' 'python-kiwisolver' 'python-cycler')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/Netflix/sureal/archive/v${pkgver}.tar.gz")
sha256sums=('922b393e128e64f6901e3e6a2c0203f97e93fba81e53a4574ee1f98a1732f028')

prepare() {
    cp -a "${_srcname}-${pkgver}" "${_srcname}-${pkgver}-py2"
}

build() {
    printf '%s\n' '  -> Building for Python...'
    cd "${_srcname}-${pkgver}"
    python setup.py build
    
    printf '%s\n' '  -> Building for Python2...'
    cd "${srcdir}/${_srcname}-${pkgver}-py2"
    python2 setup.py build
}

check() {
    cd "${_srcname}-${pkgver}"
    python setup.py test
    
    #cd "${_srcname}-${pkgver}-py2"
    #python2 setup.py test
}

package_python-sureal() {
    depends=('python' 'python-numpy' 'python-scipy' 'python-matplotlib' 'python-pandas')
    
    cd "${_srcname}-${pkgver}"
    python setup.py install --root="$pkgdir" --skip-build --optimize='1'
}

package_python2-sureal() {
    pkgdesc='Subjective quality scores recovery from noisy measurements (python2)'
    depends=('python2' 'python2-numpy' 'python2-scipy' 'python2-matplotlib' 'python2-pandas')
    
    cd "${_srcname}-${pkgver}-py2"
    python2 setup.py install --root="$pkgdir" --skip-build  --optimize='1'
    
    mv "$pkgdir"/usr/bin/sureal{,2}
    sed -i '1s/$/2/' "${pkgdir}/usr/lib/python2.7/site-packages/sureal/__main__.py"
}
