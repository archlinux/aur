# Merged with official ABS sonnet PKGBUILD by João, 2023/03/13 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: zan <zan@420blaze.it>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=sonnet-git
pkgver=5.240.0_r773.ge64d774
pkgrel=1
pkgdesc='Spelling framework for Qt6'
arch=($CARCH)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(qt6-base)
makedepends=(git extra-cmake-modules-git qt6-declarative qt6-tools hunspell aspell hspell libvoikko doxygen)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
optdepends=('hunspell: spell checking via hunspell' 'aspell: spell checking via aspell' 
            'hspell: spell checking for Hebrew' 'libvoikko: Finnish support via Voikko'
            'qt6-declarative: QML bindings')
groups=(kf6-git)
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'set(KF_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DQT_MAJOR_VERSION=6 \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
