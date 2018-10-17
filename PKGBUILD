# Maintainer: Daniel Bermond < gmail-com: danielbermond >

_srcname=vmaf
_sureal_commit='4d0fee6e83047da53ff1776a883579bfe101e8ea'

pkgname=python2-vmaf
pkgver=1.3.9
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
        'python2-scikit-image'
)
makedepends=('git' 'python2-setuptools')
conflicts=('python2-vmaf-git')
source=("${_srcname}-${pkgver}.tar.gz"::"https://github.com/Netflix/${_srcname}/archive/v${pkgver}.tar.gz"
        'vmaf-submodule-sureal'::"git+https://github.com/Netflix/sureal.git#commit=${_sureal_commit}")
sha256sums=('c9e4fc850f66cf959a36c9603cef26c4298eec20d6c26f9482a355c5753c092d'
            'SKIP')

prepare() {
    cd "${_srcname}-${pkgver}"
    
    rm -rf sureal
    ln -sf "${srcdir}/vmaf-submodule-sureal" sureal
}

build() {
    cd "${_srcname}-${pkgver}/python"
    python2 setup.py build
}

# waiting for upstream to finish python3 support
# https://github.com/Netflix/vmaf/issues/128
# https://github.com/Netflix/vmaf/blob/a0a4deeb7cd7b6e5cdd7c40398e6ce3c1498a0d8/resource/doc/VMAF_Python_library.md

package() {
    cd "${_srcname}-${pkgver}/python"
    
    local _executables
    local _script
    
    python2 setup.py install --root="$pkgdir" --optimize='1'
    
    # vmaf python2 executables
    cd script
    _executables=($(find . -type f -executable))
    for _script in ${_executables[@]}
    do
        install -D -m755 "$_script" -t "${pkgdir}/usr/bin"
    done
    
    # sureal python2 executable
    cd "${srcdir}/${_srcname}-${pkgver}/sureal/python/script"
    install -D -m755 run_subj.py -t "${pkgdir}/usr/bin"
    
    # sureal python2 modules
    cd "${srcdir}/${_srcname}-${pkgver}/sureal/python/src"
    cp -a sureal "${pkgdir}/usr/lib/python2.7/site-packages"
    
    # fix shebang on python2 scripts
    for _script in "$pkgdir"/usr/bin/*
    do
        sed -i '1s/python$/python2/' "$_script"
    done
}
