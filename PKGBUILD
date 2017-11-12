# Maintainer: Eugene Cherny <iam@oscii.ru>
pkgname=essentia-git
pkgrel=1 
pkgver=r1687.52585c53
pkgdesc='Open-source library and tools for audio and music analysis,
description and synthesis. (With Python 3 bindings)'
arch=('x86_64')
url="http://essentia.upf.edu/documentation/"
license=('AGPL')
makedepends=('git' 'python' 'glibc')
depends=('fftw' 'ffmpeg' 'libsamplerate' 'taglib' 'libyaml'
         'python' 'python-numpy' 'python-yaml')
provides=('essentia')
conflicts=('essentia' 'essentia-acousticbrainz'
           'lib32-essentia-acousticbrainz')
source=('git+https://github.com/MTG/essentia.git#branch=master'
        'pthread_flag.patch')
md5sums=('SKIP'
         '172b1a047ab19d3a11affe47204fc540')

pkgver() {
	cd "$srcdir/essentia"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    patch -f "$srcdir/essentia/wscript" pthread_flag.patch
}

build() {
	cd "$srcdir/essentia"
    ./waf configure      \
        --mode=release   \
        --build-static   \
        --with-cpptests  \
        --with-examples  \
        --with-python    \
        --python=$(which python)  \
        --prefix="$pkgdir/usr"
    ./waf
}

#check() {
#    cd "$srcdir/$pkgname"
#    ./waf run_tests
#    ./waf run_python_tests
#}

package() {
	cd "$srcdir/essentia"
	./waf install
}
