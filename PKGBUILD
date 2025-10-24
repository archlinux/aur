# Maintainer: Shrinivas Vishnu Kumbhar <shrinivas.v.kumbhar@gmail.com>

pkgname=plasma-setup-git
_pkgname=plasma-setup
pkgver=r310.072a568
pkgrel=1
pkgdesc="Initial setup wizard for KDE Plasma (git version)"
arch=('x86_64')
url="https://invent.kde.org/plasma/plasma-setup"
license=('BSD-2-Clause')

depends=(
  'gcc-libs'
  'glibc'
  'qt6-base'
  'qt6-declarative'
  'qt6-svg'
  'kauth'
  'kcoreaddons'
  'ki18n'
  'kpackage'
  'kconfig'
  'kscreen'             # provides KF6Screen
  'kwindowsystem'       # provides libkworkspace
  'plasma-workspace'    # provides QML modules
  'plasma-desktop'    # provides QML modules like kcm_keyboard
)

makedepends=(
  'git'
  'cmake'
  'extra-cmake-modules'
  'pkgconf'
  'gettext'
)

conflicts=('plasma-setup')
provides=('plasma-setup')

source=("${_pkgname}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
  local commit_count short_sha
  commit_count=$(git -C "${_pkgname}" rev-list --count HEAD)
  short_sha=$(git -C "${_pkgname}" rev-parse --short=7 HEAD)
  echo "r${commit_count}.${short_sha}"
}

build() {
  cd "${_pkgname}"
  cmake -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cd "${_pkgname}"
  DESTDIR="${pkgdir}" cmake --install build

  # License
  install -Dm644 LICENSES/BSD-2-Clause.txt \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:

