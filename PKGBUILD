# Maintainer: Amish <contact at via dot aur>
# Contributor: Thomas Berryhill <tb01110100@gmail.com>
# Contributor: Vlad M. <vlad@arhclinux.net>
# Contributor: chrisl echo archlinux@c2h0r1i2s4t5o6p7h8e9r-l3u4n1a.com|sed 's/[0-9]//g'
# Contributor: mazieres
# Contributor: doze_worm <shuimao@gmail.com> the original port.

pkgname="sendmail"
pkgver=8.15.2
pkgrel=4
pkgdesc="The sendmail MTA"
url="http://www.sendmail.org"
arch=('x86_64')
license=('Sendmail License')
provides=('sendmail=8.15')
conflicts=('msmtp-mta' 'postfix' 'exim' 'opensmtpd')
backup=('etc/conf.d/sendmail'
        'etc/mail/aliases'
        'etc/mail/sendmail.cf')
source=("https://ftp.sendmail.org/${pkgname}.${pkgver}.tar.gz"
        'site.config.m4'
        'sendmail-8.15.2-smtp-session-reuse-fix.patch'
        'sendmail-8.15.2-openssl-1.1.0-fix.patch'
        'sendmail-8.15.2-openssl-1.1.0-ecdhe-fix.patch'
        'sendmail.conf'
        'sendmail.sysusers'
        'sendmail.tmpfiles'
        'sendmail.service'
        'sm-client.service')
depends=('db' 'cyrus-sasl')
sha256sums=('24f94b5fd76705f15897a78932a5f2439a32b1a2fdc35769bb1a5f5d9b4db439'
            '01c281630074be308139295836d38faee3d49656b8271df1d3f42e8506b3d751'
            'bc5a0de6c5434d8d46467f93d07b2bb5c7acd62f9dbce2490e0005d21b673250'
            '9991dd85428778cec0c2030bf49e6ddf6d3db6026c651f858d72891973537b0e'
            '746d8ae8dea54cb2599c02181c2ea28ab15b26ba5e1e3b0f9cfe907a0e7a1d22'
            '39730f2be66bb1f1e6bc7fff61911db632ecf4b891d348df525abe2020274580'
            '40ee2d98af98e6a094c42934f10aa7cb0d62fa38184e447a65b45f317e741b5e'
            '4b5168dea0196a9a03e5a0b54a8354cec7563973705db35a22f451bcedcd388f'
            '380edeb289dfdfc5b0d4ea38df3a0fd35e6f83eeee76254ec7b3506eadfb674f'
            'ecbd0a27e868d73d87fcfec292c19ea9479d0a8e9783788596d9add5e012218f')

prepare() {
    # patches picked from Fedora
    cd "${srcdir}/${pkgname}-${pkgver}"
    patch -p1 < "${srcdir}"/sendmail-8.15.2-smtp-session-reuse-fix.patch
    patch -p1 < "${srcdir}"/sendmail-8.15.2-openssl-1.1.0-fix.patch
    patch -p1 < "${srcdir}"/sendmail-8.15.2-openssl-1.1.0-ecdhe-fix.patch
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
    rmdir "${pkgdir}"/{var/spool/clientmqueue,var/spool,var}
    install -Dm644 -t "${pkgdir}"/etc/mail sendmail/aliases
    install -Dm644 cf/cf/generic-linux.cf "${pkgdir}"/etc/mail/sendmail.cf
    install -Dm644 -t "${pkgdir}"/usr/share/doc/sendmail doc/op/op.{ps,txt}
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE

    cd "${srcdir}"
    install -Dm644 sendmail.conf "${pkgdir}"/etc/conf.d/sendmail
    install -Dm644 -t "${pkgdir}"/usr/lib/systemd/system {sendmail,sm-client}.service
    install -Dm644 sendmail.sysusers "${pkgdir}"/usr/lib/sysusers.d/sendmail.conf
    install -Dm644 sendmail.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/sendmail.conf
}
