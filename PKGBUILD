# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Philip Goto <philip.goto@gmail.com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Andrew Simmons <andrew.simmons@gmail.com>
# Contributor: György Balló <ballogy@freestart.hu>

pkgname=gparted-git
pkgver=1.7.0.r2.geaed0502
pkgrel=2
pkgdesc="A Partition Magic clone, frontend to GNU Parted"
arch=(i686 x86_64 armv7h aarch64)
url="https://gparted.org/"
license=(GPL-2.0-or-later GFDL-1.2-or-later)
provides=(gparted)
conflicts=(gparted)
depends=(parted gtkmm3)
makedepends=(git gnome-common intltool itstool yelp-tools polkit)
optdepends=('bcachefs-tools: for bcachefs partitions'
            'btrfs-progs: for btrfs partitions'
            'dosfstools: for FAT16 and FAT32 partitions'
            'exfatprogs: for exFAT partitions'
            'f2fs-tools: for Flash-Friendly File System'
            'gpart: for recovering corrupt partition tables'
            'jfsutils: for jfs partitions'
            'mtools: utilities to access MS-DOS disks'
            'nilfs-utils: for nilfs2 support'
            'ntfs-3g: for ntfs partitions'
            'polkit: to run gparted from application menu'
            'udftools: for UDF file system support'
            'xfsprogs: for xfs partitions'
            'xorg-xhost: authorization from wayland')
source=("git+https://gitlab.gnome.org/GNOME/gparted.git")
sha256sums=('SKIP')

pkgver() {
  cd gparted
  git describe --long --tags | sed 's/^GPARTED_//;s/\([^-]*-g\)/r\1/;s/_/./g;s/-/./g'
}

build() {
  cd gparted

  gnome-autogen.sh \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/gparted \
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
