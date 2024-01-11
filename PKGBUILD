# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor K1412 <jonathan@opensides.be>

pkgname="fusiondirectory"
pkgver=1.4
pkgrel=2
pkgdesc="A combination of system administrator and end user web interface, designed to handle LDAP based setups"
url="http://fusiondirectory.org/"
license=("GPL2")
arch=("any")
depends=("gettext"
         "openldap"
         "perl-archive-extract"
         "perl-bytes-random-secure"
         "perl-crypt-cbc"
         "perl-crypt-rijndael"
         "perl-digest-sha"
         "perl-file-copy-recursive"
         "perl-ldap"
         "perl-path-class"
         "perl-term-readkey"
         "perl-xml-twig"
         "php"
         "php-imagick"
         "php-imap"
         "php-pear"
         "schema2ldif"
         "smarty3"
         "smarty3-gettext")
optdepends=("fusiondirectory-plugins: core plugins"
            "apache: webserver"
            "nginx: webserver"
            "php-cas: cas authentication"
            )
source=("https://github.com/fusiondirectory/$pkgname/archive/refs/tags/fusiondirectory-$pkgver.tar.gz"
        "http://script.aculo.us/dist/scriptaculous-js-1.9.0.zip"
        "$pkgname.php.ini"
        "$pkgname.tmpfiles")
b2sums=('c0e021f9b4302e781640116097233465dd0768d4ef44c42f1051e307a341ea5cfa62bfd4c6690023e37dd7c9b5fe4b230a927c609bf530901f0f98c5623c1d29'
        '1d3b125eaeba7c9017cb02f91b9081aceb83c0cbedcb5e6d8e3bf75d7282cc8ca2392240621f06fad8d05af0801433a8572979d95a8a6f7fb2ad47c12f23a132'
        '44c6f9f67d2d10291ecbc5cdc652181d4e4e03ea68e559093ab5e6cf4cfd50ed5148dc840ca73e390d493652805f6ce945b8abb750a39a6a6fa7aa329aedb0bd'
        '01764572fbcb0a39b0130b20ab1bdad7d1cd2c1800dd51a91fb71a289c2630e0f6cb82d440a59218c8117eea366fdd463f92066f3ea8bcab2c9de42e377ef5d4')
install="$pkgname.install"
options=("!strip")

prepare() {
 cd "fusiondirectory-$pkgname-$pkgver"
 find . -type f -exec sed -i {} \
                          -e "s|/etc/$pkgname|/etc/webapps/$pkgname|g" \
                          -e "s|/etc/ldap|/etc/openldap|g" \
                          -e "s|/var/www/$pkgname|/usr/share/webapps/$pkgname|g" \
                          -e "s|/usr/share/$pkgname|/usr/share/webapps/$pkgname|g" \;
 sed -i "include/variables_common.inc" -e 's|"PEAR_DIR", "/usr/share/php"|"PEAR_DIR", "/usr/share/pear"|'
}

package(){
 cd "fusiondirectory-$pkgname-$pkgver"
 # directories
 install -d -m 755 "$pkgdir/etc/openldap/schema/$pkgname"
 install -d -m 750 "$pkgdir/etc/webapps/$pkgname"
 install -d -m 700 "$pkgdir/var/cache/$pkgname"
 install -d -m 755 "$pkgdir/var/cache/$pkgname/template"
 install -d -m 755 "$pkgdir/usr/share/doc/$pkgname/"
 install -d -m 755 "$pkgdir/usr/share/webapps/$pkgname/"
 install -d -m 755 "$pkgdir/usr/share/php/smarty3/plugins/"
 install -d -m 755 "$pkgdir/var/spool/$pkgname/"
 # webapp files and javascript libraries
 _dirs=("html" "ihtml" "include" "locale" "plugins" "setup")
 for _dir in "${_dirs[@]}"; do
  cp -a "$_dir" "$pkgdir/usr/share/webapps/$pkgname/"
 done
 cp -a ../"scriptaculous-js-1.9.0/src/"* "$pkgdir/usr/share/webapps/$pkgname/html/include"
 cp -a ../"scriptaculous-js-1.9.0/lib/prototype.js" "$pkgdir/usr/share/webapps/$pkgname/html/include"
 # executables, no more in 1.4
 #find "contrib/bin/" -type f -exec chmod +x {} \;
 #mv "contrib/bin/" "$pkgdir/usr/"
 # ldap schemas
 cp "contrib/openldap/"* "$pkgdir/etc/openldap/schema/$pkgname/"
 # configuration file template
 install -D -m 640 "contrib/$pkgname.conf" "$pkgdir/var/cache/$pkgname/template/"
 # php extensions
 install -D -m 644 "../$pkgname.php.ini" "$pkgdir/etc/php7/conf.d/$pkgname.ini"
 # smarty3 plugins
 cp "contrib/smarty/plugins/"* "$pkgdir/usr/share/php/smarty3/plugins/"
 rm -r "contrib/smarty"
 # man pages, no more in 1.4
 #gzip -f "contrib/man/$pkgname-setup.1" "contrib/man/$pkgname-insert-schema.1" "contrib/man/$pkgname.conf.5"
 #install -D -m 644 "contrib/man/$pkgname-setup.1.gz" "$pkgdir/usr/share/man/man1/$pkgname-setup.1.gz"
 #install -D -m 644 "contrib/man/$pkgname-insert-schema.1.gz" "$pkgdir/usr/share/man/man1/$pkgname-insert-schema.1.gz"
 #install -D -m 644 "contrib/man/$pkgname.conf.5.gz" "$pkgdir/usr/share/man/man5/$pkgname.conf.5.gz"
 #rm -r "contrib/man/"
 # example snippets
 cp -r "contrib" "$pkgdir/usr/share/doc/$pkgname/"
 # directories and file permission
 install -D -m 644 "../$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}
