# Contributor: Filip <fila pruda com>
# Contributor: Cagnulein <cagnulein at tin dot it>
# Contributor: CountMurphy <spartan1086 at gmail>

pkgname=phpsysinfo
pkgver=3.4.7
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
sha512sums=('33ad1d8b0c0645c521f07c93cde517e7e2faac583b61c3cbc373e5c7f2d9a2289b14ff7f3890843ebc647d595ae562717e5988aa089ccfe573170db6f9d66723')

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
