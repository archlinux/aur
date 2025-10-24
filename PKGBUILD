# Maintainer: Hans Kramer <kramer@b1-systems.de>
# Contributor: Aetf <aetf@unlimitedcodeworks.xyz>
# Contributor: Sameed Pervaiz <greenbagels@teknik.io>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>
# Contributor: mosra <mosra@centrum.cz>
_pkgname=kdevelop
pkgname=${_pkgname}-git
pkgdesc="Cross-platform IDE for C/C++, Python, QML, and more (Git snapshot)"
pkgver=24.08.0.r925.g22b1e62f2f
pkgrel=1
arch=('x86_64')
url="https://kdevelop.org/"
license=('GPL')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://invent.kde.org/kdevelop/kdevelop.git")
sha256sums=('SKIP')

# Runtime deps (mirrors Arch's official kdevelop package; Qt6/KF6 stack)
depends=(
  'glibc' 'gcc-libs' 'clang'
  'karchive' 'kbookmarks' 'kcmutils' 'kcodecs' 'kcolorscheme' 'kcompletion'
  'kconfig' 'kconfigwidgets' 'kcoreaddons' 'kcrash' 'kguiaddons' 'ki18n'
  'kiconthemes' 'kio' 'kitemmodels' 'kitemviews' 'kjobwidgets' 'knewstuff'
  'knotifications' 'knotifyconfig' 'kparts' 'kservice' 'ktexteditor'
  'ktexttemplate' 'ktextwidgets' 'kwidgetsaddons' 'kwindowsystem' 'kxmlgui'
  'syntax-highlighting' 'qt6-webengine'
)

# Build deps
makedepends=(
  'git' 'cmake' 'ninja' 'extra-cmake-modules'
  'qt6-base' 'qt6-tools' 'kdoctools'
  'llvm' 'kdevelop-pg-qt'
)

# Optional plugins/features you may want to add as optdepends
optdepends=(
  'kdev-python: Python language support'
  'ctags: CTags support'
  'gdb: Debugging'
)

pkgver() {
  cd "${srcdir}/${_pkgname}"
  # tag.count.gHASH  -> tag.rcount.gHASH  and replace '-' with '.'
  git describe --long --tags | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  # Nothing to patch currently; keep hook for future fixes
  : 
}

build() {
  cd "${srcdir}/${_pkgname}"
  cmake -S . -B build -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  cmake --build build -- -j"$(nproc)"
}

package() {
  cd "${srcdir}/${_pkgname}"
  DESTDIR="${pkgdir}" cmake --install build
}
