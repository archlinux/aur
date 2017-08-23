# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: hbdee <hbdee.arch@gmail.com>

pkgname=hydrogen-git
_pkgname=hydrogen
pkgver=0.9.7.r2953.9c99b935
pkgrel=1
pkgdesc="An advanced drum machine - git version"
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/hydrogen-music/hydrogen"
depends=('libarchive' 'liblrdf' 'qt5-xmlpatterns' 'libpulse' 'lash' 'liblo')
optdepends=('rubberband: Audio Time Stretcher Library')
makedepends=('git' 'cmake')
source=("$_pkgname"::'git://github.com/hydrogen-music/hydrogen.git')
provides=('hydrogen')
conflicts=('hydrogen')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  local version="$(git describe --tags | sed -e 's/-[^-]*-[^-]*$//;s/-/./g')"
  local revision=$(git rev-list --count HEAD)
  local hash=$(git rev-parse --short HEAD)
  echo $version.r$revision.$hash
}

prepare() {
  cd "$srcdir/$_pkgname"

  if [[ -d build ]]; then
    rm -rf build
  fi

  mkdir build

  # fix some pngs that break with newer libpng
  # see https://mailman.archlinux.org/pipermail/arch-dev-public/2013-May/024872.html
  #msg2 "Fixing PNGs, please wait..."
  #find -name '*.png' -exec optipng -quiet -force -fix {} +
}

build() {
  cd "$srcdir/$_pkgname"

  cmake ../$_pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWANT_DEBUG=OFF \
    -DWANT_LASH=ON \
    -DWANT_LRDF=ON \
    -DWANT_CPPUNIT=OFF
  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="${pkgdir}" install

  # Fix none FHS-compliant installation paths
  rm -rf "${pkgdir}/usr/share/man"
  mv "${pkgdir}/usr/man" "${pkgdir}/usr/share/man"
  # Remove empty dir
  rmdir "${pkgdir}/usr/share/hydrogen/data/doc"
}

# vim:set ts=2 sw=2 et:
