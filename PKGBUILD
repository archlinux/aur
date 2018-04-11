# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=kpmcore-git
pkgver=3.3.0.r691.df449ac
pkgrel=1
pkgdesc="Library for managing partitions. Common code for KDE Partition Manager and other projects. (GIT version)"
arch=('x86_64')
url='http://kde.org/applications/system/kdepartitionmanager'
license=('GPL2')
depends=('parted'
         'libatasmart'
         'kwidgetsaddons'
         'kcoreaddons'
         'ki18n'
         )
conflicts=('kpmcore')
provides=('kpmcore')
makedepends=('extra-cmake-modules'
             'git'
             'python'
             )
optdepends=('e2fsprogs: ext2/3/4 support'
            'xfsprogs: XFS support'
            'jfsutils: JFS support'
            'reiserfsprogs: Reiser support'
            'ntfs-3g: NTFS support'
            'dosfstools: FAT32 support'
            'f2fs-tools: F2FS support'
            'exfat-utils: exFAT support'
            'nilfs-utils: nilfs support'
            'udftools: UDF support'
            )
source=('git://anongit.kde.org/kpmcore.git')
sha256sums=('SKIP')

pkgver() {
  cd kpmcore
  _ver="$(cat CMakeLists.txt | grep -m3 -e MAJOR -e MINOR -e RELEASE | grep -o "[[:digit:]]*" | paste -sd'.')"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kpmcore \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF

  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
