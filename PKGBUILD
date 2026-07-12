# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=nomacs
pkgname="${_pkgname}-git"
pkgver=3.23.1.r15.gd5ae2741
pkgrel=1
pkgdesc='Free, open source image viewer, which supports multiple platforms.'
arch=('i686' 'x86_64' 'aarch64')
url='https://nomacs.org'
license=('GPL-3.0-only')
depends=('quazip-qt6' 'qt6-5compat' 'qt6-svg' 'opencv' 'libraw' 'exiv2' 'desktop-file-utils')
optdepends=('qt6-imageformats: read ICNS, MNG, TGA, TIFF, WBMP, WEBP'
            'kimageformats: read formats supported by this plugin, among other AVIF, HEIF/HEIC, JXL, EXR and EPS')
makedepends=('git' 'cmake' 'qt6-tools')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/$_pkgname/$_pkgname.git")
sha256sums=("SKIP")

export GIT_LFS_SKIP_SMUDGE=1

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  rm -Rf build && mkdir build
  cd build
  cmake "$srcdir/$_pkgname/ImageLounge" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_TRANSLATIONS=ON \
    -DENABLE_QUAZIP=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
