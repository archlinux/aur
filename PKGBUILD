# Maintainer: Igor Kushnir <igorkuo at gmail dot com>
pkgname=venturous
pkgver=1.2
pkgrel=1
pkgdesc="Random playback manager for Audacious"
arch=('i686' 'x86_64')
url="https://github.com/vedgy/venturous"
license=('GPL3')
depends=('qt4' 'audacious')
makedepends=('git' 'cmake')
optdepends=('libnotify: desktop notifications'
            'libcue: Audacious CUE playlist format support')
install="$pkgname.install"
_gitname="venturous"
_builddir="build"

prepare() {
  git clone "$url.git"
  cd "${_gitname}"
  # If you want to install latest development version (can be unstable), just
  # comment out the next line (# git checkout "tags/v$pkgver").
  git checkout "tags/v$pkgver"
}

build() {
  cd "$srcdir/${_gitname}"
  # qt4 is used by default because of notification area icon bug and
  # font rendering issues in qt5.
  # If you prefer qt5, replace 'qt4' dependency with
  # 'qt5-base' 'libxkbcommon-x11' and append
  # " qt5" to the next line (./update_submodules_and_configure qt5).
  ./update_submodules_and_configure
  cd "${_builddir}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$srcdir/${_gitname}/${_builddir}"
  make DESTDIR="$pkgdir/" install
}
