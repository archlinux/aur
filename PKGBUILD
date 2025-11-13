#
# PKGBUILD for wxwidgets gtk
#
# Maintainer: Uffe Jakobsen: uffe _.at._ uffe _.dot._ org
#

pkgname=wxwidgets-gtk
_pkgname=wxWidgets
pkgver=3.3.1
pkg_name_ver="${_pkgname}-${pkgver}"
pkgrel=1
pkgdesc="GTK+3 implementation of wxWidgets API for GUI"
arch=('x86_64')
url="https://github.com/wxWidgets/wxWidgets"
license=("LicenseRef-custom:wxWindows")
depends=(gtk3 cairo pango fontconfig expat wayland zlib libwebp libnotify libjpeg-turbo libtiff libpng gspell pcre2 libsm gstreamer gst-plugins-base-libs gst-plugins-bad-libs webkit2gtk-4.1 glibc glib2 gcc-libs libglvnd gdk-pixbuf2 libxtst libx11 libxkbcommon libxxf86vm curl bash)
makedepends=()
provides=()
conflicts=()
source=("https://github.com/wxWidgets/wxWidgets/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.bz2")
sha256sums=('f936c8d694f9c49a367a376f99c751467150a4ed7cbf8f4723ef19b2d2d9998d')

#pkgver() {
#  cd "${srcdir}/${pkg_name_ver}"
#	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
#}

prepare()
{
  cd "${srcdir}/${pkg_name_ver}"
}

build()
{
  cd "${srcdir}/${pkg_name_ver}"

  #cd _build.out
  #../configure --with-gtk --prefix=/usr
  #make -s

  mkdir -p _build.out
  cmake -S . -B _build.out \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DwxBUILD_TOOLKIT=gtk3

  cmake --build _build.out
}

package()
{
  cd "${srcdir}/${pkg_name_ver}"

  #cd _build.out
  #make -s install DESTDIR="${pkgdir}"
  #cd "${srcdir}/${pkg_name_ver}"

  cmake --install _build.out

  mv "${pkgdir}/usr/bin/wx-config" "${pkgdir}/usr/bin/wx-config-${pkgver}"
  mv "${pkgdir}/usr/bin/wxrc" "${pkgdir}/usr/bin/wxrc-${pkgver}"
  mv "${pkgdir}/usr/share/aclocal/wxwin.m4" "${pkgdir}/usr/share/aclocal/wxwin-${pkgver}.m4"

  install -D -m 0644 docs/licence.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  chrpath -d "${pkgdir}"/usr/bin/wxrc-*
  chrpath -d "${pkgdir}/usr/lib/"*.so

  #install -D -m 0644 README "${pkgdir}/usr/share/doc/${_pkgname}/README"
}

#
# EOF
#
