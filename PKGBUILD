# $Id: PKGBUILD 187862 2013-06-07 09:24:58Z tomegun $
# Maintainer: GI_Jack <iamjacksemail@hackermail.com>
# Contributor: Angel Velasquez <angvp@archlinux.org> 
# Contributor: Jason Chu <jason@archlinux.org>
# Contributor: Juergen Hoetzel <jason@archlinux.org>

#compiled and included are the AutoWEP and PTW plugins not compiled by default
pkgname=kismet-allplugins
_pkgname=kismet
pkgver=2013_03_R1b
_realver="${pkgver//_/-}"
pkgrel=2
pkgdesc="802.11 layer2 wireless network detector, sniffer, and intrusion detection system(all plugins enabled)"
arch=('i686' 'x86_64')
url="http://www.kismetwireless.net/"
license=('GPL')
conflicts=('kismet' 'kismet-svn' 'kismet-ptw')
provides=('kismet')
depends=('libpcap' 'pcre' 'bluez-libs' 'libcap')
optdepends=('gpsd: log coordinates of detected networks'
            'wireshark-cli: provide OUI files used to determine device manufacturer'
            'wireshark-cli: mergecap, to merge multiple capture files'
            'sox: provide the default kismet sound playback binary'
            'festival: text-to-speech support'
            'flite:  alternative/lightweight text-to-speech support'
            'ruby: ruby interface')
backup=('etc/kismet.conf' 'etc/kismet_drone.conf')
install=kismet.install
changelog=kismet.changelog
source=("http://www.kismetwireless.net/code/${_pkgname}-${_realver}.tar.gz"{,.asc})
md5sums=('6cdcd78baf2e15edbe8a9de3c5493f02'
         'SKIP')

build() {
    cd "${srcdir}/${_pkgname}-${_realver}"

    ./configure --prefix=/usr \
                --sysconfdir=/etc \
                --localstatedir=/var
    make dep
    make

    # Include plugins bundled with kismet
    make plugins

    cd restricted-plugin-ptw/
    KIS_SRC_DIR="${srcdir}/${_pkgname}-${_realver}" make ||return 1
    cd ..
    cd restricted-plugin-autowep/
    KIS_SRC_DIR="${srcdir}/${_pkgname}-${_realver}" make ||return 1
}

package() {
    cd "${srcdir}/${_pkgname}-${_realver}"
    
    # Install kismet
    make DESTDIR="$pkgdir" install

    # Install plugins
    make plugins-install DESTDIR="$pkgdir"

    #install the PTR plugin
    cd restricted-plugin-ptw/
    KIS_SRC_DIR="${srcdir}/${_pkgname}-${_realver}" KIS_DEST_DIR="$pkgdir" DESTDIR="$KIS_DEST_DIR" make install || return 1
    cd ..
    cd restricted-plugin-autowep/
    KIS_SRC_DIR="${srcdir}/${_pkgname}-${_realver}" KIS_DEST_DIR="$pkgdir" DESTDIR="$KIS_DEST_DIR" make install || return 1
    cd ..
    # the README is very comprehensive, a good idea to include it
    install -D -m 644 "${srcdir}/kismet-${_realver}/README" "${pkgdir}/usr/share/kismet/README"

    # Our own suid-install, first half (see kismet.install)
    install -o "root" -g "root" -m 4550 kismet_capture "${pkgdir}/usr/bin/"
}
