# Contributor: Filip <fila pruda com>
# Contributor: Cagnulein <cagnulein at tin dot it>
# Contributor: CountMurphy <spartan1086 at gmail>

pkgname=phpsysinfo
pkgver=3.4.5
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
sha512sums=('3e06eb54b4a42874930a9f4a95a5a6ffbad115007d297d528c606a8bd74eec5d9f9ff892a3c75959a1c500a3e323f2e5ead1b3a67a35abdea9d241fea072dcff')

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
