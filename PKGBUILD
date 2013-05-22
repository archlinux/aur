pkgname=amavisd-new
pkgver=2.8.0
pkgrel=7
pkgdesc="High-performance interface between mailer (MTA) and content checkers"
arch=('any')
url="http://www.ijs.si/software/amavisd/"
license=('GPL')
depends=(
    'perl>=5.8.2'
    'perl-archive-tar'
    'perl-archive-zip>=1.14'
    'perl-compress-zlib>=1.35'
    'perl-compress-raw-zlib>=2.0.17'
    'perl-convert-tnef'
    'perl-convert-uulib>=1.4'
    'perl-mime-base64'
    'perl-mime-tools'
    'perl-mailtools>=1.58'
    'perl-net-server>=0.88'
    'perl-digest-md5>=2.22'
    'perl-io-stringy'
    'perl-time-hires>=1.49'
    'perl-unix-syslog'
    'perl-mail-dkim>=0.31'
    'perl-berkeleydb>=0.42'
)
backup=('etc/amavisd/amavisd.conf' 'etc/amavisd/amavisd-custom.conf')
source=("http://www.ijs.si/software/amavisd/amavisd-new-${pkgver}.tar.gz"
        "service"
        "tmpfiles")
md5sums=('9851ce19f0c8fcab36f254c4e0251618'
         '3d0c094230621dfa04922afb482e638c'
         '7114b97b5b2b0d8f98a0a3039e2ef8fe')
install=install

prepare() {
    sed -i \
        -e "s/# @bypass_virus_checks_maps = (1)/@bypass_virus_checks_maps = (1)/g" \
        -e "s/# @bypass_spam_checks_maps  = (1)/@bypass_spam_checks_maps = (1)/g" \
        -e "s/\\\$daemon_user  = 'vscan'/\\\$daemon_user  = 'amavis'/g" \
        -e "s/\\\$daemon_group = 'vscan'/\\\$daemon_group = 'amavis'/g" \
        -e "sX# \\\$MYHOME = '/var/amavis'X\\\$MYHOME = '/var/spool/amavis'Xg" \
        -e "sX\\\$QUARANTINEDIR = '/var/virusmails'X\\\$QUARANTINEDIR = '\\\$MYHOME/virus'Xg" \
        -e "sX# \\\$pid_file  = \"\\\$MYHOME/var/amavisd.pid\"X\\\$pid_file = \"/run/amavis/pid\"Xg" \
        -e "sX# \\\$lock_file = \"\\\$MYHOME/var/amavisd.lock\"X\\\$lock_file = \"/run/amavis/lock\"Xg" \
        -e "sX\\\$unix_socketname = \"\\\$MYHOME/amavisd.sock\"X\\\$unix_socketname = \"/run/amavis/sock\"Xg" \
        ${srcdir}/amavisd-new-${pkgver}/amavisd.conf
}

package() {
    cd ${srcdir}/amavisd-new-${pkgver}

    install -D -m755 ${srcdir}/service         ${pkgdir}/usr/lib/systemd/system/amavisd.service
    install -D -m755 ${srcdir}/tmpfiles        ${pkgdir}/usr/lib/tmpfiles.d/amavisd.conf

    install -D -m644 amavisd.conf              ${pkgdir}/etc/amavisd/amavisd.conf
    install -D -m644 amavisd-custom.conf       ${pkgdir}/etc/amavisd/amavisd-custom.conf
    install -D -m644 amavisd.conf-default      ${pkgdir}/etc/amavisd/amavisd.conf-default

    install -D -m755 amavisd                   ${pkgdir}/usr/bin/amavisd
    install -D -m755 amavisd-agent             ${pkgdir}/usr/bin/amavisd-agent
    install -D -m755 amavisd-nanny             ${pkgdir}/usr/bin/amavisd-nanny
    install -D -m755 amavisd-release           ${pkgdir}/usr/bin/amavisd-release
    install -D -m755 amavisd-signer            ${pkgdir}/usr/bin/amavisd-signer
    install -D -m755 amavisd-snmp-subagent     ${pkgdir}/usr/bin/amavisd-snmp-subagent
    install -D -m755 amavisd-snmp-subagent-zmq ${pkgdir}/usr/bin/amavisd-snmp-subagent-zmq
    install -D -m755 p0f-analyzer.pl           ${pkgdir}/usr/bin/p0f-analyzer.pl

    install -D -m755 JpegTester.pm             ${pkgdir}/usr/share/perl5/vendor_perl/JpegTester.pm

    install -D -m755 LDAP.ldif                 ${pkgdir}/etc/openldap/schema/amavisd-new.ldif
    install -D -m755 LDAP.schema               ${pkgdir}/etc/openldap/schema/amavisd-new.schema

    install -D -m755 amavisd-new-qmqpqq.patch  ${pkgdir}/usr/share/doc/amavisd-new/amavisd-new-qmqpqq.patch
    install -D -m755 amavisd-new-courier.patch ${pkgdir}/usr/share/doc/amavisd-new/amavisd-new-courier.patch

	 install -D -m750 -o 333 -g 333 -d          ${pkgdir}/var/spool/amavis/{,db,tmp,var,virus}

    find "test-messages" -type f -exec install -D -m644 {,${pkgdir}/usr/share/doc/amavisd-new/}{} \;
}
