# Maintainer: Nick Black <dankamongmen@gmail.com>

pkgname=growlight
pkgver=1.1.3.1
pkgrel=1
pkgdesc="Disk manipulation and system preparation tool"
url="https://nick-black.com/dankwiki/index.php/Growlight"
license=('GPL3')
arch=('x86_64')
# ncurses and readline are found without our help. Don't explicitly list them.
# The same goes for device-mapper.
depends=('cryptsetup' 'libatasmart' 'libpciaccess' 'pciutils')
makedepends=('cunit' 'docbook-xsl' 'autoconf-archive' 'libxslt' 'autoconf' 'outcurses>=0.0.5')
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

sha256sums=('0a20f86a54490f7e29de529075bc4f10356a9b477274855ed45aea43b7fde80a')
