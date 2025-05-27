# Contributor: Eugene Cherny <iam@oscii.ru>
# Maintainer:  zac
pkgname=essentia-git
pkgver=r3700.fcfac131
pkgrel=1
pkgdesc="C++ library for audio and music analysis, with Python bindings (built against ffmpeg3.4)"
arch=('x86_64')
url="https://essentia.upf.edu/"
license=('AGPL3')
depends=(
  'fftw' 'eigen' 'libsamplerate' 'libyaml' 'taglib' 'chromaprint'
  'python' 'python-numpy' 'python-yaml' 'python-six' 'libsndfile'
  'ffmpeg3.4'
)
makedepends=('git' 'python-setuptools')
provides=('essentia')
conflicts=('essentia' 'essentia-acousticbrainz'
           'lib32-essentia-acousticbrainz')
source=("git+https://github.com/MTG/essentia.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/essentia"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/essentia"
  git submodule update --init --recursive
}

build() {
  cd "$srcdir/essentia"

  # Use ffmpeg3.4 headers and libraries
  export CFLAGS="-I/usr/include/ffmpeg3.4"
  export CXXFLAGS="-I/usr/include/ffmpeg3.4"
  export LDFLAGS="-L/usr/lib/ffmpeg3.4"
  export PKG_CONFIG_PATH="/usr/lib/ffmpeg3.4/pkgconfig"

  python waf configure \
    --prefix=/usr \
    --with-python \
    --with-examples \
    --with-vamp \
    --with-cpptests

  python waf
}

package() {
  cd "$srcdir/essentia"
  python waf install --destdir="$pkgdir"
}
