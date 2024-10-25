# Maintainer: Sapphira Armageddos <shadowkyogre.public@gmail.com>
# Maintainer: Albert Westra <odysseywestra@gmail.com>
# Contributor: Jon Nordby <jononor@gmail.com>
# Contributor: mosra <mosra@centrum.cz>

_basever=2.0.0.main
pkgname=mypaint-git
pkgver=2.0.0.main.r6225.00483b9e
pkgrel=1
pkgdesc="Simple drawing & painting program that works well with graphics tablets (git)."
arch=('i686' 'x86_64')
url="http://mypaint.org/"
install="mypaint-git.install"
license=('GPL-2.0-only')
depends=('desktop-file-utils' 'gtk3' 'json-c' 'lcms2' 'librsvg' 'python-cairo' 'python-gobject' 'python-numpy' 'mypaint-brushes-git')
makedepends=('git' 'swig' 'pygobject-devel' 'python' 'python-setuptools')
provides=("mypaint=${_basever}")
conflicts=('mypaint')
source=('git+https://github.com/mypaint/mypaint.git'
        'mypaint-git.install')

pkgver() {
    cd "${srcdir}/mypaint"
    printf "${_basever}.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" | sed 's/^v//g;s/-/./g'
}

prepare() {
    cd "${srcdir}/mypaint"
    export CFLAGS='-Ofast -ftree-vectorize -fopt-info-vec-optimized -march=native -mtune=native -funsafe-math-optimizations -funsafe-loop-optimizations'
}

build() {
    cd "${srcdir}/mypaint"
    python setup.py clean --all
    # https://github.com/mypaint/mypaint/commit/57685af8dbd65719d7874bc501094bade85d94e7
    python setup.py build_config
    python setup.py build
}

package() {
    cd "${srcdir}/mypaint"
    echo "root: ${pkgdir}"
	
    python setup.py install \
     --root="${pkgdir}" --skip-build
}

sha256sums=('SKIP'
            '53b5959262452a2611f2e733b48c5c7a610ea84b0b05f4a85e83d0857d79b85a')
