# Maintainer: Nick Black <dankamongmen@gmail.com>

pkgname=growlight
pkgver=1.2.12
pkgrel=2
pkgdesc="Disk manipulation and system preparation tool"
url="https://nick-black.com/dankwiki/index.php/Growlight"
license=('GPL3')
arch=('x86_64')
# ncurses and readline are found without our help. Don't explicitly list them.
# The same goes for device-mapper.
depends=('cryptsetup' 'libatasmart' 'libpciaccess' 'pciutils' 'notcurses>=1.7.4')
makedepends=('cunit' 'cmake' 'pandoc')
optdepends=('jfsutils: JFS manipulation' 'xfsprogs: XFS manipulation'
            'mdadm: Linux MDRAID manipulation'
            'btrfs-progs: Btrfs manipulation'
            'hfsprogs: HFS (MacOS) manipulation'
            'ntfs-3g: NTFS (Windows) manipulation'
            'f2fs-tools: F2FS manipulation'
            'hdparm: Deep ATA hardware details'
            'nvme-cli: Deep NVMe hardware details',
            'zfs-utils: ZFS-on-Linux manipulation')
source=("https://github.com/dankamongmen/growlight/archive/v${pkgver}.tar.gz")

prepare() {
  mkdir -p "${pkgname}-${pkgver}/build"
  cd "${pkgname}-${pkgver}/build"
  if pkg-config --modversion libzfs > /dev/null 2>&1 ; then
    cmake .. -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_BUILD_TYPE=RelWithDebInfo
  else
    echo "Building without ZFS support..."
    cmake .. -DUSE_LIBZFS=off -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_BUILD_TYPE=RelWithDebInfo
  fi
}

build() {
  cd "${pkgname}-${pkgver}/build"
  make
}

package() {
  cd "${pkgname}-${pkgver}/build"
  make install DESTDIR="$pkgdir"
}

sha256sums=('734f4ce0db1c269e8273e168a06946c2e481528756688237d627b81ac8bb2b71')
