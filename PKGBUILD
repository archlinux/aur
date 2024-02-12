# Merged with official ABS falkon PKGBUILD by João, 2021/06/03 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: pavbaranov <pavbaranov at gmail dot com>
# Contributor: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Maintainer: Solomon Choina <shlomochoina@gmail.com>

pkgname=falkon-git
pkgver=24.04.70_r6233.g422a998ff
pkgrel=1
pkgdesc="Cross-platform QtWebEngine browser"
arch=($CARCH)
url="https://www.falkon.org/"
license=(GPL-2.0-or-later3)
depends=(gcc-libs glibc karchive-git libxcb openssl qt6-5compat qt6-base qt6-declarative qt6-webchannel qt6-webengine)
makedepends=(git extra-cmake-modules-git kio-git libgnome-keyring purpose-git pyside6 qt6-tools shiboken6)
optdepends=('kcoreaddons-git: KDE integration'
            'kcrash-git: KDE integration'
            'kio-git: KDE integration'
            'kjobwidgets-git: KDE integration'
            'kwallet-git: KDE integration'
            'libgnome-keyring: gnome keyring integration'
            'purpose-git: KDE integration'
            'pyside6: Python plugins')
groups=(kde-applications-git
       kde-network-git)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
replaces=(qupzilla)
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
    -DQT_MAJOR_VERSION=6 \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
