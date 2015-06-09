# Maintainer: Jan-Erik Rediger <badboy at archlinux dot us>

pkgname=kcov-git
pkgver=v27.r11.g5d81d7b
pkgrel=1
pkgdesc="Code coverage tester for compiled programs, Python scripts and shell scripts"
arch=('i686' 'x86_64')
url="http://simonkagstrom.github.com/kcov/index.html"
provides=('kcov')
conflicts=('kcov')
license=('GPL2')
groups=('i3-vcs')
depends=('elfutils' 'curl')
makedepends=('cmake' 'python2')
source=('git+http://github.com/SimonKagstrom/kcov')
sha1sums=('SKIP')

_gitname="kcov"

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname"

  sed -i 's/env python$/env python2/' src/bin-to-c-source.py
  sed -i 's/env python$/env python2/' src/engines/python-helper.py


  mkdir -p build && cd build
  # Strip --as-needed, because dl is linked before dw,
  # but is actually used by dw, so we can't strip it before
  export LDFLAGS="${LDFLAGS/--as-needed,/}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr DCMAKE_C_FLAGS:STRING="-ldl -D__FOO_BAR_BAZ__" ..
  make VERBOSE=1
}

package() {
  cd "$srcdir/$_gitname/build"

  make DESTDIR="$pkgdir/" install
  make clean
}

# vim:set ts=2 sw=2 et:
