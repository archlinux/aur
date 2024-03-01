# Merged with official ABS kalarm PKGBUILD by João, 2021/07/20 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=kalarm-git
pkgver=24_r8847.g8f317e04
pkgrel=1
pkgdesc='Personal alarm scheduler'
arch=($CARCH)
url='https://apps.kde.org/kalarm/'
license=(GPL-2.0-or-later)
depends=(akonadi-contacts-git akonadi-mime-git gcc-libs glibc kauth-git kcalendarcore-git kcalutils-git kcodecs-git kcolorscheme-git kcompletion-git kconfig-git kconfigwidgets-git kcontacts-git kcoreaddons-git kcrash-git kdbusaddons-git kglobalaccel-git kguiaddons-git kholidays-git ki18n-git kidentitymanagement-git kio-git kitemmodels-git kmailtransport-git kmime-git knotifications-git knotifyconfig-git kstatusnotifieritem-git ktextaddons-git ktextwidgets-git kwidgetsaddons-git kwindowsystem-git kxmlgui-git libakonadi-git phonon-qt6-git qt6-5compat qt6-base)
makedepends=(git extra-cmake-modules-git kdoctools-git)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
groups=(kde-applications-git kdepim-git)
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'set(RELEASE_SERVICE_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
  _ver=${_ver:-"$(grep -m1 'set(PIM_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"}
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
