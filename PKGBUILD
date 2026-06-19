# Contributor: Filip <fila pruda com>
# Contributor: Cagnulein <cagnulein at tin dot it>
# Contributor: CountMurphy <spartan1086 at gmail>

pkgname=phpsysinfo
pkgver=3.4.6
pkgrel=1
pkgdesc="PHP script that displays information about the host being accessed."
arch=('any')
license=('GPL2')
url="http://rk4an.github.com/phpsysinfo/"
backup=(etc/webapps/phpsysinfo/phpsysinfo.ini
	etc/webapps/phpsysinfo/.htaccess)
depends=('php-interpreter')
optdepends=('lm_sensors: for providing temperature')
source=("https://github.com/rk4an/phpsysinfo/archive/v$pkgver.tar.gz")
sha512sums=('b9fafa7c36498103f61272689c2b3f9744a914a9584dbd844fcc58d5fca834cec2215ad643f5b0319e93450eb700cbb8b27e4683d82ae132ec4bdd5d89c9cabd')

package() {

  _destdir="$pkgdir/usr/share/webapps/phpsysinfo"
  _destdir_etc="$pkgdir/etc/webapps/phpsysinfo"
  
  install -dm755 "$pkgdir/usr/share/webapps"
  
  cp -r "phpsysinfo-$pkgver/" "$_destdir"
  
  #config
  install -dm755 "$pkgdir/etc/webapps/phpsysinfo"
  
  mv "$_destdir/phpsysinfo.ini.new" "$_destdir_etc/phpsysinfo.ini"
  ln -s "/etc/webapps/phpsysinfo/phpsysinfo.ini" "$_destdir/phpsysinfo.ini"
  mv "$_destdir/.htaccess" "$_destdir_etc/.htaccess"
  ln -s "/etc/webapps/phpsysinfo/.htaccess" "$_destdir/.htaccess"
   
  # apache
  cat > "$_destdir_etc/apache.example.conf" <<EOF
        Alias /phpsysinfo "/usr/share/webapps/phpsysinfo"
        <Directory "/usr/share/webapps/phpsysinfo">
                AllowOverride All
                Options FollowSymlinks
		Require all granted
		php_admin_value open_basedir none
        </Directory>
EOF

}
