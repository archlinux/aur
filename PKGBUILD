#
# PKGBUILD for wxwidgets gtk3-unstable
#
# Maintainer: Uffe Jakobsen: uffe _.at._ uffe _.dot._ org
#

pkgname=wxwidgets-gtk3-unstable
_pkgname=wxWidgets
pkgver=3.3.3
_pkgver=${pkgver}
pkg_name_ver="${_pkgname}-${_pkgver}"
pkgrel=1
pkgdesc="GTK+3 implementation of wxWidgets API for GUI"
arch=('x86_64')
url="https://github.com/wxWidgets/wxWidgets"
license=("LicenseRef-custom:wxWindows")
depends=(libstdc++ glibc glib2 libgcc gtk3 cairo pango expat wayland zlib libwebp libnotify libjpeg-turbo libtiff libpng nanosvg fontconfig gspell pcre2 libmspack gstreamer gst-plugins-bad-libs webkit2gtk-4.1 libglvnd gdk-pixbuf2 libxtst libx11 libxkbcommon libsm sdl2-compat curl bash)
makedepends=(cmake)
provides=()
#provides=(wxwidgets-gtk3)
conflicts=()
source=("https://github.com/wxWidgets/wxWidgets/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.bz2")
sha256sums=('81b09d6dd9f1ed9301f8c55a968a488d0491f264dc2bab19a7e407ac67009482')

#pkgver() {
#  cd "${srcdir}/${pkg_name_ver}"
#  git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
#  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
#}

prepare()
{
  cd "${srcdir}/${pkg_name_ver}"

  # This hack is needed for wx-3.3.1 - as its cmake create_symlink function is broken
  # Fixed upstream in wx - remove when updating to wx-3.3.2
  #cp -v "${startdir}/build_cmake_install.cmake.new" "${srcdir}/${pkg_name_ver}/build/cmake/install.cmake"
  #cp -v "${startdir}/build_cmake_utils_CMakeLists.txt.new" "${srcdir}/${pkg_name_ver}/build/cmake/utils/CMakeLists.txt"

}

build()
{
  cd "${srcdir}/${pkg_name_ver}"

  cmake -S . -B _build.out \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DwxBUILD_TOOLKIT=gtk3

#     -DCMAKE_SKIP_RPATH=yes \
#     -DCMAKE_SKIP_INSTALL_RPATH=yes \

  cmake --build _build.out
}

package()
{
  cd "${srcdir}/${pkg_name_ver}"

  DESTDIR="${pkgdir}" cmake --install _build.out --prefix=/usr

  install -D -m 0644 docs/licence.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  mv "${pkgdir}/usr/bin/wx-config" "${pkgdir}/usr/bin/wx-config-${pkgver}"
  mv "${pkgdir}/usr/bin/wxrc" "${pkgdir}/usr/bin/wxrc-${pkgver}"

  # 3.3.1
  #mv "${pkgdir}/usr/lib/cmake/wxWidgets" "${pkgdir}/usr/lib/cmake/wxWidgets-${pkgver}"

  #chrpath -d "${pkgdir}"/usr/bin/wxrc-*
  #chrpath -d "${pkgdir}/usr/lib/"*.so

}

#
# EOF
#
