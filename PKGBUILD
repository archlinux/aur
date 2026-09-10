# Maintainer: Ivan Volkov <me at 1v4n dot ru>

pkgname=rclone-browser-ng
pkgver=2.0.2
pkgrel=1
pkgdesc="Qt6 GUI for rclone, community continuation of Rclone Browser"
arch=('x86_64')
url="https://github.com/SysAdminDoc/RcloneBrowserNG"
license=('MIT')
depends=('qt6-base' 'rclone')
makedepends=('cmake')
optdepends=(
  'fuse3: mount remotes as local filesystems'
  'mpv: stream media files'
  'vlc: stream media files'
)
provides=('rclone-browser')
conflicts=('rclone-browser' 'rclone-browser-git' 'rclone-browser-qt6')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/SysAdminDoc/RcloneBrowserNG/archive/refs/tags/v$pkgver.tar.gz"
  no-werror.patch
)
sha256sums=(
  '8630b6c7ceba1676fd17ff0210032c61675488620fca30fc28d75b5ce44c0713'
  'e84af5afaa7bb408b61dbeb7c073ef24e63492a778e25283ff5f806082030657'
)

prepare() {
  patch -d "RcloneBrowserNG-$pkgver" -Np1 -i "$srcdir/no-werror.patch"
}

build() {
  local cmake_options=(
    -B build
    -S "RcloneBrowserNG-$pkgver"
    -W no-author
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D BUILD_TESTING=OFF
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "RcloneBrowserNG-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
