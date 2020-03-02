# Maintainer: Philipp Wolfer <ph.wolfer@gmail.com>
_pkgname=peek
pkgname=${_pkgname}-git
pkgver=1.5.1.r1.ga6a0bcf
pkgrel=1
pkgdesc="Simple screen recorder with an easy to use interface (latest development release)"
arch=('i686' 'x86_64')
url="https://github.com/phw/peek"
license=('GPL3')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
depends=(gtk3 libkeybinder3 ffmpeg)
makedepends=(git meson vala gettext txt2man)
checkdepends=(xorg-server-xvfb)
optdepends=(
  'gst-plugins-good: Recording under Gnome Shell'
  'gst-plugins-ugly: MP4 output under Gnome Shell'
  'gifski: High quality GIF animations with thousands of colors'
)
source=(git+https://github.com/phw/${_pkgname}.git)
sha1sums=('SKIP')

build() {
  cd "${srcdir}/${_pkgname}"
  meson \
    --prefix=/usr \
    --buildtype=release \
    -Denable-filechoosernative=true \
    builddir
  cd builddir
  ninja
}

check() {
  cd "${srcdir}/${_pkgname}/builddir"
  xvfb-run ninja test
}

package() {
  cd "${srcdir}/${_pkgname}/builddir"
  DESTDIR=${pkgdir} ninja install
}

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
