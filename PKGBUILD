# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: laloch <lalochcz@gmail.com>
# Contributor: TDY <tdy@gmx.com>
# Contributor: Ivan Shapovalov <intelfx100@gmail.com>

pkgname=vdfuse
pkgver=82a
pkgrel=9
_headers=svn-47049
pkgdesc="A FUSE module for mounting VirtualBox disk images (VDI/VMDK/VHD) on the host"
arch=('i686' 'x86_64')
url="http://forums.virtualbox.org/viewtopic.php?f=26&t=33355"
license=('GPL3')
depends=('fuse' 'virtualbox' 'virtualbox-sdk')
makedepends=('pkgconfig')
install="${pkgname}.install"
source=("http://ftp.de.debian.org/debian/pool/main/v/virtualbox/virtualbox_4.1.18-dfsg-2+deb7u3.debian.tar.gz"
        "https://github.com/muflone/virtualbox-includes/archive/${_headers}.tar.gz"
        "vdautomount"::"http://forums.virtualbox.org/download/file.php?id=2865"
        "add-typedef-to-PARTITIONING_TYPE_vd.h.patch"
        "init-VDINTERFACEERROR_vdfuse.c.patch")
sha256sums=('42313af2dbdb9270ed2a12915c8b2640585708707a5d4e8aa1eaf4090b5c1d06'
            '357d0cc778f33684d158e60acae9478b26256af39b31bed19556c0928f133001'
            '28b4ce0e0ca72721e0dbbdc776e5c3aa47b160afa8538064497be68da4713493'
            '98f3a12fd288b650879822655c8c2ead10a630aa9637a186c7289c1f2f015c31'
            'c4ae283a2f94ac81615c3b3d5f6a3c93d1d03438ee9f1e2520f8e2043b9aa1c0')

prepare() {
  [ -d "${srcdir}/includes" ] && rm -rf "${srcdir}/includes" ]
  cp -r "virtualbox-includes-${_headers}" "${srcdir}/includes"
  msg2 "Patching sources..."
  sed -i '1s,python,&2,' "${srcdir}/vdautomount"
  patch -p1 -i "add-typedef-to-PARTITIONING_TYPE_vd.h.patch"
  patch -p1 -i "init-VDINTERFACEERROR_vdfuse.c.patch"
}

build() {
  cd "debian/${pkgname}"
  gcc "${pkgname}.c" -o "${pkgname}" \
    $(pkg-config --cflags --libs fuse) \
    -I"${srcdir}/includes" \
    -Wl,-rpath,/usr/lib/virtualbox/ \
    /usr/lib/virtualbox/VBoxDD.so \
    /usr/lib/virtualbox/VBoxDDU.so \
    -Wall $CFLAGS
}

package() {
  install -m 755 -d "${pkgdir}/usr/bin"
  install -m 755 -t "${pkgdir}/usr/bin" \
    "debian/${pkgname}/${pkgname}" "vdautomount"
}
