# Maintainer: Sébastien Luttringer <seblu@aur.archlinux.org>

pkgname=simpleid
pkgver=0.9.1
pkgrel=1
pkgdesc='Simple, personal OpenID provider written in PHP'
arch=('any')
url='http://simpleid.koinic.net/'
license=('GPL2')
backup=("etc/webapps/$pkgname/config.php")
depends=('php')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('4de51c6173b920730ab8db2d646a2b7a')

package() {
  cd $pkgname

  # web (world readable)
  install -d -m 755 "$pkgdir/usr/share/webapps/$pkgname"
  cp -a www "$pkgdir/usr/share/webapps/$pkgname/www"

  # identities (webserver only readable), provide symlink for default conf
  install -d -m 750 -g 33 "$pkgdir"/var/lib/$pkgname/identities
  ln -s ../../../../var/lib/simpleid/identities \
    "$pkgdir/usr/share/webapps/$pkgname/identities"

  # storage (webserver writable)
  install -d -m 775 -g 33 "$pkgdir/var/lib/$pkgname/store"
  ln -s ../../../../var/lib/simpleid/store \
    "$pkgdir/usr/share/webapps/$pkgname/store"

  # cache (webserver writable)
  install -d -m 775 -g 33 "$pkgdir/var/cache/$pkgname"
  ln -s ../../../../var/cache/simpleid \
    "$pkgdir/usr/share/webapps/$pkgname/cache"

  # move config into /etc
  install -d -m 755 "$pkgdir/etc/webapps/$pkgname"
  cp "$pkgdir/usr/share/webapps/$pkgname/www/config.php.dist" \
     "$pkgdir/etc/webapps/$pkgname/config.php"
  ln -s "/etc/webapps/$pkgname/config.php" \
        "$pkgdir/usr/share/webapps/$pkgname/www/config.php"

  # docs
  install -d -m 755 "$pkgdir/usr/share/doc/$pkgname"
  for i in CHANGELOG.txt README.txt UPGRADE.txt COPYING.txt \
      identities/example.identity.dist; do
    install -D -m 644 "$i" "$pkgdir/usr/share/doc/$pkgname/$(basename "$i")"
  done

  # allow php to access simpleid directories
  install -Dm 644 /dev/null "$pkgdir/etc/php/conf.d/simpleid.ini"
  echo 'open_basedir = ${open_basedir}:/usr/share/webapps/simpleid:/etc/webapps/simpleid:/var/lib/simpleid:/var/cache/simpleid' \
    > "$pkgdir/etc/php/conf.d/simpleid.ini"

  # default apache config, but keep in mind that nginx rocks!
  install -d -m 755 "$pkgdir/etc/httpd/conf/extra"
  cat > "$pkgdir/etc/httpd/conf/extra/$pkgname.conf" <<-EOF
  Alias /$pkgname "/usr/share/webapps/$pkgname"
  <Directory "/usr/share/webapps/$pkgname/www">
    AllowOverride All
    Options FollowSymlinks
    Order allow,deny
    Allow from all
  </Directory>
EOF
}

# vim:set ts=2 sw=2 et:
