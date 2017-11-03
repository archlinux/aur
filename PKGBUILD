# Maintainer: Philipp Wolfer <ph.wolfer@gmail.com>
_pkgname=peek
pkgname=${_pkgname}-git
pkgver=1.1.0.r50.gcb2a032
pkgrel=1
pkgdesc="Simple screen recorder with an easy to use interface (latest development release)"
arch=('i686' 'x86_64')
url="https://github.com/phw/peek"
license=('GPL3')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
depends=(gtk3 libkeybinder3 ffmpeg)
makedepends=(cmake vala gettext txt2man)
optdepends=(
  'gst-plugins-good: WebM output under Gnome Shell'
  'gst-plugins-ugly: MP4 output under Gnome Shell',
  'gifski: High quality GIF animations with thousands of colors',
  'imagemagick: Use ImageMagick instead of Ffmpeg for GIF creation'
)
source=(git+https://github.com/phw/${_pkgname}.git)
sha1sums=('SKIP')

prepare() {
  mkdir -p build
}

build() {
  cd "build"
  cmake ${srcdir}/${_pkgname}\
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTS=ON \
    -DGSETTINGS_COMPILE=OFF
  make
}

check() {
  cd "build"
  make test
}

package() {
  cd "build"
  make DESTDIR=${pkgdir} install
}

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
