# Contributor: Filip <fila pruda com>
# Contributor: Cagnulein <cagnulein at tin dot it>
# Contributor: CountMurphy <spartan1086 at gmail>

pkgname=phpsysinfo
pkgver=3.4.4
pkgrel=3
pkgdesc="PHP script that displays information about the host being accessed."
arch=('any')
license=('GPL2')
url="http://rk4an.github.com/phpsysinfo/"
backup=(etc/webapps/phpsysinfo/phpsysinfo.ini
	etc/webapps/phpsysinfo/.htaccess)
depends=('php-interpreter')
optdepends=('lm_sensors: for providing temperature')
source=("https://github.com/rk4an/phpsysinfo/archive/v$pkgver.tar.gz")
sha512sums=('0f2a6be998eb624ff473a9571f4975c2da8909e2f60826b0c713d781e22cd963fd864ce7bd97992321f86b0d69efb123caeeb24603dbd2223a9986d5e6e8720c')

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
