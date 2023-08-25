# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="modsecurity-crs"
pkgver=3.3.5
pkgrel=2
pkgdesc="OWASP ModSecurity Core Rule Set"
url="https://coreruleset.org"
license=("APACHE2")
arch=("any")
depends=("libmodsecurity"
         "nginx")
optdepends=("geoip-database")
source=("load.conf"
        "https://github.com/coreruleset/coreruleset/archive/refs/tags/v$pkgver.tar.gz"
        "https://raw.githubusercontent.com/SpiderLabs/ModSecurity/v3/master/modsecurity.conf-recommended"
        "https://raw.githubusercontent.com/SpiderLabs/ModSecurity/v3/master/unicode.mapping")
sha256sums=('5ac1bee60cd5c374ed1cc3c70818933152ab7dbb4b30891096118fc371e077e0'
            '6e311e9b5c07741392a6983075101915988127d385fa786e36d83018ea0a401b'
            'ffa48d196c24d0b9c3d55f55cd7b05cdeccd7e6d9164b8b7694d2595da4f8352'
            '5e4500ef82e45c49d8edd9513648939710d6c8cc2d5997513b32866dc5d9be23')
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
 install -D -m 644 "$srcdir/modsecurity.conf-recommended" "$pkgdir/etc/modsecurity/modsecurity.conf"
 install -D -m 644 "$srcdir/unicode.mapping" "$pkgdir/etc/modsecurity/unicode.mapping"
 install -D -m 644 "crs-setup.conf.example" "$pkgdir/etc/modsecurity/crs/crs-setup.conf"
 install -D -m 644 "rules/REQUEST-900-EXCLUSION-RULES-BEFORE-CRS.conf.example" "$pkgdir/etc/modsecurity/crs/REQUEST-900-EXCLUSION-RULES-BEFORE-CRS.conf"
 install -D -m 644 "rules/RESPONSE-999-EXCLUSION-RULES-AFTER-CRS.conf.example" "$pkgdir/etc/modsecurity/crs/RESPONSE-999-EXCLUSION-RULES-AFTER-CRS.conf"
 # community rules
 install -d "$pkgdir/usr/share/modsecurity/crs"
 cp -r "rules" "$pkgdir/usr/share/modsecurity/crs"
 cp -r "util" "$pkgdir/usr/share/modsecurity/crs"
 # loading file for nginx
 # https://coreruleset.org/docs/deployment/install/#includes-for-nginx
 # https://medium.com/codelogicx/securing-nginx-server-using-modsecurity-oswaf-7ba79906d84c
 install -D -m 644 "$srcdir/load.conf" "$pkgdir/etc/modsecurity/load.conf"
 #$(find "$pkgdir/usr/share/modsecurity/crs/rules" -type f | sed "s|$pkgdir|include |g")
}
