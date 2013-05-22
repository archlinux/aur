# Maintainer: Techlive Zheng <techlivezheng [at] gmail [dot] com>
# Contributor: Piotr Beling <qwak@stud.ics.p.lodz.pl>
# Contributor: Wael Nasreddine <wael@phoenixlinux.org>
# Contributor: Guillermo A. Amaral <me@guillermoamaral.com> (thewonka)

pkgname=amavisd-new
pkgver=2.6.4
pkgrel=4
pkgdesc="A high-performance interface between mailer (MTA) and content checkers. Written in Perl for maintainability."
arch=('any')
url="http://www.ijs.si/software/amavisd/"
license=('GPL')
depends=(
    'perl'
    'perl-archive-tar'
    'perl-archive-zip>=1.14'
    'perl-compress-zlib>=1.35'
    'perl-compress-raw-zlib>=2.0.17'
    'perl-convert-tnef'
    'perl-convert-uulib>=1.08'
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
optdepends=(
    'gzip:Decoder for .gz files or .z files.'
    'bzip2:Decoder for .bz2 fiels.'
    'arc:Alternative decoder for .arc files.'
    'nomarch:Alternative decoder for .arc files.'
    'lha:Decoder for .lha files or .exe files.'
    'p7zip:Decoder for .7z files.'
    'arj:Alternative decoder for .arj files or .exe files.'
    'unarj:Alternative decoder for .arj files or .exe files.'
    'rar:Alternative decoder for .rar files or .exe files.'
    'unrar:Alternative decoder for .rar files or .exe files.'
#    'zoo:MISSING:Alternative decoder for .zoo files.'
#    'unzoo:MISSING:Alternative decoder for .zoo files.'
#    'freeze:MISSING:Decoder for .f files.'
#    'ripole:MISSING:A small program/library designed to pull out attachments from OLE2 data files (ie, MS Office documents).'
    'lzop:Decoder for .lzo files.'
    'tnef:Decoder for .tnef files.'
    'pax:ALternative decoder for .tar files or .cpio files.'
    'cpio:Alternative decoder for .tar files or .cpio files.'
    'gcpio:Alternative decoder for .tar files or .cpio files.'
    'rpm2cpio:Decoder for .rpm files.'
    'cabextract:Decoder for .cab files.'
    'perl-dbi:Needed if using SQL lookups or SQL logging/quarantining.'
    'perl-ldap:Needed if using LDAP lookups.'
    'perl-authen-sasl:Authenticating on mail forwarding and on submitting DSN.'
#    'savi:The Sophos Anti-Virus Interface.'
#    'perl-savi>=0.30:Perl module interface to Sophos library.'
#    'clamav:Open source antivirus engine designed for detecting Trojans, viruses, malware and other malicious threats.'
#    'perl-mail-clamav:Perl module interface to ClamAV library.'
#    'spamassassin>=3.1: Perl-based spam filter using text analysis.'
#    'perl-mail-spamassassin:Perl-based spam filter using text analysis.'
#    'p0f:Passive OS fingerprinting tool.'
#    'bdb:Berkeley db libr. used via BerkeleyDB.'
#    'dspam:A scalable, open-source statistical anti-spam filter.'
#    'mailzu:Quarantine management web UI.'
#    'amavisd-milter:alternative sendmail milter helper program supporting the new AM.PDP protocol.'
)
backup=('etc/amavisd/amavisd.conf' 'etc/amavisd/amavisd-custom.conf')
changelog=Changelog
source=("http://www.ijs.si/software/amavisd/amavisd-new-${pkgver}.tar.gz" "amavisd" "amavisd.conf")
install=${pkgname}.install

build(){

    cd ${srcdir}/amavisd-new-${pkgver}

    # Disable anti-virus and anti-spam support by default,must be enable manually after install clamav or spamassassin.
    sed -i \
        -e "s/# @bypass_virus_checks_maps = (1)/@bypass_virus_checks_maps = (1)/g" \
        -e "s/# @bypass_spam_checks_maps  = (1)/@bypass_spam_checks_maps = (1)/g" \
        amavisd.conf

    # Change default amavsid daemon user.
    sed -i \
        -e "s/\\\$daemon_user  = 'vscan'/\\\$daemon_user  = 'amavis'/g" \
        -e "s/\\\$daemon_group = 'vscan'/\\\$daemon_group = 'amavis'/g" \
        amavisd.conf

    # Change default amavisd home directory.
    sed -i \
        -e "sX# \\\$MYHOME = '/var/amavis'X\\\$MYHOME = '/var/lib/amavis'Xg" \
        -e "sX\\\$QUARANTINEDIR = '/var/virusmails'X\\\$QUARANTINEDIR = '\\\$MYHOME/virus'Xg" \
        amavisd.conf

    # Change default location of amavisd pid and lock file.
    sed -i \
        -e "sX# \\\$pid_file  = \"\\\$MYHOME/var/amavisd.pid\"X\\\$pid_file = \"/var/run/amavisd/amavisd.pid\"Xg" \
        -e "sX# \\\$lock_file = \"\\\$MYHOME/var/amavisd.lock\"X\\\$lock_file = \"/var/run/amavisd/amavisd.lock\"Xg" \
        amavisd.conf

    # Change default location of amavisd socket.
    sed -i \
        -e "sX\\\$unix_socketname = \"\\\$MYHOME/amavisd.sock\"X\\\$unix_socketname = \"/var/run/amavisd/amavisd.sock\"Xg" \
        amavisd.conf

}

package(){

    cd ${srcdir}/amavisd-new-${pkgver}

    install -D -m755 ${srcdir}/amavisd         ${pkgdir}/etc/rc.d/amavisd                                    || return 1
    install -D -m755 ${srcdir}/amavisd.conf    ${pkgdir}/etc/conf.d/amavisd.conf                             || return 1

    install -D -m644 amavisd.conf              ${pkgdir}/etc/amavisd/amavisd.conf                            || return 1
    install -D -m644 amavisd-custom.conf       ${pkgdir}/etc/amavisd/amavisd-custom.conf                     || return 1
    install -D -m644 amavisd.conf-sample       ${pkgdir}/etc/amavisd/amavisd.conf-sample                     || return 1
    install -D -m644 amavisd.conf-default      ${pkgdir}/etc/amavisd/amavisd.conf-default                    || return 1

    install -D -m755 amavisd                   ${pkgdir}/usr/sbin/amavisd                                    || return 1
    install -D -m755 amavisd-agent             ${pkgdir}/usr/sbin/amavisd-agent                              || return 1
    install -D -m755 amavisd-nanny             ${pkgdir}/usr/sbin/amavisd-nanny                              || return 1
    install -D -m755 amavisd-release           ${pkgdir}/usr/sbin/amavisd-release                            || return 1
    install -D -m755 amavisd-snmp-subagent     ${pkgdir}/usr/sbin/amavisd-snmp-subagent                      || return 1

    install -D -m755 p0f-analyzer.pl           ${pkgdir}/usr/sbin/p0f-analyzer.pl                            || return 1

    install -D -m755 JpegTester.pm             ${pkgdir}/usr/share/perl5/vendor_perl/JpegTester.pm           || return 1

    install -D -m755 TODO                      ${pkgdir}/usr/share/doc/amavisd-new/TODO                      || return 1
    install -D -m755 LICENSE                   ${pkgdir}/usr/share/doc/amavisd-new/LICENSE                   || return 1
    install -D -m755 LDAP.ldif                 ${pkgdir}/usr/share/doc/amavisd-new/LDAP.ldif                 || return 1
    install -D -m755 LDAP.schema               ${pkgdir}/usr/share/doc/amavisd-new/LDAP.schema               || return 1
    install -D -m755 RELEASE_NOTES             ${pkgdir}/usr/share/doc/amavisd-new/RELEASE_NOTES             || return 1
    install -D -m755 AMAVIS-MIB.txt            ${pkgdir}/usr/share/doc/amavisd-new/AMAVIS-MIB.txt            || return 1
    install -D -m755 AAAREADME.first           ${pkgdir}/usr/share/doc/amavisd-new/README.first              || return 1
    install -D -m755 amavisd-new-qmqpqq.patch  ${pkgdir}/usr/share/doc/amavisd-new/amavisd-new-qmqpqq.patch  || return 1
    install -D -m755 amavisd-new-courier.patch ${pkgdir}/usr/share/doc/amavisd-new/amavisd-new-courier.patch || return 1

    find "README_FILES"  -type f -exec install -D -m644 {,${pkgdir}/usr/share/doc/amavisd-new/}{} \;         || return 1
    find "test-messages" -type f -exec install -D -m644 {,${pkgdir}/usr/share/doc/amavisd-new/}{} \;         || return 1

}
md5sums=('03d31657f14cd64c1cb38786214234b4'
         '3ec6da7f0a659d1a017bd73b0c7c3aa3'
         '756fe29fece79d135850e1cd8c6660a5')
