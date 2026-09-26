# shellcheck disable=SC2034,SC2148,SC2154

# Maintainer: Mylloon <aur@mylloon.fr>

_pkgname=kglobalacceld
pkgname="${_pkgname}"-ptt-fix
pkgver=6.7.5
_dirver="${pkgver%.*}"
pkgrel=1
pkgdesc='Daemon providing Global Keyboard Shortcut (Accelerator) functionality'

arch=(x86_64)
url='https://invent.kde.org/plasma/kglobalacceld/-/merge_requests/124'
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
  "124.diff::https://invent.kde.org/plasma/kglobalacceld/-/merge_requests/124.diff"
)
sha256sums=('SKIP' 'SKIP')

options=(!debug)

prepare() {
  cd "${_pkgname}-${pkgver}" || exit

  # Fix with upstream
  sed -i 's/m_lastShortcutSequence = normalizedSequence;/m_lastShortcutSequence = tempSequence;/' ../124.diff

  patch -Np1 -i ../124.diff
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
