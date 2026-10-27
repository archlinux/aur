# Maintainer: taotieren <admin@taotieren.com>

pkgname=tinyserial-git
pkgver=2.1.0.r3.gced1142
pkgrel=1
epoch=
pkgdesc="A GUI Serial Debug Tool for Linux/Mac OS."
arch=($CARCH)
url="https://github.com/carloscn/tinyserial"
license=('MPL-2.0')
groups=()
_qt=qt6
depends=(
  libgcc
  libstdc++
  $_qt-base
  $_qt-serialport
)
makedepends=(
  git
  cmake
  ninja
  $_qt-tools
  vulkan-headers
)
checkdepends=()
optdepends=()
provides=(tinyserial)
conflicts=(tinyserial)
replaces=()
backup=()
options=(emptydirs)
install=
changelog=
source=("${pkgname%-git}::git+${url}.git")
noextract=()
sha256sums=('SKIP')
#validpgpkeys=()

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname%-git}"
# see：https://wiki.archlinux.org/title/CMake_package_guidelines
  cmake -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -B build \
    -G Ninja \
    -Wno-author

  ninja -C build
}

check() {
  ctest --test-dir "${srcdir}"/${pkgname%-git}/build --output-on-failure
}

package() {
  DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname%-git}/build install
  install -vDm0644 "${srcdir}/${pkgname%-git}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
  install -vdm0755 "${pkgdir}/var/log/tinyserial"
}
