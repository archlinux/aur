# Maintainer: taotieren <admin@taotieren.com>

pkgname=linyaps
pkgver=1.9.0
pkgrel=1
pkgdesc='Linglong is the container application toolkit of deepin.'
arch=($CARCH)
url='https://github.com/OpenAtom-Linyaps/linyaps'
license=('LGPL-3.0-or-later')
provides=(
  ${pkgname}
  linglong
)
conflicts=(
  ${pkgname}
  linglong
)
replaces=(linglong-git)
_qt=qt6
depends=(
  sh
  curl
  gcc-libs
  glib2
  glibc
  libelf
  libseccomp
  ${_qt}-base
  systemd-libs
  ostree
  yaml-cpp
)
makedepends=(
  cli11
  cmake
  git
  gtest
  ${_qt}-tools
  ninja
  nlohmann-json
  openssl
  pkgconf
  tl-expected
)
optdepends=(
  "linyaps-box: 玲珑（Linglong） is the container application toolkit of deepin."
  "linyaps-installer: 玲珑（Linglong）linyaps-web-store-installer is a package installer for the Linyaps Web store."
  "linglong-pica: deb package to Linglong package tool."
  "linglong-tools: A command line helper for linglong."
  "ll-killer-go: 玲珑杀手 Go: 玲珑应用快速构建系统"
)
install=${pkgname}.install
source=(
  "${pkgname}::git+${url}.git#tag=${pkgver}"
  "${pkgname}.install"
)
sha256sums=('3bf8024b8643f65f38dd792c88aaeebeb4a40c2551b55b2ace3a2f0dbca011a8'
            '08e41ba735bf4285a089e3c86515bd9aee4f8fb3a78b1c06ec74fd1e3959efc3')

prepare() {
  git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
  cd "${srcdir}"/${pkgname}/
  # see：https://wiki.archlinux.org/title/CMake_package_guidelines
  cmake -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCPM_LOCAL_PACKAGES_ONLY=ON \
    -DLINGLONG_VERSION="$pkgver" \
    -Wno-dev \
    -B build \
    -G Ninja

  ninja -C build
}

# check() {
#   cd "${srcdir}"/${pkgname}/
#   ctest --test-dir build --output-on-failure
# }

package() {
  DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname}/build install
}
