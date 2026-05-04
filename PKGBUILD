# Merged with official ABS kate PKGBUILD by João, 2024/03/26 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: dr460nf1r3 <dr460nf1r3@garudalinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kate-git
pkgver=26.07.70_r23764.g5024024285
pkgrel=1
arch=($CARCH)
license=(GPL-2.0-or-later LGPL-2.0-or-later)
pkgdesc='Advanced text editor'
groups=(kde-applications-git kde-utilities-git)
url='https://apps.kde.org/kate/'
depends=(gcc-libs glibc gpgmepp karchive-git kbookmarks-git kcolorscheme-git kcompletion-git kconfig-git kconfigwidgets-git kcoreaddons-git kcrash-git kdbusaddons-git kguiaddons-git ki18n-git kiconthemes-git kio-git knewstuff-git kparts-git kservice-git ktexteditor-git kuserfeedback-git kwidgetsaddons-git kwindowsystem-git kxmlgui-git qt6-base sh syntax-highlighting-git)
makedepends=(git extra-cmake-modules-git kdoctools-git qtkeychain-qt6)
conflicts=(${pkgname%-git} kwrite kwrite-git)
provides=(${pkgname%-git} kwrite kwrite-git)
replaces=(kwrite-git)
optdepends=('clang: C and C++ LSP support'
            'git: git-blame plugin' 
            'konsole-git: open a terminal in Kate'
            'python-lsp-server: Python LSP support'
            'qt6-declarative: RBQL plugin'
            'qtkeychain-qt6: SQL plugin'
            'rust: Rust LSP support'
            'texlab: LaTeX LSP support')
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _major_ver="$(grep -m1 'set *(RELEASE_SERVICE_VERSION_MAJOR' CMakeLists.txt | cut -d '"' -f2)"
  _minor_ver="$(grep -m1 'set *(RELEASE_SERVICE_VERSION_MINOR' CMakeLists.txt | cut -d '"' -f2)"
  _micro_ver="$(grep -m1 'set *(RELEASE_SERVICE_VERSION_MICRO' CMakeLists.txt | cut -d '"' -f2)"
  echo "${_major_ver}.${_minor_ver}.${_micro_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
