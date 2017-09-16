#Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=bareos-webui
pkgver=16.2.6
pkgrel=2
pkgdesc="A PHP-Frontend to manage Bareos over the web."
arch=('i686' 'x86_64' 'armv5h' 'armv6h' 'armv7h')
license=('AGPLv3')
url='https://github.com/bareos/bareos-webui/'
depends=('php' 'php-fpm' 'jansson')
optdepend=('nginx' 'apache')
source=("https://github.com/bareos/bareos-webui/archive/Release/${pkgver}.tar.gz")
backup=('etc/bareos-webui/configuration.ini'
        'etc/bareos-webui/directors.ini'
        'etc/bareos/bareos-dir.d/console/admin.conf.example'
        'etc/bareos/bareos-dir.d/profile/webui-admin.conf')
sha256sums=('bf40ad8465380dba6458d979860c5a768a15a50c2f64135f6edc1239ab51a71b')

build() {
        cd "${srcdir}/bareos-webui-Release-${pkgver}"
        ./configure
        make
}

package() {
        cd "${srcdir}/bareos-webui-Release-${pkgver}"
        mkdir -p "${pkgdir}/etc/bareos-webui"
        mkdir -p "${pkgdir}/usr/share/webapps/bareos-webui"
        cp -a "install/." "${pkgdir}/etc/bareos-webui/"
        mv ${pkgdir}/etc/bareos-webui/bareos ${pkgdir}/etc/bareos
        sed -i 's?/var/www/bareos-webui/public?/usr/share/webapps/bareos-webui/public?g' ${pkgdir}/etc/bareos-webui/nginx/bareos-webui.conf
        sed -i 's?/var/run/php5-fpm.sock;?/run/php-fpm/php-fpm.sock;?g' ${pkgdir}/etc/bareos-webui/nginx/bareos-webui.conf
        sed -i 's?/var/www/bareos-webui/public?/usr/share/webapps/bareos-webui/public?g' ${pkgdir}/etc/bareos-webui/apache/bareos-webui.conf
	mkdir -p "${pkgdir}/usr/share/license/bareos-webui"
	cp LICENSE "${pkgdir}/usr/share/license/bareos-webui/LICENSE"
        cp -a "public/" "${pkgdir}/usr/share/webapps/${pkgname}/"
        cp -a "module/" "${pkgdir}/usr/share/webapps/${pkgname}/"
        cp -a "config/" "${pkgdir}/usr/share/webapps/${pkgname}/"
        cp -a "vendor/" "${pkgdir}/usr/share/webapps/${pkgname}/"
        cp "init_autoloader.php" "${pkgdir}/usr/share/webapps/${pkgname}/"
}

