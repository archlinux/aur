# Maintainer: Daniel Bermond < gmail-com: danielbermond >

# waiting for upstream to finish python3 support
# https://github.com/Netflix/vmaf/issues/331

pkgname=python2-vmaf
_srcname=vmaf
pkgver=1.3.14
pkgrel=2
pkgdesc='Perceptual video quality assessment algorithm based on multi-method fusion (python2 implementation)'
arch=('any')
url='https://github.com/netflix/vmaf/'
license=('APACHE')
depends=(
    # official repositories:
        'python2' 'python2-numpy' 'python2-scipy' 'python2-matplotlib'
        'python2-pandas' 'python2-scikit-learn' 'python2-h5py'
    # AUR:
        'python2-scikit-image' 'python2-sureal'
)
makedepends=('git' 'python2-setuptools')
checkdepends=('python2-cloudpickle') #'python2-dask' 'python2-toolz')
source=("${_srcname}-${pkgver}.tar.gz"::"https://github.com/Netflix/${_srcname}/archive/v${pkgver}.tar.gz")
sha256sums=('e405b9716ea194b851b7d341f670e417ec6a319daec74d3e7bf591b71cbbac1c')

build() {
    cd "${_srcname}-${pkgver}/python"
    python2 setup.py build
}

check() {
    cd "${_srcname}-${pkgver}/python"
    python2 setup.py test
}

package() {
    cd "${_srcname}-${pkgver}/python"
    
    python2 setup.py install --root="$pkgdir" --skip-build --optimize='1'
    
    # vmaf python2 executables
    local _script
    while read -rd '' _script
    do
        install -D -m755 "$_script" -t "${pkgdir}/usr/bin"
    done < <(find script -maxdepth 1 -mindepth 1 -type f -executable -print0)
    
    # fix shebang on python2 scripts
    while read -rd '' _script
    do
        sed -i '1s/python$/python2/' "$_script"
    done < <(find "${pkgdir}/usr/bin" -maxdepth 1 -mindepth 1 -type f -print0)
}
