# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=python2-vmaf
_srcname=vmaf
pkgver=1.3.1
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
        'libsvm'
)
makedepends=('python2' 'python2-setuptools')
conflicts=('python2-vmaf-git')
source=("${_srcname}-${pkgver}.tar.gz"::"https://github.com/Netflix/${_srcname}/archive/v${pkgver}.tar.gz")
sha256sums=('c0c84f0f02cff6ac23b3bcc07199532ccbf04a18d8802385b35b89d26bb07287')

build() {
    msg2 'Building for Python2...'
    cd "${_srcname}-${pkgver}/python"
    python2 setup.py build
}

# waiting for upstream to finish python3 support
# https://github.com/Netflix/vmaf/issues/128

package() {
    cd "${_srcname}-${pkgver}/python"
    
    python2 setup.py install --root="$pkgdir" --optimize='1'
    
    # vmaf python2 executables and additional modules
    cd script
    for _script in *
    do
        _filemode="$(stat -c %a "$_script")"
        
        if [ "$_filemode" = '644' ] 
        then
            install -D -m"$_filemode" "$_script" "${pkgdir}/usr/lib/python2.7/site-packages/${_srcname}/${_script}"
        else
            install -D -m"$_filemode" "$_script" "${pkgdir}/usr/bin/${_script}"
        fi
    done
    
    # fix shebang on python2 scripts
    for _script in "$pkgdir"/usr/bin/*
    do
        sed -i '1s/python/python2/' "$_script"
    done
}
