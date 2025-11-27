# Maintainer: Moranis <mxy0268@qq.com>

pkgname=qetrc
pkgver=1.9.3
pkgrel=1
pkgdesc="Electronic Train Running Chart implemented with Qt - C++ reimplementation of pyETRC"
arch=('x86_64')
url="https://github.com/CDK6182CHR/qETRC"
license=('GPL')
depends=('qt6-base' 'qt6-declarative' 'qt6-svg' 'qt6-xcb-private-headers')
makedepends=('cmake' 'git' 'base-devel' 'qt6-tools')
checkdepends=()
optdepends=('qt6-doc: for Qt documentation')
provides=('qetrc')
conflicts=()
replaces=()
backup=()
options=(!strip)  # Add if you want to keep debug symbols
source=("git+https://github.com/CDK6182CHR/qETRC.git#tag=V${pkgver}")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/qETRC"

  # Initialize submodules and ensure they use the correct remote URLs
  git submodule sync --recursive
  git submodule update --init --recursive --depth=1

  # Create build directory
  mkdir -p build
}

build() {
  cd "${srcdir}/qETRC/build"

  # Build qETRC with proper CMake configuration
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_CXX_STANDARD=20 \
    -DBUILD_SHARED_LIBS=ON \
    -DENABLE_MSVC_PROFILE=OFF \
    -DAUTO_INSTALL_SARibbon=ON \
    -DAUTO_INSTALL_QWK=ON

  make -j$(nproc)
}

check() {
  cd "${srcdir}/qETRC/build"
  # Add tests if available
  # make test
}

package() {
  cd "${srcdir}/qETRC/build"

  make DESTDIR="${pkgdir}" install

  # Install documentation
  install -Dm644 "${srcdir}/qETRC/README.md" "${pkgdir}/usr/share/doc/qetrc/README.md"
  install -Dm644 "${srcdir}/qETRC/ReleaseNote.md" "${pkgdir}/usr/share/doc/qetrc/ReleaseNote.md"
  install -Dm644 "${srcdir}/qETRC/LICENSE" "${pkgdir}/usr/share/licenses/qetrc/LICENSE"

  # Copy build documentation
  install -Dm644 "${srcdir}/qETRC/doc/build.md" "${pkgdir}/usr/share/doc/qetrc/build.md"
  install -Dm644 "${srcdir}/qETRC/doc/build_on_archlinux.md" "${pkgdir}/usr/share/doc/qetrc/build_on_archlinux.md" 2>/dev/null || true

  # Install desktop file
  install -Dm644 "${srcdir}/qETRC/qetrc.desktop" "${pkgdir}/usr/share/applications/qetrc.desktop"

  # Install icon
  install -Dm644 "${srcdir}/qETRC/rsc/icons/train.png" "${pkgdir}/usr/share/pixmaps/qetrc.png"
}