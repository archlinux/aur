# Maintainer: Nick Black <dankamongmen@gmail.com>

pkgname=growlight
pkgver=1.2.1
pkgrel=1
pkgdesc="Disk manipulation and system preparation tool"
url="https://nick-black.com/dankwiki/index.php/Growlight"
license=('GPL3')
arch=('x86_64')
# ncurses and readline are found without our help. Don't explicitly list them.
# The same goes for device-mapper.
depends=('cryptsetup' 'libatasmart' 'libpciaccess' 'pciutils' 'notcurses>=1.1.7')
makedepends=('cunit' 'docbook-xsl' 'autoconf-archive' 'libxslt' 'autoconf')
optdepends=('jfsutils: JFS manipulation'
            'xfsprogs: XFS manipulation'
            'mdadm: Linux MDRAID manipulation'
            'btrfs-progs: Btrfs manipulation'
            'hfsprogs: HFS (MacOS) manipulation'
            'ntfs-3g: NTFS (Windows) manipulation'
            'f2fs-tools: F2FS manipulation'
            'hdparm: Deep ATA hardware details'
            'nvme-cli: Deep NVMe hardware details',
            'zfs-utils: ZFS-on-Linux manipulation')
source=("https://github.com/dankamongmen/growlight/archive/v${pkgver}.tar.gz")

build() {
  cd "$pkgname-$pkgver"
  autoreconf -fis
  if pkg-config --modversion libzfs > /dev/null 2>&1 ; then
    ./configure --prefix=/usr
  else
    echo "Building without ZFS support..."
    ./configure --prefix=/usr --disable-zfs
  fi
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

check() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" check
}

sha256sums=('efe105f400b599e15246f6153d270fe82d861f28a323720fc73172a5869e34d8')
