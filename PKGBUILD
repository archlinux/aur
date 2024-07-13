# Maintainer: Anastasios Vacharakis <archlinux@vacharakis.de>

pkgname=turbovnc-git
pkgver=20240712.rf9484d29
pkgrel=1
pkgdesc="High-speed remote desktop software (development version)"
arch=('x86_64')
url="https://www.turbovnc.org/"
license=('GPL')
depends=('java-runtime' 'libx11' 'libjpeg-turbo' 'libxt' 'libxmu' 'libxi')
makedepends=('git' 'cmake' 'make' 'gcc')
provides=('turbovnc')
conflicts=('turbovnc' 'tigervnc')
source=('git+https://github.com/TurboVNC/turbovnc.git#branch=dev')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/turbovnc"
  local commit_date=$(git log -1 --format="%cd" --date=format:%Y%m%d)
  local commit_hash=$(git log -1 --format="%h")
  echo "${commit_date}.r${commit_hash}"
}

build() {
  cd "$srcdir/turbovnc"
  mkdir -p build
  cd build
  PATH=/usr/bin:$PATH
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DTJPEG_INCLUDE_DIR=/usr/include \
    -DTJPEG_LIBRARY=/usr/lib/libturbojpeg.so \
    -DTVNC_DRI3=1
  make
}

package() {
  cd "$srcdir/turbovnc/build"
  make DESTDIR="$pkgdir" install
  rm -f "${pkgdir}"/usr/share/man/man1/Xserver.1
}

# vim:set ts=2 sw=2 et:
