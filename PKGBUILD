# Davide Depau <davide@depau.eu>

_pkgname=ydotool
pkgname=$_pkgname-git
pkgver=v0.1.8.r35.g563ccbf
pkgrel=2
pkgdesc="Generic command-line automation tool (no X!), works on Wayland"
arch=('i686' 'x86_64')
depends=('libevdevplus' 'libuinputplus' 'boost-libs')
makedepends=('cmake' 'git' 'make' 'pkg-config' 'boost')
url="https://github.com/ReimuNotMoe/ydotool"
license=('MIT')
source=(${_pkgname}::git+https://github.com/ReimuNotMoe/ydotool.git)
sha256sums=('SKIP')
provides=($_pkgname)
conflicts=($_pkgname)

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${_pkgname}"

  mkdir -p build && cd build
  
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DCMAKE_BUILD_TYPE=Release \
    -DSTATIC_BUILD=0
  make
}

package() {
  cd "$srcdir/${_pkgname}"
  make DESTDIR="$pkgdir" install -C build/
  install -Dm644 Daemon/ydotool.service "$pkgdir/usr/lib/systemd/user/ydotool.service"

  echo
  echo
  msg2 "The ydotool.service systemd unit used to be shipped as a system unit in previous versions of the package."
  msg2 "Make sure you disable the old one and enable the new systemd user unit."
  echo
  echo

  # Workaround upstream bug
  if [ -f "$pkgdir/usr/bin/libydotool.so" ]; then
    mv "$pkgdir/usr/"{bin,lib}"/libydotool.so"
  fi
}
