# Maintainer: Amish <contact at via dot aur>
# Contributor: Thomas Berryhill <tb01110100@gmail.com>
# Contributor: Vlad M. <vlad@arhclinux.net>
# Contributor: chrisl echo archlinux@c2h0r1i2s4t5o6p7h8e9r-l3u4n1a.com|sed 's/[0-9]//g'
# Contributor: mazieres
# Contributor: doze_worm <shuimao@gmail.com> the original port.

pkgname=sendmail
pkgver=8.17.1
pkgrel=4
pkgdesc="A general purpose internetwork email routing MTA"
url="http://www.sendmail.org"
arch=('x86_64')
license=('custom:sendmail')
_pkgversplit=( ${pkgver//./ } )
provides=("sendmail=${_pkgversplit[0]}.${_pkgversplit[1]}" 'smtp-server' 'smtp-forwarder')
conflicts=('msmtp-mta' 'postfix' 'exim' 'opensmtpd')
backup=('etc/conf.d/sendmail'
        'etc/mail/aliases'
        'etc/mail/sendmail.cf'
        'etc/sasl2/Sendmail.conf')
source=("https://ftp.sendmail.org/${pkgname}.${pkgver}.tar.gz"
        'site.config.m4'
        'sendmail-8.17.1-sasl2-in-etc.patch'
        'sendmail-8.17.1-cyrus-sasl-2.1.28-fix.patch'
        'sendmail.conf'
        'sasl2.conf'
        'sendmail.sysusers'
        'sendmail.tmpfiles'
        'sendmail.service'
        'sm-client.service')
depends=('db' 'cyrus-sasl')
sha256sums=('04bc76b6c886e6d111be7fd8daa32b8ce00128a288b6b52e067bc29f3854a6e6'
            'c71683c251630352c7328dc4e842a6622734310795616333667d1c4d5de38106'
            '5817c00908ddd1512e4edc48e42646a728f0940271781272372cb11b7be9d039'
            'b59224af82ca5eba3aca14da7be6cc3314b05cf62068a17a2ec7ae5855accead'
            '39730f2be66bb1f1e6bc7fff61911db632ecf4b891d348df525abe2020274580'
            '9b4d2d141191f6c9a18538f7acf65243cceb26359f88b64c92c1c4e8407398f0'
            '95531a87d42e30742ca71f7d7197403eb9d703a407a50c9fda1f909ed21e1010'
            '3469c3c503ef24ccaedeb69b35787ef3745852cf9dc78540f5ec4195d2b817d7'
            'd18c2c716eb94cb22082a7e4693e635222d2b5c7daa2ecc80025179cfd438b3d'
            'c934a46aabe61526687f46d34aa0406d886d982aa10a57980a59464e24538d95')

prepare() {
    # patches picked from Fedora
    cd "${srcdir}/${pkgname}-${pkgver}"
    patch -p1 < "${srcdir}"/sendmail-8.17.1-sasl2-in-etc.patch
    patch -p1 < "${srcdir}"/sendmail-8.17.1-cyrus-sasl-2.1.28-fix.patch
    sed -i -e 's/CFGRP=bin/CFGRP=root/g' cf/cf/Makefile
    install -m644 -t devtools/Site "${srcdir}"/site.config.m4
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./Build
    GROFF_NO_SGR=1 make -C doc/op op.txt op.ps
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -dm755 "${pkgdir}"/usr/{bin,share/{doc/sendmail,man/man{1,5,8}}}
    make install DESTDIR="${pkgdir}"
    make -C mail.local force-install DESTDIR="${pkgdir}"
    make -C rmail force-install DESTDIR="${pkgdir}"

    cp -rp cf "${pkgdir}"/usr/share/sendmail-cf
    rm ${pkgdir}/etc/mail/statistics
    rmdir "${pkgdir}"/{var/spool/clientmqueue,var/spool,var}
    install -Dm644 -t "${pkgdir}"/etc/mail sendmail/aliases
    install -Dm644 cf/cf/generic-linux.cf "${pkgdir}"/etc/mail/sendmail.cf
    install -Dm644 -t "${pkgdir}"/usr/share/doc/sendmail doc/op/op.{ps,txt}
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE

    cd "${srcdir}"
    install -Dm644 sendmail.conf "${pkgdir}"/etc/conf.d/sendmail
    install -Dm644 sasl2.conf "${pkgdir}"/etc/sasl2/Sendmail.conf
    install -Dm644 -t "${pkgdir}"/usr/lib/systemd/system {sendmail,sm-client}.service
    install -Dm644 sendmail.sysusers "${pkgdir}"/usr/lib/sysusers.d/sendmail.conf
    install -Dm644 sendmail.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/sendmail.conf
}
