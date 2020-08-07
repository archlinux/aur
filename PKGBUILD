# Maintainer: robertfoster
# Contributor: Andrew Siplas <andrew@asip.xyz>

pkgname=rtpproxy
pkgver=2.1.0
pkgrel=1
pkgdesc="High-performance software proxy for RTP streams / announcements"
url="http://www.rtpproxy.org/"
license=('BSD')
arch=('x86_64' 'i686')
depends=('libsndfile' 'libsystemd')
optdepends=('systemd: systemd support')
source=("https://github.com/sippy/rtpproxy/archive/v${pkgver}.tar.gz"
    "${pkgname}.service"
    "${pkgname}.sysconfig"
    "${pkgname}.sysuser.conf"
    "${pkgname}.tmpfiles.conf"
unix_socket.patch)
backup=('etc/default/rtpproxy')
install="${pkgname}.install"

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    patch -Np1 -i "${srcdir}/unix_socket.patch"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --enable-systemd
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
    install -D -m 0644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m 0644 "../${pkgname}.sysconfig" \
    "${pkgdir}/etc/default/${pkgname}"
    install -D -m 0644 "../${pkgname}.service" \
    "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -D -m 0644 "rpm/${pkgname}.socket" \
    "${pkgdir}/usr/lib/systemd/system/${pkgname}.socket"
    
    install -Dm755 $srcdir/$pkgname.sysuser.conf \
    $pkgdir/usr/lib/sysusers.d/$pkgname.conf
    
    install -D -m 0644 "../${pkgname}.tmpfiles.conf" \
    $pkgdir/usr/lib/tmpfiles.d/$pkgname.conf
}

md5sums=('dad6758f7c182cebc65e65707be2e82d'
         'eb1a8cfa80bb0ab75a90d6ff245c1d19'
         '34acec87cf20930cc8c22a38088bd15e'
         '47595ec359cb897e7e3a8ea029cf3527'
         'cea6323e52377b6ad870cf2ac8b002a6'
         '0beac238aa53f6d237a99886a126d6f5')
