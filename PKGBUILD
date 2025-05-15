# Maintainer: Amish <contact at via dot aur>
# Contributor: Thomas Berryhill <tb01110100@gmail.com>
# Contributor: Vlad M. <vlad@arhclinux.net>
# Contributor: chrisl echo archlinux@c2h0r1i2s4t5o6p7h8e9r-l3u4n1a.com|sed 's/[0-9]//g'
# Contributor: mazieres
# Contributor: doze_worm <shuimao@gmail.com> the original port.

pkgname=sendmail
pkgver=8.18.1
pkgrel=4
pkgdesc="A general purpose internetwork email routing MTA"
url="http://www.sendmail.org"
arch=('x86_64' 'aarch64')
license=('Sendmail-8.23')
_pkgversplit=( ${pkgver//./ } )
provides=("sendmail=${_pkgversplit[0]}.${_pkgversplit[1]}" 'smtp-server' 'smtp-forwarder')
conflicts=('msmtp-mta' 'postfix' 'exim' 'opensmtpd')
backup=('etc/conf.d/sendmail'
        'etc/mail/aliases'
        'etc/mail/sendmail.cf'
        'etc/sasl2/Sendmail.conf')
source=("https://ftp.sendmail.org/${pkgname}.${pkgver}.tar.gz"{,.sig}
        'site.config.m4'
        'sendmail-8.17.2-sasl2-in-etc.patch'
        'sendmail-8.18.1-gcc-15-fix.patch'
        'Patch02-Allow-setting-local-CFLAGS-devtools-M4-UNIX-defines.patch'
        'sendmail.conf'
        'sasl2.conf'
        'sendmail.sysusers'
        'sendmail.tmpfiles'
        'sendmail.service'
        'sm-client.service')
depends=('db' 'cyrus-sasl')
# Signing keys sourced from upstream. Current version is signed with the 2024 keys.
# https://www.proofpoint.com/us/products/email-protection/open-source-email-solution
validpgpkeys=('8AB063D7A4C5939DA9C01E38C4065A87C71F6844')
sha256sums=('cbf1f309c38e4806f7cf3ead24260f17d1fe8fb63256d13edb3cdd1a098f0770'
            'SKIP'
            '83e393ca3bf8d4466870baf49a30ca393eca367edb1a9c2a7f77ec013ecccbf0'
            '5a92a8a07d6ecb437e41e136960f0b25a91195476c7a550c0098937e8644dfc3'
            '9f03b6d82e2477f8c80101740a15f82d5015c33db2bf2e3c53faed0c529262df'
            'c408ace05d7dc7089378a64b787d81cf075756dcb6063169f7e0942a91c48d5a'
            '39730f2be66bb1f1e6bc7fff61911db632ecf4b891d348df525abe2020274580'
            '9b4d2d141191f6c9a18538f7acf65243cceb26359f88b64c92c1c4e8407398f0'
            '95531a87d42e30742ca71f7d7197403eb9d703a407a50c9fda1f909ed21e1010'
            '3469c3c503ef24ccaedeb69b35787ef3745852cf9dc78540f5ec4195d2b817d7'
            'd18c2c716eb94cb22082a7e4693e635222d2b5c7daa2ecc80025179cfd438b3d'
            'c934a46aabe61526687f46d34aa0406d886d982aa10a57980a59464e24538d95')

prepare() {
    # patches picked from Fedora
    cd "${pkgname}-${pkgver}"
    patch -p1 -i ../sendmail-8.17.2-sasl2-in-etc.patch
    patch -p1 -i ../sendmail-8.18.1-gcc-15-fix.patch

    # Patch from libmilter package
    # Prevent circular reference to CFLAGS when local CFLAGS are set via 'confOPTIMIZE' in site.config.m4
    patch -p1 -i ../Patch02-Allow-setting-local-CFLAGS-devtools-M4-UNIX-defines.patch

    sed -i -e 's/CFGRP=bin/CFGRP=root/g' cf/cf/Makefile
    install -m644 -t devtools/Site "${srcdir}"/site.config.m4
}

build() {
    cd "${pkgname}-${pkgver}"
    ./Build
    GROFF_NO_SGR=1 make -C doc/op op.txt op.ps
}

package() {
    cd "${pkgname}-${pkgver}"
    install -dm755 "${pkgdir}"/usr/{bin,share/{doc/sendmail,man/man{1,5,8}}}
    ./Build DESTDIR="${pkgdir}" install
    cd mail.local; ./Build DESTDIR="${pkgdir}" force-install
    cd ../rmail; ./Build DESTDIR="${pkgdir}" force-install

    cd ..
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
