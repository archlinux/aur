# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname="modsecurity-crs"
pkgver=4.2.0
pkgrel=3
pkgdesc="OWASP ModSecurity Core Rule Set"
url="https://coreruleset.org"
license=("Apache-2.0")
arch=("any")
depends=("libmodsecurity")
optdepends=("geoip-database: for coutry-based rules"
            "nginx: HTTP server"
            "angie: HTTP server")
source=("load.conf"
        "https://github.com/coreruleset/coreruleset/archive/refs/tags/v$pkgver.tar.gz"
        "https://raw.githubusercontent.com/owasp-modsecurity/ModSecurity/v3/master/modsecurity.conf-recommended"
        "https://raw.githubusercontent.com/owasp-modsecurity/ModSecurity/v3/master/unicode.mapping")
b2sums=('3ef10f3f3d5cb30c9969346bbfa592e15574ad60d701311c7646d00b5929b2402c2e2d9e745eea6bd78a06231bb8d63a5581acfd89082aa99a9e953dff3cc1d1'
        'f33d1a2bfac809e08ce5480af68b2380b19ea33f4d1409dd79d2117e451631df5b73ba2ccbc6eae2757df3b092c9439bfe79b49658d76fda1a1237f204317080'
        '6f9f2ea061ec423a28c0ad9c8cc5d70535208f2bae6b94292ede9cf7348d892efd47a9637e230f1a3e60a3f82be49e260bfb5a236ee831f0c40ad3bee692ae41'
        '81760f570952b472dcdd3a5b5a2214136e21d1a1cdf65b6d16c615ef4ac6df056b37eebe9ce1f175aa72c664fa7405b1e6edc57847e64511cc64d969ad4490e7')
backup=("etc/modsecurity/load.conf"
        "etc/modsecurity/modsecurity.conf"
        "etc/modsecurity/crs/crs-setup.conf"
        "etc/modsecurity/crs/REQUEST-900-EXCLUSION-RULES-BEFORE-CRS.conf"
        "etc/modsecurity/crs/RESPONSE-999-EXCLUSION-RULES-AFTER-CRS.conf")
options=("!strip")
install="modsecurity-crs.install"

prepare(){
 # activate response, disable audit log, disable telemetry
 sed -i "$srcdir/modsecurity.conf-recommended" \
     -e "s|SecRuleEngine DetectionOnly|#&\nSecRuleEngine On|" \
     -e "s|SecAuditEngine RelevantOnly|#&\nSecAuditEngine Off|" \
     -e "s|SecStatusEngine On|#&\nSecStatusEngine Off|"
}

package(){
 cd "coreruleset-$pkgver"

 # custom configurations
 # https://coreruleset.org/docs/deployment/quick_start/#setting-up-the-main-configuration-file
 install -D -m 644 "$srcdir/modsecurity.conf-recommended"       "$pkgdir/etc/modsecurity/modsecurity.conf"
 install -D -m 644 "$srcdir/unicode.mapping"                    "$pkgdir/etc/modsecurity/unicode.mapping"
 install -D -m 644 "crs-setup.conf.example"                     "$pkgdir/etc/modsecurity/crs/crs-setup.conf"
 mv "rules/REQUEST-900-EXCLUSION-RULES-BEFORE-CRS.conf.example" "$pkgdir/etc/modsecurity/crs/REQUEST-900-EXCLUSION-RULES-BEFORE-CRS.conf"
 mv "rules/RESPONSE-999-EXCLUSION-RULES-AFTER-CRS.conf.example" "$pkgdir/etc/modsecurity/crs/RESPONSE-999-EXCLUSION-RULES-AFTER-CRS.conf"

 # community rules
 install -d    "$pkgdir/usr/share/modsecurity/crs"
 cp -r "rules" "$pkgdir/usr/share/modsecurity/crs"
 cp -r "util"  "$pkgdir/usr/share/modsecurity/crs"

 # loading file for nginx
 # https://coreruleset.org/docs/deployment/install/#includes-for-nginx
 # https://medium.com/codelogicx/securing-nginx-server-using-modsecurity-oswaf-7ba79906d84c
 install -D -m 644 "$srcdir/load.conf" "$pkgdir/etc/modsecurity/load.conf"
}
