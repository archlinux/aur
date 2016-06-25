# Maintainer: brent s. <bts[at]square-r00t[dot]net>
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Past maintainer: GI_Jack <iamjacksemail@hackermail.com>
# Contributor: Angel Velasquez <angvp@archlinux.org> 
# Contributor: Jason Chu <jason@archlinux.org>
# Contributor: Juergen Hoetzel <jason@archlinux.org>

#compiled and included are the AutoWEP and PTW plugins not compiled by default
pkgname=kismet-allplugins
_pkgname=kismet
pkgver=2016_01_R1
_realver="${pkgver//_/-}"
pkgrel=2
pkgdesc="802.11 layer2 wireless network detector, sniffer, and intrusion detection system (all plugins enabled)"
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
source=("http://www.kismetwireless.net/code/${_pkgname}-${_realver}.tar.xz"
	"${_pkgname}-${_realver}.tar.xz.sig")
sha512sums=('cfbfb2cefd8df4a4fd09333eb6b0becd56cd7c3a1804d555d28b1d55379186e51804334560531d05e760d31e446c4b89d32ce2bd2c0705473f67f04611c0434e'
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
    make DESTDIR="${pkgdir}" install

    # Install plugins
    make plugins-install DESTDIR="${pkgdir}"

    #install the PTR plugin
    cd restricted-plugin-ptw/
    KIS_SRC_DIR="${srcdir}/${_pkgname}-${_realver}" KIS_DEST_DIR="${pkgdir}" DESTDIR="${KIS_DEST_DIR}" make install || return 1
    cd ..
    cd restricted-plugin-autowep/
    KIS_SRC_DIR="${srcdir}/${_pkgname}-${_realver}" KIS_DEST_DIR="${pkgdir}" DESTDIR="${KIS_DEST_DIR}" make install || return 1
    cd ..
    # the README is very comprehensive, a good idea to include it
    install -D -m 644 "${srcdir}/kismet-${_realver}/README" "${pkgdir}/usr/share/kismet/README"

    # Our own suid-install, first half (see kismet.install)
    install -o "root" -g "root" -m 4550 kismet_capture "${pkgdir}/usr/bin/"
}
