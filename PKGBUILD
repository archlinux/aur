# Maintainer: Antoine Viallon <antoine.viallon@gmail.com>

pkgname=gparted-f2fs-patch
_pkgname=gparted
pkgver=0.33.0
norigpkgver=0.33.0
pkgrel=2
pkgdesc="A Partition Magic clone, frontend to GNU Parted. Patched with experimental F2FS features."
arch=('x86_64')
url="http://gparted.sourceforge.net"
license=('GPL')
provides=('gparted')
conflicts=('gparted')
depends=('parted' 'gtkmm')
makedepends=('intltool' 'pkg-config' 'gnome-doc-utils' 'polkit')
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
validpgpkeys=('BB09FFB87563FA2E1A22146817A6D3FF338C9570') # "Curtis Gedak <gedakc@gmail.com>"
source=("https://downloads.sourceforge.net/project/${_pkgname}/${_pkgname}/${_pkgname}-${pkgver}/${_pkgname}-${pkgver}.tar.gz"{,.sig})
sha256sums=('5023b8c983f88a22e65bf6f09a12ea09369defc008981b52ee8b96a3879f81d6'
    'SKIP')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
     
    patch -Np1 < ../../f2fs-verify-resize.patch
    #patch -Np1 < "${srcdir}/${_pkgname}-${pkgver}/f2fs-verify-resize.patch"

    ./configure --prefix=/usr \
        --sbindir=/usr/bin \
        --enable-online-resize \
        --enable-libparted-dmraid \
        --enable-xhost-root

   CFLAGS="$CFLAGS -Wparentheses" CXXFLAGS="$CXXFLAGS -Wparentheses" make
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    make DESTDIR="${pkgdir}" install

    # Install policy file
    install -D -m0644 org.gnome.gparted.policy \
        "${pkgdir}"/usr/share/polkit-1/actions/org.gnome.gparted.policy

}
