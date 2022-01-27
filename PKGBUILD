# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="yourls-sleeky"
pkgver=2.5.0
pkgrel=1
pkgdesc="A sleek and simple frontend & backend theme for YOURLS"
url="https://sleeky.flynntes.com"
license=("MIT")
arch=("any")
depends=("yourls")
source=("https://github.com/Flynntes/Sleeky/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b49964f0af7ec709bfe0c32c508e4479af2f629181dc302b6c88de93fd87e926')
backup=("etc/webapps/yourls/frontend/config.php")

prepare(){
 cd "Sleeky-$pkgver"
 sed -i "sleeky-frontend/index.php" \
     -e 's|<img src="<?php echo YOURLS_SITE ?><?php echo logo ?>" alt="Logo" width="95px" class="mt-n5">|<img src="<?php echo logo ?>" alt="Logo" width="95px" class="mt-n5">|'
 sed -i "sleeky-frontend/frontend/header.php" \
     -e 's|<link rel="stylesheet" href="<?php echo $YOURLS_SITE ?>/frontend/dist/styles.css">|<link rel="stylesheet" href="<?php echo YOURLS_SITE ?>/frontend/dist/styles.css">|'
 sed -i "sleeky-frontend/frontend/config.php" \
     -e "s|// GENERAL|&\ndefine('YOURLS_SITE', 'https://example.org');|"
}

package(){
 cd "Sleeky-$pkgver"
 install -d "$pkgdir/etc/webapps/yourls/frontend"
 install -d "$pkgdir/usr/share/webapps/yourls/user/plugins"
 # frontend
 cp -r "sleeky-frontend/"* "$pkgdir/usr/share/webapps/yourls"
 mv "$pkgdir/usr/share/webapps/yourls/frontend/config.php" "$pkgdir/etc/webapps/yourls/frontend"
 ln -s "/etc/webapps/yourls/frontend/config.php" "$pkgdir/usr/share/webapps/yourls/frontend/config.php"
 chown root:http "$pkgdir/etc/webapps/yourls/frontend/config.php"
 chmod 640 "$pkgdir/etc/webapps/yourls/frontend/config.php"
 # backend
 cp -r "sleeky-backend" "$pkgdir/usr/share/webapps/yourls/user/plugins"
}
