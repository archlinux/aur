# Maintainer: jmcb <joelsgp@protonmail.com>

pkgname='oscilloscope-git'
pkgver=of0.9.r132.g30a1839
pkgrel=1
pkgdesc="Oscilloscope written in OF."
arch=('x86_64')
url="https://github.com/kritzikratzi/Oscilloscope"
license=('MIT')
# from https://aur.archlinux.org/packages/openframeworks
depends=('make' 'pkgconf' 'gcc' 'poco' 'openal' 'python-lxml' 'glew' 'glfw-x11' 'pugixml' 'freeglut' 'freeimage' 'gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly' 'gst-libav' 'opencv' 'libxcursor' 'assimp' 'boost' 'mpg123' 'rtaudio' 'uriparser')
makedepends=('git'
             'gcc6')
checkdepends=()
optdepends=()
provides=()
conflicts=()
source=("${pkgname}::git+https://github.com/kritzikratzi/Oscilloscope.git"
        'https://openframeworks.cc/versions/v0.10.1/of_v0.10.1_linux64gcc6_release.tar.gz')
sha256sums=('SKIP'
            '9cc5133028b84d5031dbd054719238095e46a5aed507f3b32265fa2906f37905')

pkgver() {
    cd "${pkgname}"
    
    # Using the most recent annotated tag reachable from the last commit:
    git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
    # can't use unannotated tag pkgver() example because of issue with "{"
}

# https://github.com/kritzikratzi/Oscilloscope#compiling-with-make-in-linux
prepare() {
    # link downloaded openframeworks build to OF and enter it
    ln -s --force 'of_v0.10.1_linux64gcc6_release' 'OF'
    cd OF/apps/myApps
    
    # copy source code into openframeworks and enter it
    cp -r --update "${srcdir}/${pkgname}" 'Oscilloscope'
    cd 'Oscilloscope'

    # clone submodules
    git submodule update --init

    # copy addon stuff (from readme instructions)
    cp -R addons/ofxMightyUI/bin/data/* bin/data/
    cp -R addons/ofxFontAwesome/bin/data/* bin/data/
}

build() {
    cd 'OF/apps/myApps/Oscilloscope'
    CC="gcc-6" CXX="g++-6" make
}

package() {
    cd 'OF/apps/myApps/Oscilloscope'
    make DESTDIR="${pkgdir}/" install
}
