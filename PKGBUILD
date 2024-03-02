# Merged with official ABS sonnet PKGBUILD by João, 2023/03/13 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: zan <zan@420blaze.it>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=sonnet-git
pkgver=6.0.0_r899.g184e686
pkgrel=2
pkgdesc='Spelling framework for Qt6'
arch=($CARCH)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(gcc-libs glibc qt6-base)
makedepends=(git aspell doxygen extra-cmake-modules-git hspell hunspell libvoikko qt6-declarative qt6-doc qt6-tools)
optdepends=('aspell: spell checking via aspell'
            'hspell: spell checking for Hebrew'
            'hunspell: spell checking via hunspell' 
            'libvoikko: Finnish support via Voikko'
            'qt6-declarative: QML bindings')
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
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
