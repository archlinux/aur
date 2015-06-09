# Maintainer: Javier Torres <javitonino [at] gmail [dot] com>
# 
# Original cyrus-imapd package by:
# Contributor: John Lane <archlinux at jelmail dot com>
# Contributor: Fisher Duan <steamedfish@njuopen.com> Ryan Corder <ryanc@greengrey.org>

pkgname=cyrus-imapd-ldap
pkgver=2.5.1
pkgrel=1
pkgdesc='LDAP support (via ptloader) for Cyrus IMAP mail server'
arch=('i686' 'x86_64')
url='http://www.cyrusimap.org/'
license=('custom')
depends=('cyrus-imapd>=2.5' 'libldap')
source=("ftp://ftp.cyrusimap.org/cyrus-imapd/cyrus-imapd-${pkgver}.tar.gz")
sha256sums=('264284a75e5a2567f01b058befc302d2e3b53d8fb7dd4d9988e8310dce305ec9')

build() {
    cd "${srcdir}/cyrus-imapd-${pkgver}"

    CFLAGS=-fPIC ./configure \
        --prefix=/usr \
        --includedir=/usr/include/cyrus --mandir=/usr/share/man \
        --docdir=/usr/share/doc/cyrus \
        --datadir=/usr/share/cyrus --sysconfdir=/etc/cyrus \
        --localstatedir=/var/lib/cyrus \
        --sharedstatedir=/usr/share/cyrus \
        --enable-murder --enable-nntp --enable-replication \
        --enable-idled \
        --with-cyrus-user=cyrus --with-cyrus-group=mail \
        --with-pidfile=/var/run/cyrmaster.pid \
        --with-syslogfacility=MAIL \
        --with-cyrus-prefix=/usr/lib/cyrus \
        --without-libwrap \
        --with-ldap=/usr \
        --exec-prefix=/usr --libexecdir=/usr/sbin

    make
}

package() {
    cd "${srcdir}/cyrus-imapd-${pkgver}/ptclient"

    mkdir -p "${pkgdir}/usr/lib/cyrus/bin"
    install -Dm 755 ptdump "${pkgdir}/usr/lib/cyrus/bin"
    install -Dm 755 ptexpire "${pkgdir}/usr/lib/cyrus/bin"
    install -Dm 755 ptloader "${pkgdir}/usr/lib/cyrus/bin"

    install -Dm 644 "${srcdir}/cyrus-imapd-${pkgver}/COPYING" \
        "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
