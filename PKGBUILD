# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Philip Goto <philip.goto@gmail.com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Andrew Simmons <andrew.simmons@gmail.com>
# Contributor: György Balló <ballogy@freestart.hu>

pkgname=gparted-git
pkgver=1.4.0.r85.g1d92c7aa
pkgrel=1
pkgdesc="A Partition Magic clone, frontend to GNU Parted"
arch=(i686 x86_64 armv7h aarch64)
url="https://gparted.org/"
license=('GPL')
provides=('gparted')
conflicts=('gparted')
depends=('parted' 'gtkmm3')
makedepends=('git' 'gnome-common' 'intltool' 'itstool' 'pkg-config' 'yelp-tools' 'polkit')
optdepends=('dosfstools: for FAT16 and FAT32 partitions'
            'jfsutils: for jfs partitions'
            'f2fs-tools: for Flash-Friendly File System'
            'btrfs-progs: for btrfs partitions'
            'exfat-utils: for exFAT partitions'
            'ntfs-3g: for ntfs partitions'
            'reiserfsprogs: for reiser partitions'
            'udftools: for UDF file system support'
            'xfsprogs: for xfs partitions'
            'nilfs-utils: for nilfs2 support'
            'polkit: to run gparted from application menu'
            'gpart: for recovering corrupt partition tables'
            'mtools: utilities to access MS-DOS disks')
source=("git+https://gitlab.gnome.org/GNOME/gparted.git")
sha256sums=('SKIP')

pkgver() {
  cd gparted
  git describe --long --tags | sed 's/^GPARTED_//;s/\([^-]*-g\)/r\1/;s/_/./g;s/-/./g'
}

build() {
  cd gparted

  gnome-autogen.sh --prefix=/usr \
      --sbindir=/usr/bin \
      --enable-online-resize \
      --enable-libparted-dmraid \
      --enable-xhost-root
  make
}

package() {
  cd gparted

  make DESTDIR="${pkgdir}" install

  # Install policy file
  install -D -m0644 org.gnome.gparted.policy \
      "${pkgdir}"/usr/share/polkit-1/actions/org.gnome.gparted.policy

}
