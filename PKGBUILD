# Maintainer: robertfoster
# Contributor: Lukas Fleischer <archlinux at cryptocrack dot de>
# Contributor: Hugo Doria <hugo@archlinux.org>
# Contributor: Kessia 'even' Pinheiro <kessiapinheiro at gmail.com>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Gregor Ibic <gregor.ibic@intelicom.si>
# Contributor: Netboy3

pkgname=snort
pkgver=2.9.16
pkgrel=2
pkgdesc='A lightweight network intrusion detection system.'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64' 'arm')
url='http://www.snort.org'
license=('GPL')
depends=('dbus' 'libdaq' 'libdnet' 'libgcrypt' 'libgpg-error' 'libnghttp2' 'libnl' 'libpcap' 'luajit' 'lz4' 'openssl' 'pcre' 'xz' 'zlib')
makedepends=('libtirpc')
backup=('etc/snort/snort.conf'
    'etc/snort/threshold.conf'
    'etc/snort/reference.config'
    'etc/snort/classification.config'
'etc/snort/rules/emerging.conf')
options=('!makeflags' '!libtool')
install='snort.install'
source=("https://www.snort.org/downloads/snort/${pkgname}-${pkgver}.tar.gz"
    "http://rules.emergingthreats.net/open/${pkgname}-2.9.0/emerging.rules.tar.gz"
    'snort@.service'
    'snort-2.9.15.1-fno-common.patch'
)

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    patch -Np1 -i ../snort-2.9.15.1-fno-common.patch
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure --prefix=/usr \
    --sysconfdir=/etc/snort \
    --with-libpcap-includes=/usr/include/pcap \
    --with-daq-includes=/usr/include \
    --with-daq-libraries=/usr/lib/daq/ \
    --disable-static-daq \
    CPPFLAGS="$CPPFLAGS -I/usr/include/tirpc/"
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    
    make DESTDIR="${pkgdir}" install
    
    mkdir -p "${pkgdir}/"{etc/rc.d,etc/snort/rules}
    
    install -d -m755 "${pkgdir}/var/log/snort"
    install -D -m644 etc/{*.conf*,*.map} "${pkgdir}/etc/snort/"
    cd "${srcdir}/${pkgname}-${pkgver}"
    
    # init service file
    install -D -m644 ../snort@.service $pkgdir/usr/lib/systemd/system/snort@.service
    
    sed -i 's#/usr/local/lib/#/usr/lib/#' "${pkgdir}/etc/snort/snort.conf"
    
    # emerginthreats rules
    echo 'include $RULE_PATH/emerging.conf' >> "${pkgdir}/etc/snort/snort.conf"
    cp ${srcdir}/rules/* "${pkgdir}/etc/snort/rules"
}

md5sums=('1cec58babaea3420014d61a93e6e1545'
    'SKIP'
    'a847030a34396e6b2d1cacd272ad42da'
'101bc0617d1547b14359ad884ac70541')
