# Maintainer: Amish <contact at via dot aur>
# Contributor: Thomas Berryhill <tb01110100@gmail.com>
# Contributor: Vlad M. <vlad@arhclinux.net>
# Contributor: chrisl echo archlinux@c2h0r1i2s4t5o6p7h8e9r-l3u4n1a.com|sed 's/[0-9]//g'
# Contributor: mazieres
# Contributor: doze_worm <shuimao@gmail.com> the original port.

pkgname=sendmail
pkgver=8.15.2
pkgrel=9
pkgdesc="A general purpose internetwork email routing MTA"
url="http://www.sendmail.org"
arch=('x86_64')
license=('custom:sendmail')
provides=('sendmail=8.15' 'smtp-server' 'smtp-forwarder')
conflicts=('msmtp-mta' 'postfix' 'exim' 'opensmtpd')
backup=('etc/conf.d/sendmail'
        'etc/mail/aliases'
        'etc/mail/sendmail.cf'
        'etc/sasl2/Sendmail.conf')
source=("https://ftp.sendmail.org/${pkgname}.${pkgver}.tar.gz"
        'site.config.m4'
        'sendmail-8.14.8-sasl2-in-etc.patch'
        'sendmail-8.15.2-smtp-session-reuse-fix.patch'
        'sendmail-8.15.2-openssl-1.1.0-fix.patch'
        'sendmail-8.15.2-openssl-1.1.0-ecdhe-fix.patch'
        'sendmail-8.15.2-gethostbyname2.patch'
        'sendmail-8.15.2-fix-covscan-issues.patch'
        'sendmail.conf'
        'sasl2.conf'
        'sendmail.sysusers'
        'sendmail.tmpfiles'
        'sendmail.service'
        'sm-client.service')
depends=('db' 'cyrus-sasl')
sha256sums=('24f94b5fd76705f15897a78932a5f2439a32b1a2fdc35769bb1a5f5d9b4db439'
            '01dc50a378f134e9e3a91f98a5a002a8fa6a0c69b32ceddf6fc29b40e0fb8be9'
            '03169f8983d200adf2422677bd4adce3b5887f33724778f16d7f58506eac0e05'
            'bc5a0de6c5434d8d46467f93d07b2bb5c7acd62f9dbce2490e0005d21b673250'
            '9991dd85428778cec0c2030bf49e6ddf6d3db6026c651f858d72891973537b0e'
            '746d8ae8dea54cb2599c02181c2ea28ab15b26ba5e1e3b0f9cfe907a0e7a1d22'
            '656c76d42281afbb43fa628e03c4d725e94e6f34a16802427d3314e504086033'
            '11e9dfe0881f9b9077cd538faf8eeb84fdbfe8d0b190582e753936f6548558dd'
            '39730f2be66bb1f1e6bc7fff61911db632ecf4b891d348df525abe2020274580'
            '9b4d2d141191f6c9a18538f7acf65243cceb26359f88b64c92c1c4e8407398f0'
            '95531a87d42e30742ca71f7d7197403eb9d703a407a50c9fda1f909ed21e1010'
            '3469c3c503ef24ccaedeb69b35787ef3745852cf9dc78540f5ec4195d2b817d7'
            'd18c2c716eb94cb22082a7e4693e635222d2b5c7daa2ecc80025179cfd438b3d'
            'c934a46aabe61526687f46d34aa0406d886d982aa10a57980a59464e24538d95')

prepare() {
    # patches picked from Fedora
    cd "${srcdir}/${pkgname}-${pkgver}"
    patch -p1 < "${srcdir}"/sendmail-8.14.8-sasl2-in-etc.patch
    patch -p1 < "${srcdir}"/sendmail-8.15.2-smtp-session-reuse-fix.patch
    patch -p1 < "${srcdir}"/sendmail-8.15.2-openssl-1.1.0-fix.patch
    patch -p1 < "${srcdir}"/sendmail-8.15.2-openssl-1.1.0-ecdhe-fix.patch
    patch -p1 < "${srcdir}"/sendmail-8.15.2-gethostbyname2.patch
    patch -p1 < "${srcdir}"/sendmail-8.15.2-fix-covscan-issues.patch
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
