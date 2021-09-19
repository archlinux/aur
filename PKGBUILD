# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor K1412 <jonathan@opensides.be>

pkgname="fusiondirectory"
pkgver=1.4.dev
pkgrel=3
_commit="952afba6f3c0adf945937cb2fc21c40fa1d21d36"
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
         "php7>=7.3"
         "php7-imagick"
         "php7-imap"
         "php-pear"
         "schema2ldif"
         "smarty3"
         "smarty3-gettext")
optdepends=("fusiondirectory-plugins: core plugins"
            "apache: webserver"
            "nginx: webserver"
            "php-cas: cas authentication"
            )
source=(#"https://repos.fusiondirectory.org/sources/$pkgname/$pkgname-$pkgver.tar.gz"
        "https://github.com/fusiondirectory/fusiondirectory/archive/$_commit.tar.gz"
        "http://script.aculo.us/dist/scriptaculous-js-1.9.0.zip"
        "$pkgname.php.ini"
        "$pkgname.tmpfiles")
sha256sums=('4f27b6e1cbb5e78aeaacddfe27ed62155d97897e615a59cd15f08c499c706c09'
            '1fa39bd110d3326a14f920601803813f088d08ecb2cc645aa7075884d998f6f6'
            'a8264c307ff6ec8fd3723831414bd8ce343703347dcddaa945b8cb18be4c89a7'
            '1929afae6a7917535e44feac5455be35a2d6045a226e858a5ddd9b6204852f84')
install="$pkgname.install"
options=("!strip")

prepare() {
 cd "$pkgname-$_commit"
 find . -type f -exec sed -i {} \
                          -e "s|/etc/$pkgname|/etc/webapps/$pkgname|g" \
                          -e "s|/etc/ldap|/etc/openldap|g" \
                          -e "s|/var/www/$pkgname|/usr/share/webapps/$pkgname|g" \
                          -e "s|/usr/share/$pkgname|/usr/share/webapps/$pkgname|g" \;
 sed -i "include/variables_common.inc" -e 's|"PEAR_DIR", "/usr/share/php"|"PEAR_DIR", "/usr/share/pear"|'
}

package(){
 cd "$pkgname-$_commit"
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
 # executables
 find "contrib/bin/" -type f -exec chmod +x {} \;
 mv "contrib/bin/" "$pkgdir/usr/"
 # ldap schemas
 cp "contrib/openldap/"* "$pkgdir/etc/openldap/schema/$pkgname/"
 # configuration file template
 install -D -m 640 "contrib/$pkgname.conf" "$pkgdir/var/cache/$pkgname/template/"
 # php extensions
 install -D -m 644 "../$pkgname.php.ini" "$pkgdir/etc/php7/conf.d/$pkgname.ini"
 # smarty3 plugins
 cp "contrib/smarty/plugins/"* "$pkgdir/usr/share/php/smarty3/plugins/"
 rm -r "contrib/smarty"
 # man pages
 gzip -f "contrib/man/$pkgname-setup.1" "contrib/man/$pkgname-insert-schema.1" "contrib/man/$pkgname.conf.5"
 install -D -m 644 "contrib/man/$pkgname-setup.1.gz" "$pkgdir/usr/share/man/man1/$pkgname-setup.1.gz"
 install -D -m 644 "contrib/man/$pkgname-insert-schema.1.gz" "$pkgdir/usr/share/man/man1/$pkgname-insert-schema.1.gz"
 install -D -m 644 "contrib/man/$pkgname.conf.5.gz" "$pkgdir/usr/share/man/man5/$pkgname.conf.5.gz"
 rm -r "contrib/man/"
 # example snippets
 cp -r "contrib" "$pkgdir/usr/share/doc/$pkgname/"
 # directories and file permission
 install -D -m 644 "../$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}
