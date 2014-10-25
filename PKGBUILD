pkgname=amavisd-new
pkgver=2.10.0
pkgrel=1
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
    'perl-convert-uulib>=1.4-5'
    'perl-mime-base64'
    'perl-mime-tools'
    'perl-mailtools>=1.58'
    'perl-net-libidn'
    'perl-net-server>=0.88'
    'perl-digest-md5>=2.22'
    'perl-io-stringy'
    'perl-time-hires>=1.49'
    'perl-unix-syslog>=1.1-4'
    'perl-mail-dkim>=0.31'
    'perl-berkeleydb>=0.42'
	 'bzip2'
	 'gzip'
)
optdepends=(
	 'arc:        Decoder for: .arc'
	 'arj:        Decoder for: .arj .exe'
	 'p7zip:      Decoder for: .7z'
	 'unrar:      Decoder for: .rar'
	 'rpmextract: Decoder for: .rpm'
)
backup=('etc/amavisd/amavisd.conf' 'etc/amavisd/amavisd-custom.conf')
source=("http://www.ijs.si/software/amavisd/amavisd-new-${pkgver}.tar.xz"
        "service"
        "tmpfiles")
sha256sums=('21038111a7b3d97a124c49ea5d686cf68f39997f8d8907c8b76bb6a93ebfe2cc'
            'b803ac76501a68775395c7f80aed5633b98ea7a851f926e0edb169e4c2e38b24'
            'a7ea2c73f2dbdd7d79bcb06aa950410f8e214afa01629a0717e0a81489441e6d')
install=install

prepare() {
    sed -i \
        -e "s/# @bypass_virus_checks_maps = (1)/@bypass_virus_checks_maps = (1)/g" \
        -e "s/# @bypass_spam_checks_maps  = (1)/@bypass_spam_checks_maps = (1)/g" \
        -e "s/\\\$daemon_user  = 'vscan'/\\\$daemon_user  = 'amavis'/g" \
        -e "s/\\\$daemon_group = 'vscan'/\\\$daemon_group = 'amavis'/g" \
        -e "sX# \\\$MYHOME = '/var/amavis'X\\\$MYHOME = '/var/spool/amavis'Xg" \
        -e "sX\\\$QUARANTINEDIR = '/var/virusmails'X\\\$QUARANTINEDIR = \"\\\$MYHOME/virus\"Xg" \
        -e "sX# \\\$pid_file  = \"\\\$MYHOME/var/amavisd.pid\"X\\\$pid_file = \"/run/amavis/pid\"Xg" \
        -e "sX# \\\$lock_file = \"\\\$MYHOME/var/amavisd.lock\"X\\\$lock_file = \"/run/amavis/lock\"Xg" \
        -e "sX\\\$unix_socketname = \"\\\$MYHOME/amavisd.sock\"X\\\$unix_socketname = \"/run/amavis/sock\"Xg" \
        ${srcdir}/amavisd-new-${pkgver}/amavisd.conf
}

package() {
    cd ${srcdir}/amavisd-new-${pkgver}
    install -D -m644 ${srcdir}/service         ${pkgdir}/usr/lib/systemd/system/amavisd.service
    install -D -m644 ${srcdir}/tmpfiles        ${pkgdir}/usr/lib/tmpfiles.d/amavisd.conf
    install -D -m755 JpegTester.pm             ${pkgdir}/usr/share/perl5/vendor_perl/JpegTester.pm
    install -D -m644 LDAP.ldif                 ${pkgdir}/etc/openldap/schema/amavisd-new.ldif
    install -D -m644 LDAP.schema               ${pkgdir}/etc/openldap/schema/amavisd-new.schema
	 install -D -m750 -o 333 -g 333 -d          ${pkgdir}/var/spool/amavis/{,db,tmp,var,virus}

	 mkdir -p \
		  ${pkgdir}/etc/amavisd \
		  ${pkgdir}/usr/share/doc/amavis \
		  ${pkgdir}/usr/bin

    install -D -m644 -t ${pkgdir}/etc/amavisd             amavisd{.conf,-custom.conf,.conf-default}
    install -D -m644 -t ${pkgdir}/usr/share/doc/amavis    amavisd-new-{qmqpqq,courier}.patch
    install -D -m755 -t ${pkgdir}/usr/bin p0f-analyzer.pl amavisd{,-{agent,nanny,release,signer,snmp-subagent{,-zmq}}}
}
