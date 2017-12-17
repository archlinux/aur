# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgname=gvfs
pkgname=${_pkgname}-light
pkgver=1.34.1+8+g091ac25d
pkgrel=1
pkgdesc="Virtual filesystem implementation for GIO, without network/optical/misc support."
url="https://wiki.gnome.org/Projects/gvfs"
arch=('i686' 'x86_64')
license=('LGPL')
conflicts=("${_pkgname}=${pkgver}")
provides=("${_pkgname}=${pkgver}")
depends=('udisks2' 'gcr' 'libarchive' 'libgphoto2' 'fuse')
makedepends=('git' 'gtk-doc' 'polkit' 'libcap')
optdepends=('gvfs-mtp: MTP device support'
            'gtk3: Recent files support')
groups=('gnome')
_commit=091ac25d59d0dc0f5fed17510b0593bcd86e9fc9 # gnome-3-26
source=("git+https://git.gnome.org/browse/gvfs#commit=${_commit}"
        'gvfsd.hook')
sha256sums=('SKIP'
            '478b9cf7b4c242959fc640dbf0cd4935f16c59b81f5828a3af102d608d7a9d72')

pkgver() {
    cd ${_pkgname}
    git describe --tags | sed 's/-/+/g'
}

prepare() {
    cd ${_pkgname}
    NOCONFIGURE=1 ./autogen.sh
}

build() {
    cd ${_pkgname}
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --disable-static \
        --libexecdir=/usr/lib/gvfs \
        --disable-keyring \
        --disable-http \
        --disable-avahi \
        --disable-nfs \
        --disable-google \
        --disable-samba \
        --disable-afp \
        --disable-afc \
        --disable-cdda \
        --disable-bluray \
        --disable-gdu \
        --disable-goa

    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
    make
}

package() {

    cd ${_pkgname}
    sed -e 's/^am__append_3/#am__append_3/' \
        -e 's/^am__append_4/#am__append_4/' \
        -e 's/^am__append_5/#am__append_5/' \
        -e 's/^am__append_6/#am__append_6/' \
        -i monitor/Makefile
    make DESTDIR="${pkgdir}" install

    install -Dm644 ../gvfsd.hook "${pkgdir}/usr/share/libalpm/hooks/gvfsd.hook"
    install -d -o root -g 102 -m 750 "${pkgdir}/usr/share/polkit-1/rules.d"
    # Remove empty dir
    rm -r "${pkgdir}"/usr/share/GConf
}
