# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname="modsecurity-crs"
pkgver=4.10.0
pkgrel=1
pkgdesc="OWASP ModSecurity Core Rule Set"
url="https://github.com/coreruleset/coreruleset"
license=("Apache-2.0")
arch=("any")
depends=("libmodsecurity")
optdepends=("geoip-database: for coutry-based rules"
            "nginx: HTTP server"
            "angie: HTTP server"
            "apache: HTTP server")
source=("https://github.com/coreruleset/coreruleset/archive/refs/tags/v$pkgver.tar.gz"
        "https://raw.githubusercontent.com/owasp-modsecurity/ModSecurity/v3/master/modsecurity.conf-recommended"
        "https://raw.githubusercontent.com/owasp-modsecurity/ModSecurity/v3/master/unicode.mapping")
sha512sums=('5cf62a1ff6862d4318beffb9f33a64ee8e225d671360d39aa8bee5b847d4d77fea272af46befde7365a52a3699ab136396ced278c87253296d1b6714a8a93660'
            '402a6b4f462ffd73f4bfc636d279337db0be6c260981b94312053c6e787cc81831cc5f702b42344f59cc9d31ac5dffb9dcd1595a78b7d45abe534ff63cb81867'
            'da4a211a1791e4fc68b7cf18917c892d72fd6e1c22b312a21ae21ff8fba25365a9efeee4a9a00352ada25b3b0f6226e844f7f9bbedbcb7ab6424349841c3d42e')
backup=("etc/modsecurity/modsecurity.conf"
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

 echo "
Include /etc/modsecurity/crs/crs-setup.conf
Include /usr/share/modsecurity/crs/plugins/*-config.conf
Include /etc/modsecurity/crs/REQUEST-900-EXCLUSION-RULES-BEFORE-CRS.conf
Include /usr/share/modsecurity/crs/rules/*.conf
Include /etc/modsecurity/crs/RESPONSE-999-EXCLUSION-RULES-AFTER-CRS.conf" >> "$srcdir/modsecurity.conf-recommended"
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
 install -d             "$pkgdir/usr/share/modsecurity/crs"
 cp -r "rules"          "$pkgdir/usr/share/modsecurity/crs"
 cp -r "util"           "$pkgdir/usr/share/modsecurity/crs"
 cp -r "regex-assembly" "$pkgdir/usr/share/modsecurity/crs"
 cp -r "plugins"        "$pkgdir/usr/share/modsecurity/crs"
}
