# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=python2-vmaf-git
_srcname=vmaf
pkgver=1.3.13.r29.ga0e7289
pkgrel=1
pkgdesc='Perceptual video quality assessment algorithm based on multi-method fusion (python2 implementation, git version)'
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
provides=('python2-vmaf')
conflicts=('python2-vmaf')
source=('git+https://github.com/Netflix/vmaf.git')
sha256sums=('SKIP')

pkgver() {
    cd "${_srcname}"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd "${_srcname}/python"
    python2 setup.py build
}

# waiting for upstream to finish python3 support
# https://github.com/Netflix/vmaf/issues/128
# https://github.com/Netflix/vmaf/blob/fbb9d3ecda8cc2bd80ecbdd63f877825216045be/resource/doc/VMAF_Python_library.md

package() {
    cd "${_srcname}/python"
    
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
