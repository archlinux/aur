# Maintainer: taotieren <admin@taotieren.com>

pkgname=linyaps-git
pkgver=1.9.12.r72.075aed9
pkgrel=1
pkgdesc='Next-Gen Universal Package Manager for Linux (linglong)'
arch=($CARCH)
url='https://github.com/OpenAtom-Linyaps/linyaps'
license=('LGPL-3.0-or-later')
provides=(
  ${pkgname%-git}
  linglong
)
conflicts=(
  ${pkgname%-git}
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
  hicolor-icon-theme
  libcap
  libelf
  linyaps-box
  ${_qt}-base
  systemd-libs
  ostree
  yaml-cpp
)
makedepends=(
  cli11
  cmake
  fmt
  git
  gtest
  libseccomp
  ${_qt}-tools
  ninja
  nlohmann-json
  openssl
  pkgconf
  tl-expected
  vulkan-headers
)
optdepends=(
  "linyaps-web-store-installer: 玲珑（Linglong）linyaps-web-store-installer is a package installer for the Linyaps Web store."
  "linglong-pica: deb package to Linglong package tool."
  "linglong-tools: A command line helper for linglong."
  "ll-killer-go: 玲珑杀手 Go: 玲珑应用快速构建系统"
)
install=${pkgname}.install
source=(
  "${pkgname}::git+${url}.git"
  "quicktype::git+https://github.com/glideapps/quicktype.git"
  "${pkgname}.install"
)
sha256sums=('SKIP'
  'SKIP'
  '4520bd1f10204220dea4141c970436deef01e9556727772ab76e408b7de69e54')

pkgver() {
  cd "${srcdir}/${pkgname}"
  (
    set -o pipefail

    latest_tag=$(git tag --sort=-version:refname | grep -Ev '^[vV]' | head -1)
    commit_count=$(git rev-list --count "${latest_tag}..HEAD")
    commit_hash=$(git rev-parse --short=7 HEAD)

    printf "%s.r%s.%s" "${latest_tag}" "${commit_count}" "${commit_hash}" ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  git -C "${srcdir}/${pkgname}" clean -dfx
  cd ${srcdir}/${pkgname}
  git submodule init
  git config submodule.tools/quicktype.url "$srcdir/quicktype"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "${srcdir}"/${pkgname}/
  # see：https://wiki.archlinux.org/title/CMake_package_guidelines
  cmake -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
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
