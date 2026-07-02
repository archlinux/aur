# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Vladislav Minakov <v@minakov.pro>
# Contributor: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154,SC2164
# shellcheck shell=bash

pkgname="modsecurity-crs"
pkgver=4.28.0
pkgrel=1
pkgdesc="OWASP ModSecurity Core Rule Set"
url="https://github.com/coreruleset/coreruleset"
license=("Apache-2.0")
arch=("any")
depends=("libmodsecurity")
optdepends=("geoip-database: for coutry-based rules"
  "nginx: HTTP server"
  "angie: HTTP server"
  "apache: HTTP server"
  "python: rules-check.py"
  "python-msc-pyparser: rules-check.py"
  "bash: php-dictionary-creator.sh")
source=("coreruleset-$pkgver.tar.gz::https://github.com/coreruleset/coreruleset/archive/refs/tags/v$pkgver.tar.gz"
  "https://github.com/coreruleset/coreruleset/releases/download/v$pkgver/coreruleset-$pkgver.tar.gz.asc"
  "https://raw.githubusercontent.com/owasp-modsecurity/ModSecurity/v3/master/modsecurity.conf-recommended"
  "https://raw.githubusercontent.com/owasp-modsecurity/ModSecurity/v3/master/unicode.mapping")
b2sums=('60f8091ae17c310a1d1ef4aee7e5cb8688166f1908b84c7af14bcf5ff177bd6479fe494b7c9d2047d4426ea3eae1c25ec0e1ef877299be4422a90c7ec71b9d07'
        'SKIP'
        '378937cb32877e1bb22a2e08389da144be8004233e6d77c917c848ecfba5897cae85bd5c921e5a8eefb14a12b07050e6cd642c485351d25b6e9e8aef9ab84c1f'
        '81760f570952b472dcdd3a5b5a2214136e21d1a1cdf65b6d16c615ef4ac6df056b37eebe9ce1f175aa72c664fa7405b1e6edc57847e64511cc64d969ad4490e7')
# See https://coreruleset.org/docs/1-getting-started/1-1-crs-installation/#verifying-releases
validpgpkeys=('36006F0E0BA167832158821138EEACA1AB8A6E72')
backup=("etc/modsecurity/modsecurity.conf"
  "etc/modsecurity/crs/crs-setup.conf"
  "etc/modsecurity/crs/REQUEST-900-EXCLUSION-RULES-BEFORE-CRS.conf"
  "etc/modsecurity/crs/RESPONSE-999-EXCLUSION-RULES-AFTER-CRS.conf")
options=(!strip !debug)
install="modsecurity-crs.install"

prepare() {
  # activate response, disable audit log, disable telemetry
  sed -i "$srcdir/modsecurity.conf-recommended" \
    -e "s|SecRuleEngine DetectionOnly|#&\nSecRuleEngine On|" \
    -e "s|SecAuditEngine RelevantOnly|#&\nSecAuditEngine Off|" \
    -e "s|SecStatusEngine On|#&\nSecStatusEngine Off|"

  echo "
Include /etc/modsecurity/crs/crs-setup.conf
Include /usr/share/modsecurity/crs/plugins/*-config.conf
Include /etc/modsecurity/crs/REQUEST-900-EXCLUSION-RULES-BEFORE-CRS.conf
Include /usr/share/modsecurity/crs/rules/*.conf
Include /etc/modsecurity/crs/RESPONSE-999-EXCLUSION-RULES-AFTER-CRS.conf" >>"$srcdir/modsecurity.conf-recommended"
}

package() {
  cd "coreruleset-$pkgver"

  # custom configurations
  # https://coreruleset.org/docs/deployment/quick_start/#setting-up-the-main-configuration-file
  install -D -m 644 "$srcdir/modsecurity.conf-recommended" "$pkgdir/etc/modsecurity/modsecurity.conf"
  install -D -m 644 "$srcdir/unicode.mapping" "$pkgdir/etc/modsecurity/unicode.mapping"
  install -D -m 644 "crs-setup.conf.example" "$pkgdir/etc/modsecurity/crs/crs-setup.conf"
  mv "rules/REQUEST-900-EXCLUSION-RULES-BEFORE-CRS.conf.example" "$pkgdir/etc/modsecurity/crs/REQUEST-900-EXCLUSION-RULES-BEFORE-CRS.conf"
  mv "rules/RESPONSE-999-EXCLUSION-RULES-AFTER-CRS.conf.example" "$pkgdir/etc/modsecurity/crs/RESPONSE-999-EXCLUSION-RULES-AFTER-CRS.conf"

  # community rules
  install -d "$pkgdir/usr/share/modsecurity/crs"
  cp -r "rules" "$pkgdir/usr/share/modsecurity/crs"
  cp -r "util" "$pkgdir/usr/share/modsecurity/crs"
  cp -r "regex-assembly" "$pkgdir/usr/share/modsecurity/crs"
  cp -r "plugins" "$pkgdir/usr/share/modsecurity/crs"
}
