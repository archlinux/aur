# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Michael DÃ¼ll <mail@akurei.me> PGP-Key: 6D666EC8
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Roozbeh Shafiee <Roozbeh@Roozbeh.us>

_pkgbase=choqok
pkgname="${_pkgbase}-git"
pkgver=1.7.0.r279.g8603afb2
pkgrel=1
pkgdesc='Microblogging client for KDE with support for Pump.io, GNU social and Twitter.com - git version'
arch=(i686 x86_64)
url='https://choqok.kde.org/'
license=(GPL)
depends=(
  attica5
  gcc-libs
  glibc
  hicolor-icon-theme
  kcmutils5
  kconfig5
  kconfigwidgets5
  kcoreaddons5
  kemoticons
  kglobalaccel5
  kguiaddons5
  ki18n5
  kio5
  kjobwidgets5
  knotifications5
  knotifyconfig5
  kservice5
  ktextwidgets5
  kwallet5
  kwidgetsaddons5
  kxmlgui5
  purpose5
  qt5-base
  qt5-networkauth
  sonnet5
)
makedepends=(
  extra-cmake-modules
  git
  kdoctools5
  python
  qca-qt5
)
provides=("${_pkgbase}")
conflicts=("${_pkgbase}")
source=(""${_pkgbase}"::git+https://invent.kde.org/network/choqok.git")
b2sums=('SKIP')

prepare() {
  echo "Removing the defunct TelepathyQt plugin..."
  rm -rfv "${_pkgbase}/plugins/imstatus/"
  sed -e 's/add_subdirectory(imstatus)//' \
    -i "${_pkgbase}/plugins//CMakeLists.txt"
  echo "Removing the defunct KdeWebKit / Konqueror plugin..."
  rm -rfv "${_pkgbase}/plugins/konqueror/"
  sed -e 's/find_package(KF5Parts)//' \
    -e 's/find_package(KF5WebKit)//' \
    -e 's/add_subdirectory(konqueror)//' \
    -i "${_pkgbase}/plugins//CMakeLists.txt"
}

pkgver() {
    cd "${_pkgbase}"

    # Generate git tag based version. Count only proper (v)#.#* [#=number] tags.
    local _gitversion=$(git describe --long --tags --match '[v0-9][0-9.][0-9.]*' | sed -e 's|^v||' | tr '[:upper:]' '[:lower:]') 

    # Format git-based version for pkgver
    # Expected format: e.g. 1.5.0rc2.r521.g99982a1c
    echo "${_gitversion}" | sed \
        -e 's|^\([0-9][0-9.]*\)-\([a-zA-Z]\+\)|\1\2|' \
        -e 's|\([0-9]\+-g\)|r\1|' \
        -e 's|-|.|g'
}

build() { 
  cmake -B build -S "${_pkgbase}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
