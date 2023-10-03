# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=kpmcore-git
pkgver=23.11.70.r1426.29fe2c5
pkgrel=1
pkgdesc="Library for managing partitions. Common code for KDE Partition Manager and other projects. (GIT version)"
arch=('x86_64')
url='http://kde.org/applications/system/kdepartitionmanager'
license=('GPL2')
depends=(
  'gcc-libs' # libgcc_s.so libstdc++.so
  'glibc' # libc.so
  'util-linux-libs' 'libblkid.so'
  'device-mapper'
  'qt5-base' # libQt5Core.so libQt5DBus.so libQt5Gui.so libQt5Widgets.so
  'kcoreaddons5' # libKF5CoreAddons.so
  'kwidgetsaddons5' # libKF5WidgetsAddons.so
  'ki18n' # libKF5I18n.so
  'polkit-qt5' # libpolkit-qt5-core-1.so
)
makedepends=(
  'extra-cmake-modules'
  'git'
  'python'
)
conflicts=('kpmcore')
provides=(
  'kpmcore'
  'libkpmcore.so'
)
optdepends=(
  'btrfs-progs: BTFRS support'
  'e2fsprogs: ext2/3/4 support'
  'xfsprogs: XFS support'
  'jfsutils: JFS support'
  'hfsprogs: HFS support'
  'cryptsetup: dm-crypt support'
  'reiserfsprogs: Reiser support'
  'reiser4progs: Reiser4 support'
  'ntfs-3g: NTFS support'
  'dosfstools: FAT32 support'
  'fatresize: FAT resize support'
  'f2fs-tools: F2FS support'
  'exfat-utils: exFAT support'
  'exfatprogs: exFAT alternative support'
  'nilfs-utils: nilfs support'
  'udftools: UDF support'
  'zfs-utils: ZSF support'
  'lvm2: lvm2 support'
  'nilfs-utils: nilfs support'
#   'nilfs2-utils: nilfs2 support'
#   'ocfs2-tools: ocfs2 support'
)
source=('git+https://invent.kde.org/system/kpmcore.git')
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd kpmcore
  _ver="$(cat CMakeLists.txt | grep -m3 -e MAJOR -e MINOR -e RELEASE | grep -o "[[:digit:]]*" | paste -sd'.')"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}


build() {
  cmake -S kpmcore -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=ON

  cmake --build build
}

_check() { # disable due need polkit password
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
