# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>
# Contributor: mosra <mosra@centrum.cz>

pkgname=kdevelop-git
pkgver=4.90.90.r20707.07781db
pkgrel=1
pkgdesc="A C/C++ development environment for KDE. (GIT Version)"
arch=(i686 x86_64)
url="http://www.kdevelop.org/"
license=(GPL)
groups=('kde')
depends=('qt5-tools' 'kdevplatform-git' 'krunner' 'hicolor-icon-theme')
makedepends=('cmake' 'git' 'okteta' 'krunner' 'plasma-framework')
optdepends=('krunner: For enabling the KDevelop runner'
            'plasma-framework: Plasma libraries for enabling the plasma addons'
            'okteta: hex editor integration'
            'konsole: embedded terminal'
            'subversion: SVN support'
            'git: Git support'
            'cvs: Concurrent Versions System support'
            'gdb: GNU Debugger support'
            'qt4-doc: qt4 documentation integration'
            'qt5-doc: qt5 documentation integration'
            'cmake: build system')
provides=('kdevelop')
conflicts=('kdevelop')
source=(git+git://anongit.kde.org/kdevelop)
sha1sums=('SKIP')
install='kdevelop-git.install'

pkgver() {
  cd kdevelop
  _ver="$(cat CMakeLists.txt | grep -e KDEVELOP_VERSION_MAJOR -e KDEVELOP_VERSION_MINOR -e KDEVELOP_VERSION_PATCH | head -n3 | cut -d ' ' -f3 | tr -d ')')"
  echo "$(echo ${_ver} | tr ' ' .).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kdevelop \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
