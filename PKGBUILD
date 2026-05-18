# Maintainer: Hu Butui <hot123tea123@gmail.com>
# Contributor: Matthijs Tadema <M dot J dot Tadema at pm dot me>
# Contributor: Staal <staal1978@gmail.com>
# Contributor: Jens Staal <staal1978@gmail.com>

_pkgname=ugene
pkgname='ugene'
pkgver=53.1
pkgrel=2
pkgdesc='A free open-source cross-platform bioinformatics software'
arch=('x86_64')
url='http://ugene.net'
license=('GPL-2.0-or-later')
depends=(
  glu
  libxtst
  hicolor-icon-theme
  qt5-base
  qt5-svg
  qt5-websockets
  qt5-networkauth
  gcc-libs
  glibc
  libx11
  libxext
  python
  libgcc
  bash
  libstdc++
  libglvnd
  sqlite
)
makedepends=(
  cmake
  qt5-tools
  opencl-headers
  mold
)
optdepends=(
  'man-db: Read manpages'
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/ugeneunipro/ugene/archive/refs/tags/${pkgver}.tar.gz"
        "use_sqlite.patch"
        "wayland-app-id.patch")
sha256sums=('3eca3bc97824d855b5dfe4844b7a5d46052f98279fa015c7e152e111f89c4673'
            'a697c392ce97fec770ff14aca9da9ed052c1d47c5cb08a905dbaef186a327763'
            '4665ce739e730dd1c9619aa530135f78825324c311df23ba4cc4b8253363d142')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  # use system sqlite
  patch -p1 < ${srcdir}/use_sqlite.patch
  # Fix generic Wayland window icon
  patch -p1 < ${srcdir}/wayland-app-id.patch

  # Convert -Werror=foo to -Wfoo to prevent build failure on warnings
  sed -i 's/-Werror=/-W/g' CMakeLists.txt
  # Allow deprecated Qt 5.15 APIs
  sed -i 's/QT_DISABLE_DEPRECATED_BEFORE=0x050F00/QT_DISABLE_DEPRECATED_BEFORE=0x050E00/g' CMakeLists.txt
  # Fix QComboBox::activated ambiguity for Qt 5
  sed -i 's/&QComboBox::activated/QOverload<int>::of(\&QComboBox::activated)/g' src/corelibs/U2Gui/src/util/RegionSelectorController.cpp
  # Fix QButtonGroup::buttonToggled ambiguity for Qt 5
  sed -i 's/&QButtonGroup::buttonToggled/QOverload<QAbstractButton\*, bool>::of(\&QButtonGroup::buttonToggled)/g' src/corelibs/U2View/src/ov_sequence/find_pattern/FindPatternWidget.cpp

  # Fix the desktop file Exec path
  sed -i 's|Exec=.*|Exec=ugeneui|' "etc/shared/${_pkgname}.desktop"
  sed -i 's|Categories=.*|Categories=Science;|' "etc/shared/${_pkgname}.desktop"
  echo "StartupWMClass=ugene" >> "etc/shared/${_pkgname}.desktop"
}

build() {
  export LDFLAGS="$LDFLAGS -fuse-ld=mold -Wl,-z,relro,-z,now"
  cmake -B build -S "${_pkgname}-${pkgver}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_RPATH="/usr/lib/${_pkgname}" \
    -DCMAKE_BUILD_WITH_INSTALL_RPATH=ON \
    -DCMAKE_EXE_LINKER_FLAGS="$LDFLAGS" \
    -DCMAKE_SHARED_LINKER_FLAGS="$LDFLAGS"
  cmake --build build
}

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/pixmaps"
  install -d "${pkgdir}/usr/share/icons/hicolor/48x48/apps"
  install -d "${pkgdir}/usr/share/icons/hicolor/128x128/apps"
  install -d "${pkgdir}/usr/share/man/man1"
  install -d "${pkgdir}/usr/lib/${_pkgname}"

  # copy built files from build/dist to /usr/lib/ugene
  cp -a "${srcdir}/build/dist/"* "${pkgdir}/usr/lib/${_pkgname}/"
  
  # copy data directory from source
  cp -a "${srcdir}/${_pkgname}-${pkgver}/data" "${pkgdir}/usr/lib/${_pkgname}/"

  # Install desktop file and icon from source folder
  install -m644 "${srcdir}/${_pkgname}-${pkgver}/etc/shared/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -m644 "${srcdir}/${_pkgname}-${pkgver}/etc/shared/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  install -m644 "${srcdir}/${_pkgname}-${pkgver}/etc/shared/${_pkgname}.1.gz" "${pkgdir}/usr/share/man/man1/${_pkgname}.1.gz"
  install -m644 "${srcdir}/${_pkgname}-${pkgver}/etc/shared/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/${_pkgname}.png"
  install -m644 "${srcdir}/${_pkgname}-${pkgver}/src/ugeneui/images/originals/${_pkgname}_128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png"

  # Create symlinks
  ln -sf "/usr/lib/${_pkgname}/ugene" "${pkgdir}/usr/bin/ugene"
  ln -sf "/usr/lib/${_pkgname}/ugeneui" "${pkgdir}/usr/bin/ugeneui"
  ln -sf "/usr/lib/${_pkgname}/ugenecl" "${pkgdir}/usr/bin/ugenecl"
}
