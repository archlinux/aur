# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=kpmcore-git
pkgver=4.1.0.r1067.0ffec31
pkgrel=1
pkgdesc="Library for managing partitions. Common code for KDE Partition Manager and other projects. (GIT version)"
arch=('x86_64')
url='http://kde.org/applications/system/kdepartitionmanager'
license=('GPL2')
depends=('parted'
         'libatasmart'
         'kwidgetsaddons'
         'ki18n'
         'kauth'
         'qca'
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
source=('git+https://invent.kde.org/system/kpmcore.git')
sha256sums=('SKIP')

pkgver() {
  cd kpmcore
  _ver="$(cat CMakeLists.txt | grep -m3 -e MAJOR -e MINOR -e RELEASE | grep -o "[[:digit:]]*" | paste -sd'.')"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build

  cd build
  cmake ../kpmcore \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF

}

build() {
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
