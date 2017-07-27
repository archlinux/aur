# Maintainer: Javier Torres <javitonino [at] gmail [dot] com>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=pykolab
pkgver=0.8.7
pkgrel=1
pkgdesc='Kolab Python Utilities'
arch=('any')
license=('GPL3')
makedepends=('intltool')
depends=('python2' 'python2-nose' 'python2-ldap' 'python2-augeas' 'python2-cheetah' 'python2-sqlalchemy' 'python2-kolabformat' 'python2-icalendar' 'python2-mysql-connector')
url='http://kolab.org'
install=pykolab.install
backup=('etc/kolab/kolab.conf')
source=("https://mirror.kolabenterprise.com/pub/releases/${pkgname}-${pkgver}.tar.gz"
        "https://mirror.kolabenterprise.com/pub/releases/kolab-schema-3.3.tar.gz"
        "systemd-services.patch"
        "setup-script.patch"
        "templates.patch"
        "kolabd.tmpfiles")
optdepends=('cyrus-imapd-ldap: Only supported IMAP backend so far'
            'postfix: Mail Transfer Agent'
            'amavisd-new: Mail scanning'
            'perl-ldap: Amavis integration'
            'spamassassin: Spam detection'
            'clamav: Virus detection'
            '389-ds-base: Prefered LDAP server'
            'mariadb: Mysql server backend'
            'roundcubemail: Default webclient used by Kolab'
            'roundcubemail-plugins-kolab: Roundcube plugin for Kolab integration'
            'roundcubemail-skin-chameleon: Recommended skin for Roundcube'
            'chwala: File Manager'
            'irony: Cal/Card/GroupDAV support'
            'kolab-freebusy: Free/Busy API'
            'kolab-syncroton: ActiveSync support'
            'kolab-webadmin: Administration tool')

sha256sums=('f3bf46043bf795f46e5ed2bcb99ca154bcea961073fbb14d853cd0365332792a'
            'c5d2129f944c4c15ed7b23adc2d6475e1247205b9c95b1f8ce65a820e04ec103'
            'a515f068b5fe12c858f327fa0558087e61b4d39070d67dfba9a2b6d19a83c2c6'
            '87fc4b8d1dcaaa23d5416ceecadeb85cba4f6668becf97092cdf84b62bb779f4'
            '867e196e0800118eae400c0d56af7562a9e988ef9df27c0f9789b85f3c109827'
            '4bbb72695b20b7a4c1c0348a93c62f048f0eef9f3bc7135fa2720c62e98e4634')


prepare(){
    cd "$srcdir/${pkgname}-${pkgver}"
    find . -name "*.py" -exec sed -i "s|usr/bin/python|usr/bin/python2|" {} \;
    patch -p1 < "${srcdir}/systemd-services.patch"
    patch -p1 < "${srcdir}/setup-script.patch"
    patch -p1 < "${srcdir}/templates.patch"
}

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    autoreconf -vi
    PYTHON=python2 ./configure \
            --prefix=/usr \
            --sbindir=/usr/bin \
            --libexecdir=/usr/lib \
            --sysconfdir=/etc \
            --localstatedir=/var
    make
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR=$pkgdir/ install

    install -D "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "kolabd/kolabd.systemd" "${pkgdir}/usr/lib/systemd/system/kolabd.service"
    install -Dm644 "kolabd/kolabd.tmpfiles.d.conf" "${pkgdir}/usr/lib/tmpfiles.d/kolabd.conf"
    install -Dm644 "kolabd/kolabd.sysconfig" "${pkgdir}/etc/conf.d/kolabd.conf"

    install -Dm644 "saslauthd/kolab-saslauthd.systemd" "${pkgdir}/usr/lib/systemd/system/kolab-saslauthd.service"
    install -Dm644 "saslauthd/kolab-saslauthd.sysconfig" "${pkgdir}/etc/conf.d/kolab-saslauthd.conf"

    install -Dm644 "wallace/wallace.systemd" "${pkgdir}/usr/lib/systemd/system/wallace.service"
    install -Dm644 "wallace/wallace.tmpfiles.d.conf" "${pkgdir}/usr/lib/tmpfiles.d/wallace.conf"
    install -Dm644 "wallace/wallace.sysconfig" "${pkgdir}/etc/conf.d/wallace.conf"

    install -Dm644 doc/kolab.1 "$pkgdir/usr/share/doc/kolab/kolab.1"
    
    install -Dm0644 "${srcdir}/kolabd.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/kolabd.conf"

    cp ${srcdir}/kolab-schema-3.3/* "${pkgdir}/usr/share/doc/kolab/"
    
    rm ${pkgdir}/var/run -r
}
