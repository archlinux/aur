# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname="modsecurity-crs"
pkgver=4.15.0
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
sha512sums=('af9ce48cfd460858f61e6b2ce7f0a7f4db5f759e573429b93508d0fd9c0a79d26b033afc50dcc383c2ad78a0080c6377b065ee9ce461f53fcabadd55b0782425'
            '9b1b839132019c1d29466e773d3e7efa5ec7bc17aba12a4845c419f5396cddc0587934d5e4848bbd9b949026d288899e0df12b5db8e1f355ac92146b7cace226'
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
