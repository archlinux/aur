# Maintainer: taotieren <admin@taotieren.com>

pkgname=linyaps-web-store-installer-git
_tagname=1.6.8
pkgver=1.6.8.r1.e9e2e7e
pkgrel=1
pkgdesc='玲珑（Linglong）linyaps-web-store-installer is a package installer for the Linyaps Web store.'
arch=($CARCH)
url='https://github.com/OpenAtom-Linyaps/linyaps-web-store-installer'
license=('LGPL-3.0-or-later')
provides=(
  ${pkgname%-git}
)
conflicts=(
  ${pkgname%-git}
)
replaces=()
_qt=qt6
depends=(
  gcc-libs
  glibc
  linyaps
  ${_qt}-base
  xdg-utils
)
makedepends=(
  cmake
  git
  gtest
  ninja
  ${_qt}-tools
  pkgconf
  vulkan-headers
)
checkdepends=()
optdepends=(
  "linglong-pica: deb package to Linglong package tool."
)
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  (
    set -o pipefail
    
    latest_tag=$(git tag --sort=-version:refname | grep -Ev '^[vV]' | head -1)
    commit_count=$(git rev-list --count "${latest_tag}..HEAD")
    commit_hash=$(git rev-parse --short=7 HEAD)

    printf "%s.r%s.%s" "${latest_tag}" "${commit_count}" "${commit_hash}"||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
  cd "${srcdir}"/${pkgname}/

  # see：https://wiki.archlinux.org/title/CMake_package_guidelines
  cmake -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
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
  cd "${srcdir}"/${pkgname}
  DESTDIR="${pkgdir}" ninja -C build install
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
