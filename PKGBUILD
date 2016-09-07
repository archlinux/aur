# Maintainer: Christoph Scholz <christoph.scholz@gmail.com>
# Contributor : speps <speps at aur dot archlinux dot org>
# Contributor: osc <farid at archlinux-br.org>

_name=SuperCollider
pkgname=supercollider-with-plugins
pkgver=3.7.2
pkgrel=2
pkgdesc="An environment and programming language for real time audio synthesis and algorithmic composition. Current version including sc3-plugins."
arch=('i686' 'x86_64')
conflicts=('supercollider' 'sc3-plugins-git')
provides=('supercollider')
url="http://supercollider.github.io/"
license=('GPL3')
depends=('jack' 'fftw' 'cwiid' 'qtwebkit')
makedepends=('cmake' 'ruby' 'vim' 'emacs' 'git')
optdepends=('emacs: emacs interface'
            'gedit: gedit interface'
            'vim: vim interface'
            'ruby: vim support')
source=("https://github.com/supercollider/supercollider/releases/download/Version-$pkgver/$_name-$pkgver-Source-linux.tar.bz2"
        "https://github.com/supercollider/sc3-plugins/archive/Version-$pkgver.tar.gz"
        "https://ccrma.stanford.edu/software/stk/release/stk-4.5.1.tar.gz")
md5sums=('cb89a68bf599205d3c33ee1ee1e13ea0'
         'b007e0fe7a82b49a1f2aeeded0e1169a'
         '87e1b1a24ec09f81321c01f2cdea513d')

prepare() {
  cd "$srcdir/$_name-Source"
  sed -i '/if (${CMAKE_COMPILER_IS_GNUCXX})/a add_definitions("-fext-numeric-literals")' CMakeLists.txt
  cd "$srcdir/sc3-plugins-Version-$pkgver/external_libraries"
  git clone https://github.com/timblechmann/nova-simd.git
  rmdir stk
  mv $srcdir/stk-4.5.1 stk
}

build() {
  cd "$srcdir/$_name-Source"
  [ -d b ] || mkdir b && cd b
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
           -DCMAKE_BUILD_TYPE=Release \
           -DLIBSCSYNTH=ON
  make

  cd "$srcdir/sc3-plugins-Version-$pkgver"
  [ -d b ] || mkdir b && cd b
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
           -DCMAKE_BUILD_TYPE=Release \
           -DSC_PATH="$srcdir/$_name-Source"
}

package() {
  cd "$srcdir/$_name-Source/b"
  make DESTDIR="$pkgdir/" install
  
  cd "$srcdir/sc3-plugins-Version-$pkgver/b"
  make DESTDIR="$pkgdir/" install
}
