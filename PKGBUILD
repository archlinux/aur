# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=python2-vmaf-git
pkgver=1.3.7.r3.gad8ac94
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
        'python2-scikit-image'
)
makedepends=('git' 'python2' 'python2-setuptools')
provides=('python2-vmaf')
conflicts=('python2-vmaf')
source=('vmaf-git'::'git+https://github.com/Netflix/vmaf.git'
        'vmaf-submodule-sureal'::'git+https://github.com/Netflix/sureal.git#branch=master')
sha256sums=('SKIP'
            'SKIP')

prepare() {
    cd vmaf-git
    
    git submodule init
    git config --local submodule.sureal.url "${srcdir}/vmaf-submodule-sureal"
    git submodule update
}

pkgver() {
    cd vmaf-git
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    msg2 'Building for Python2...'
    cd vmaf-git/python
    python2 setup.py build
}

# waiting for upstream to finish python3 support
# https://github.com/Netflix/vmaf/issues/128

package() {
    cd vmaf-git/python
    
    python2 setup.py install --root="$pkgdir" --optimize='1'
    
    # vmaf python2 executables
    cd script
    local _executables=($(find . -type f -executable))
    for _script in ${_executables[@]}
    do
        install -D -m755 "$_script" -t "${pkgdir}/usr/bin"
    done
    
    # sureal python2 executable
    cd "${srcdir}/vmaf-git/sureal/python/script"
    install -D -m755 run_subj.py -t "${pkgdir}/usr/bin"
    
    # sureal python2 modules
    cd "${srcdir}/vmaf-git/sureal/python/src"
    cp -af sureal "${pkgdir}/usr/lib/python2.7/site-packages"
    
    # fix shebang on python2 scripts
    for _script in "$pkgdir"/usr/bin/*
    do
        sed -i '1s/python$/python2/' "$_script"
    done
}
