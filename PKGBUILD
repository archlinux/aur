# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Ondrej Martinak <omartinak@gmail.com>

pkgname=sfml

_git=true

if [[ "${_git}" = "true" ]]; then
    pkgver=1.99.git20110917
fi

pkgrel=1
pkgdesc='A simple, fast, cross-platform, and object-oriented multimedia API'
arch=('i686' 'x86_64')
url='http://www.sfml-dev.org/'
license=('zlib')
depends=('libsndfile' 'libxrandr' 'libjpeg' 'openal' 'glew' 'freetype2')
makedepends=('git' 'mesa' 'cmake' 'doxygen')
install=sfml.install

_gitroot='https://github.com/LaurentGomila/SFML.git'
_gitname='SFML'

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
    cd $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr .. \
        -DBUILD_DOC=true \
        -DBUILD_EXAMPLES=true
  make
  make doc
}

package() {
  cd "$srcdir/$_gitname-build/build"
  make DESTDIR="$pkgdir/" install

  install -Dm644 ../license.txt \
    ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  make clean
}

