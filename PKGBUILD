# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=liketaskmanager-git
pkgver=4.0.3.r3.gb287ddb
pkgrel=1
pkgdesc="Process monitor that mimics the performance and process tab of Windows Task Manager"
arch=('x86_64')
url="https://github.com/rejuce/LikeTaskManager"
license=('GPL-3.0-or-later')
depends=(
  'nethogs'
  'qt6-base'
  'qwt'
)
makedepends=(
  'cmake'
  'desktop-file-utils'
  'git'
  'qt6-tools'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/rejuce/LikeTaskManager.git")
sha256sums=('SKIP')

pkgver() {
  cd LikeTaskManager
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd LikeTaskManager

  # Remove old precompiled binary
  rm -fv LikeTaskManager

  # Use generic icon instead of application screenshot
  desktop-file-edit --set-icon=utilities-system-monitor LikeTaskManager.desktop

  # Update version
  sed -i "s/Version 3.1.0/Version ${pkgver%*.r*}/g" ltm.cpp
}

build() {
  local cmake_options=(
    -B build
    -S LikeTaskManager
    -W no-author
    -D CMAKE_BUILD_TYPE='RelWithDebInfo'
    -D CMAKE_INSTALL_PREFIX='/usr'
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

check() {
  local ctest_flags=(
    --test-dir build
    --output-on-failure
    --parallel $(nproc)
  )
  ctest "${ctest_flags[@]}"

  desktop-file-validate LikeTaskManager/LikeTaskManager.desktop
}

package() {
  install -Dm755 build/LikeTaskManager -t "$pkgdir/usr/bin/"
  install -Dm644 LikeTaskManager/LikeTaskManager.desktop -t \
    "$pkgdir/usr/share/applications/"
}
