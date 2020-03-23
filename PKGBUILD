# ---------------------------------------------------------------
# Maintainer: Romain Bazile <gromain.baz@gmail.com>
# ---------------------------------------------------------------

pkgname=opencpn-git
pkgver=5.0.0.r951.gff60eeedb
pkgrel=1
pkgdesc="Open Source Chart Plotting / Marine Navigation - Git version"
arch=('x86_64' 'aarch64')
license=("GPL2")
depends=('wxgtk3' 'gpsd' 'portaudio' 'tinyxml' 'hicolor-icon-theme' 'webkit2gtk' 'lsb-release')
makedepends=('cmake' 'git')
conflicts=('opencpn')
provides=('opencpn')

url="http://opencpn.org"
install=opencpn.install
source=("$pkgname::git+https://github.com/OpenCPN/OpenCPN.git")
sha1sums=('SKIP')


pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
}

build() {
  cd $pkgname
  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr \
        -DOCPN_BUNDLE_GSHHS=CRUDE -DOCPN_BUNDLE_TCDATA=ON -DOCPN_BUNDLE_DOCS=ON \
        -DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config-gtk3 \
        -DOCPN_FORCE_GTK3=ON ../
  make
}

package() {
  cd $pkgname/build
  make DESTDIR="$pkgdir" install
}
