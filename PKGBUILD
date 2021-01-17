# Davide Depau <davide@depau.eu>

_pkgname=ydotool
pkgname=$_pkgname-git
pkgver=v0.2.0.r7.gce27b46
pkgrel=1
pkgdesc="Generic command-line automation tool (no X!), works on Wayland"
arch=('i686' 'x86_64' 'armv7h' 'aarch64' 'pentium4')
depends=('boost-libs')
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

  cd manpage
  gzip ydotool.1 ydotoold.8
}

package() {
  cd "$srcdir/${_pkgname}"
  install -Dm644 Daemon/ydotool.service "$pkgdir/usr/lib/systemd/user/ydotool.service"

  cd build
  install -Dm755 ydotool "$pkgdir/usr/bin/ydotool"
  install -Dm755 ydotoold "$pkgdir/usr/bin/ydotoold"
  install -Dm644 manpage/ydotool.1.gz "$pkgdir/usr/share/man/man1/ydotool.1.gz"
  install -Dm644 manpage/ydotoold.8.gz "$pkgdir/usr/share/man/man8/ydotoold.8.gz"
}
