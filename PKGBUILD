# Maintainer: drcrimzon <drcrimzon@cmstactical.net>
# Contributor: arjan5 <aur@anymore.nl>

pkgname=mailscanner
pkgver=5.4.4_1
pkgrel=1
pkgdesc="Mail filter for spam, viruses, phishing, and other malicious content"
arch=("x86_64" "i686")
url=https://mailscanner.info/
license=('GLP2')
depends=(
  perl-archive-zip
  perl-convert-binhex
  perl-convert-tnef
  perl-dbd-sqlite
  perl-dbi
  perl-digest-hmac
  perl-digest-sha1
  perl-encode-detect
  perl-filesys-df
  perl-inline-c
  perl-io-stringy
  perl-html-parser
  perl-html-tagset
  perl-html-tokeparser-simple
  perl-ip-country
  perl-mailtools
  perl-mail-imapclient
  perl-mime-tools
  perl-net-cidr
  perl-net-dns
  perl-net-dns-resolver-programmable
  perl-net-ip
  perl-ole-storage-lite
  perl-test-pod
  perl-sys-hostname-long
  perl-sys-sigaction
  spamassassin
)
optdepends=(
  perl-data-dump
  perl-inline
  perl-module-build
  perl-test-manifest
  clamav
)
backup=('etc/MailScanner/MailScanner.conf'
  'etc/MailScanner/archives.filename.rules.conf'
  'etc/MailScanner/archives.filetype.rules.conf'
  'etc/MailScanner/country.domains.conf'
  'etc/MailScanner/defaults'
  'etc/MailScanner/filename.rules.conf'
  'etc/MailScanner/filetype.rules.conf'
  'etc/MailScanner/phishing.bad.sites.conf'
  'etc/MailScanner/phishing.safe.sites.conf'
  'etc/MailScanner/spam.lists.conf'
  'etc/MailScanner/spamassassin.conf'
  'etc/MailScanner/virus.scanners.conf'
  'etc/MailScanner/mcp/mcp.spamassassin.conf'
  'etc/MailScanner/rules/bounce.rules'
  'etc/MailScanner/rules/external.message.rules'
  'etc/MailScanner/rules/max.message.size.rules'
  'etc/MailScanner/rules/spam.whitelist.rules')
source=(https://github.com/MailScanner/v5/releases/download/${pkgver//_/-}/MailScanner-${pkgver//_/-}.nix.tar.gz)
sha256sums=('15e34631ee7030694a537f56ac0e8152cb41a5a53135b12f696cd34d3940d667')
_srcname=MailScanner-${pkgver//_[0-9]*/}

prepare() {
    cd "$srcdir/$_srcname/"
    sed -i 's#/usr/bin/perldoc#/usr/bin/core_perl/perldoc#g' usr/sbin/ms-perl-check
    sed -i 's#^\tclear$##' usr/sbin/ms-perl-check
}

package() {
    cd "$srcdir/$_srcname/"

    mkdir -p "${pkgdir}/etc/"
    cp -dr --no-preserve=ownership etc/MailScanner "${pkgdir}/etc/MailScanner"
    for file in `ls usr/sbin/`; do
        install -Dm755 usr/sbin/$file "${pkgdir}/usr/bin/$file"
    done
    mkdir -p "${pkgdir}/usr/lib/"
    cp -dr --no-preserve=ownership usr/lib/MailScanner "${pkgdir}/usr/lib/MailScanner"
    mkdir -p "${pkgdir}/usr/share/"
    cp -dr --no-preserve=ownership usr/share/MailScanner "${pkgdir}/usr/share/MailScanner"

    ln -s /usr/share/MailScanner/perl/custom "${pkgdir}/etc/MailScanner/custom"
    ln -s /usr/share/MailScanner/reports "${pkgdir}/etc/MailScanner/reports"

    install -Dm644 usr/lib/MailScanner/systemd/ms-systemd "${pkgdir}/usr/lib/systemd/system/mailscanner.service"
}
