# SPDX-FileCopyrightText: 2026 Kmux contributors
# SPDX-License-Identifier: CC0-1.0
# Maintainer: egor3f <ef@efprojects.com>
# Contributor: vityas-off <15840124+vityas-off@users.noreply.github.com>

pkgname=kmux-workspaces-git
pkgver=0.1.0alpha.1.r10601.ge625bb1
pkgrel=1
pkgdesc='Project-workspace terminal based on KDE Konsole, inspired by cmux (development version)'
arch=(x86_64)
url='https://github.com/vityas-off/kmux'
license=(GPL-2.0-or-later
         LGPL-2.0-or-later)
# Keep depends, makedepends, and the CMake options in sync with the
# kmux-workspaces package.
depends=(glibc
         hicolor-icon-theme
         icu
         kbookmarks
         kcolorscheme
         kconfig
         kconfigwidgets
         kcoreaddons
         kcrash
         kdbusaddons
         kglobalaccel
         kguiaddons
         ki18n
         kiconthemes
         kio
         knewstuff
         knotifications
         knotifyconfig
         kparts
         kpty
         kservice
         ktextwidgets
         kwidgetsaddons
         kwindowsystem
         kxmlgui
         libssh
         libstdc++
         libxkbcommon
         qt6-base
         qt6-multimedia
         sh)
makedepends=(extra-cmake-modules
             git
             ninja)
optdepends=('keditbookmarks: to manage bookmarks')
provides=(kmux-workspaces)
# The unrelated kmux-git package (a tmux client based on Konsole) provides
# "kmux" and installs the same /usr/bin/kmux path.
conflicts=(kmux
           kmux-workspaces)
source=("kmux::git+$url.git")
sha256sums=('SKIP')

# The repository carries the inherited Konsole tags (v24.01.90 and others), so
# git describe would report Konsole versions. Use the Kmux version from
# CMakeLists.txt and the commit count, which only grows.
pkgver() {
  cd kmux
  local version prerelease
  version=$(sed -nE 's/^set\(KMUX_VERSION_(MAJOR|MINOR|PATCH) "([0-9]+)"\)$/\2/p' CMakeLists.txt | paste -sd.)
  prerelease=$(sed -nE 's/^set\(KMUX_VERSION_PRERELEASE "([^"]*)"\)$/\1/p' CMakeLists.txt)
  printf '%s%s.r%s.g%s' "$version" "${prerelease//-/}" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cmake -B build -S kmux -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF \
    -DWITH_KAPSULE=OFF \
    -DWITH_LIBSSH=ON \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
