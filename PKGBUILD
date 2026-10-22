# shellcheck disable=SC2034,SC2148,SC2154

# Maintainer: Mylloon <aur@mylloon.fr>

_pkgname=kglobalacceld
pkgname="${_pkgname}"-ptt-fix
pkgver=6.8.0
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='Daemon providing Global Keyboard Shortcut (Accelerator) functionality patched with MR !130'

arch=(x86_64)
url='https://invent.kde.org/plasma/kglobalacceld/-/merge_requests/130'
license=(LGPL-2.0-or-later)

depends=(glibc
         kconfig
         kcoreaddons
         kcrash
         kdbusaddons
         kglobalaccel
         kio
         kjobwidgets
         kservice
         kwindowsystem
         libstdc++
         libx11
         libxcb
         qt6-base
         xcb-util-keysyms)
makedepends=(git extra-cmake-modules)

provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")

source=(
  "https://download.kde.org/stable/plasma/$_dirver/$_pkgname-$pkgver.tar.xz"
  "patch.diff::${url}.diff"
)
sha256sums=('SKIP' 'SKIP')

options=(!debug)

prepare() {
  cd "${_pkgname}-${pkgver}" || exit

  patch -Np1 -i ../patch.diff
}

build() {
  cmake -B build -S "${_pkgname}-${pkgver}" \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_LIBEXECDIR=lib
  cmake --build build
}


package() {
  DESTDIR="$pkgdir" cmake --install build
}
