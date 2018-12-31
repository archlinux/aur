# Maintainer : Daniel Bermond < gmail-com: danielbermond >

pkgname=nnpack-git
_srcname=NNPACK
pkgver=r359.1e005b0
pkgrel=2
pkgdesc='An acceleration package for neural network computations (git version)'
arch=('i686' 'x86_64')
url='https://github.com/Maratyszcza/NNPACK/'
license=('BSD')
makedepends=(
    # binary repositories:
        'git' 'python2' 'ninja'
    # AUR:
        'confu2-git' 'python2-peachpy-git'
)
source=('git+https://github.com/Maratyszcza/NNPACK.git')
sha256sums=('SKIP')

pkgver() {
    cd "$_srcname"
    
    # git, no tags available
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${_srcname}"
    
    confu2 setup
    python2 configure.py
    sed -i '/peachpy[[:space:]]=[[:space:]]python/s/python/python2/' build.ninja # use python2
    ninja
}

package() {
    cd "$_srcname"
    
    # headers
    mkdir -p "${pkgdir}/usr/include/nnpack"
    install -D -m644 include/*.h        "${pkgdir}/usr/include"
    install -D -m644 include/nnpack/*.h "${pkgdir}/usr/include/nnpack"
    
    # lib
    install -D -m644 lib/libnnpack.a -t "${pkgdir}/usr/lib"
    
    # license
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
