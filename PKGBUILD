# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=python2-vmaf
_srcname=vmaf
pkgver=1.3.13
pkgrel=1
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
source=("${_srcname}-${pkgver}.tar.gz"::"https://github.com/Netflix/${_srcname}/archive/v${pkgver}.tar.gz")
sha256sums=('926ed538c7d7ae3a36064b87a34094a9d2bee20f7e51a64f8bb275f6c44a8ae3')

build() {
    cd "${_srcname}-${pkgver}/python"
    python2 setup.py build
}

# waiting for upstream to finish python3 support
# https://github.com/Netflix/vmaf/issues/128
# https://github.com/Netflix/vmaf/blob/fbb9d3ecda8cc2bd80ecbdd63f877825216045be/resource/doc/VMAF_Python_library.md

package() {
    cd "${_srcname}-${pkgver}/python"
    
    local _script
    
    python2 setup.py install --root="$pkgdir" --skip-build --optimize='1'
    
    # vmaf python2 executables
    cd script
    while read -rd '' _script
    do
        install -D -m755 "$_script" -t "${pkgdir}/usr/bin"
    done < <(find . -maxdepth 1 -type f -executable -print0)
    
    # fix shebang on python2 scripts
    while read -rd '' _script
    do
        sed -i '1s/python$/python2/' "$_script"
    done < <(find "${pkgdir}/usr/bin" -maxdepth 1 -mindepth 1 -type f -print0)
}
