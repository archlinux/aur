# Maintainer: Christoph Scholz <christoph.scholz@gmail.com>
# Contributor : speps <speps at aur dot archlinux dot org>
# Contributor: osc <farid at archlinux-br.org>

_name=SuperCollider
pkgname=supercollider-with-plugins
pkgver=3.9.0
pkgrel=1
pkgdesc="An environment and programming language for real time audio synthesis and algorithmic composition. Current version including sc3-plugins."
arch=('i686' 'x86_64')
conflicts=('supercollider' 'sc3-plugins-git')
provides=('supercollider')
url="http://supercollider.github.io/"
license=('GPL3')
depends=('boost-libs' 'jack' 'fftw' 'cwiid' 'qt5-webkit')
makedepends=('boost' 'cmake' 'ruby' 'emacs' 'git' 'qt5-tools')
optdepends=('emacs: emacs interface'
            'gedit: gedit interface'
            'vim: vim interface'
            'ruby: vim support')
source=("https://github.com/supercollider/supercollider/releases/download/Version-$pkgver/$_name-$pkgver-Source-linux.tar.bz2"
        "https://github.com/supercollider/sc3-plugins/archive/Version-$pkgver.tar.gz"
        "https://github.com/thestk/stk/archive/v4.6.0.tar.gz")
sha256sums=('6fe21422a2beb3af9d25dfd9a0abac2f6120716667f641125ed3905951fabf93'
         'b9f5cc6444c087671879b973bd281289dbe1faa66a5965d21e855f7639e4fc19'
         '11cf25d62dd19448b226976705a1a9a8a1f7b45b43b63cb6cb2342cc0597f532')

prepare() {
  cd "$srcdir/sc3-plugins-Version-$pkgver/external_libraries"
  git clone https://github.com/timblechmann/nova-simd.git
  rmdir stk
  mv $srcdir/stk-4.6.0 stk
}

build() {
  cd "$srcdir/$_name-Source"
  [ -d b ] || mkdir b && cd b
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
           -DCMAKE_BUILD_TYPE=Release \
           -DLIBSCSYNTH=ON -DCMAKE_CXX_FLAGS_RELEASE="-O3 -DNDEBUG"
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
