# Maintainer: arjan5 <aur@anymore.nl>

pkgname=mailscanner
pkgver=5.1.1_1
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
source=(https://s3.amazonaws.com/msv5/release/MailScanner-${pkgver//_/-}.nix.tar.gz)
sha256sums=('d49ab24270fc047baabf6491110e61508feec9de56d4b372b35f318337180541')
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
