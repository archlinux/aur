# Maintainer: jakob <jakob@linke.cx>
# digiKam from the quickfilter fork, with the quick filter toolbar patch set.
# Hosted on the maintainer's KDE invent fork: GitHub rejects the history
# (legacy bundled DNN weights exceed its 100 MB blob limit).
#
# opencv5-version-cap.patch: upstream carries the OpenCV 5 port (bug 522887)
# but still rejects 5.x at configure time; the cap is lifted here. Same
# approach as extra/digikam's opencv-5.patch.

pkgname=digikam-quickfilter-git
pkgver=9.2.0.r69179.980708c
pkgrel=1
pkgdesc='An advanced digital photo management application - quickfilter fork (git build)'
arch=(x86_64)
license=(GPL-2.0-or-later)
url='https://www.digikam.org/'
depends=(akonadi-contacts
         exiv2
         expat
         ffmpeg
         glib2
         glibc
         imagemagick
         jasper
         kcalendarcore
         kcompletion
         kconfig
         kconfigwidgets
         kcontacts
         kcoreaddons
         kfilemetadata
         ki18n
         kiconthemes
         kio
         knotifications
         knotifyconfig
         kservice
         kwidgetsaddons
         kxmlgui
         lcms2
         lensfun
         libgcc
         libglvnd
         libgomp
         libgphoto2
         libheif
         libjpeg-turbo
         libjxl
         libksane
         libpng
         libstdc++
         libtiff
         libx11
         libxml2
         libxslt
         opencv
         perl
         perl-image-exiftool
         qt6-base
         qt6-multimedia
         qt6-networkauth
         qt6-scxml
         qt6-svg
         qt6-webengine
         sh
         solid
         sonnet
         threadweaver
         x265
         zlib)
makedepends=(boost
             doxygen
             eigen
             extra-cmake-modules
             git
             kdoctools
             ninja)
optdepends=('darktable: RAW import'
            'hugin: panorama tool'
            'qt6-imageformats: support for additional image formats (WEBP, TIFF)'
            'rawtherapee: RAW import')
provides=(digikam)
conflicts=(digikam)
source=(opencv5-version-cap.patch
        git+https://invent.kde.org/gruber/digikam.git#branch=quickfilter)
sha256sums=('e752c0d4240453eca298a07e33ab319519c2b2b3672776bf968f05dfb5201aa6'
            'SKIP')

prepare() {
  cd digikam
  patch -Np1 -i "${srcdir}/opencv5-version-cap.patch"
}

pkgver() {
  cd digikam
  local _maj _min _pat
  _maj=$(sed -nE 's/^set\(DIGIKAM_MAJOR_VERSION[[:space:]]+"([0-9]+)"\)/\1/p' CMakeLists.txt)
  _min=$(sed -nE 's/^set\(DIGIKAM_MINOR_VERSION[[:space:]]+"([0-9]+)"\)/\1/p' CMakeLists.txt)
  _pat=$(sed -nE 's/^set\(DIGIKAM_PATCH_VERSION[[:space:]]+"([0-9]+)"\)/\1/p' CMakeLists.txt)
  printf '%s.%s.%s.r%s.%s' "$_maj" "$_min" "$_pat" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cmake -G Ninja -B build -S digikam \
    -DBUILD_TESTING=OFF \
    -DBUILD_WITH_QT6=ON \
    -DDIGIKAMSC_COMPILE_PO=OFF \
    -DENABLE_KFILEMETADATASUPPORT=ON \
    -DENABLE_MEDIAPLAYER=ON \
    -DENABLE_AKONADICONTACTSUPPORT=ON \
    -DENABLE_APPSTYLES=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
