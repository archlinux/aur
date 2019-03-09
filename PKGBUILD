pkgname=digikam-git
pkgver=r42360.d25dc5718c
pkgrel=1
pkgdesc='Digital photo management application for KDE'
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.digikam.org/"
depends=(liblqr lensfun opencv akonadi-contacts knotifyconfig libksane kfilemetadata qtav marble-common threadweaver kcalcore
         qt5-xmlpatterns libkvkontakte libmediawiki)
makedepends=(extra-cmake-modules doxygen eigen boost kdoctools git)
optdepends=('hugin: panorama tool' 'qt5-imageformats: support for additional image formats (WEBP, TIFF)')
conflicts=('digikam')
provides=('digikam')
install=digikam-git.install
source=('digikam::git+git://anongit.kde.org/digikam')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/digikam"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
if [[ -d "${srcdir}/build" ]]; then
      msg "Cleaning the previous build directory..."
      rm -rf "${srcdir}/build"
  fi
  mkdir "${srcdir}/build"
}

build() {
  cd "${srcdir}/build"
  cmake ../digikam \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF \
    -DENABLE_KFILEMETADATASUPPORT=ON \
    -DENABLE_MEDIAPLAYER=ON \
    -DENABLE_AKONADICONTACTSUPPORT=ON \
    -DENABLE_MYSQLSUPPORT=ON \
    -DENABLE_APPSTYLES=ON \
    -DENABLE_QWEBENGINE=ON \
    -DOpenGL_GL_PREFERENCE=GLVND
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
}
