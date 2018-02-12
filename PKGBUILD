# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=python2-vmaf-git
_srcname=vmaf
pkgver=1.3.1.r58.g755c93c
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
        'libsvm'
)
makedepends=('git' 'python2' 'python2-setuptools')
provides=('python2-vmaf')
conflicts=('python2-vmaf')
source=("$_srcname"::"git+https://github.com/Netflix/${_srcname}.git"
        'submodule-sureal'::'git+https://github.com/Netflix/sureal.git')
sha256sums=('SKIP'
            'SKIP')

prepare() {
    cd "$_srcname"
    
    git submodule init
    git config --local submodule.sureal.url "${srcdir}/submodule-sureal"
    git submodule update
}

pkgver() {
    cd "$_srcname"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    msg2 'Building for Python2...'
    cd "${_srcname}/python"
    python2 setup.py build
}

# waiting for upstream to finish python3 support
# https://github.com/Netflix/vmaf/issues/128

package() {
    cd "${_srcname}/python"
    
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
    
    # sureal python2 executable
    cd "${srcdir}/${_srcname}/sureal/python/script"
    install -D -m755 run_subj.py "${pkgdir}/usr/bin/run_subj.py"
    
    # sureal python2 modules
    cd "${srcdir}/${_srcname}/sureal/python/src"
    cp -a sureal "${pkgdir}/usr/lib/python2.7/site-packages"
    
    # fix shebang on python2 scripts
    for _script in "$pkgdir"/usr/bin/*
    do
        sed -i '1s/python/python2/' "$_script"
    done
}
