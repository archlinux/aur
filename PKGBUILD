# Maintainer: Philipp Schmitt (philipp<at>schmitt<dot>co)

pkgname=wallabag
pkgver=1.5.1.1
pkgrel=1
pkgdesc='Self hostable application for saving web pages'
arch=('any')
url='http://www.wallabag.org/'
license=('WTFPL')
depends=('php>=5.3' 'php-tidy' 'pcre' 'mariadb')
optdepends=('php-sqlite: For sqlite storage' 'php-pgsql: For postgres storage')
install="$pkgname.install"
options=(!strip)
source=("https://github.com/wallabag/wallabag/archive/${pkgver}.tar.gz"
        "vendor.zip::http://wllbg.org/vendor")
sha256sums=('d0d63e5efe56ea28c4ebda2a0ea84162d75c9f7899fccb45aa3fb3e7afc12f5f'
            'bd3e843290de28f1c20fa19ed746ca221c9174cb7f0a9723618f21bddb883e12')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    local default_config=inc/poche/config.inc.php.new
    # Salt
    local salt=$(< /dev/urandom tr -dc A-Za-z0-9_ | head -c100 | sha512sum | awk '{ print $1  }')
    sed -i "s/\('SALT',\).*'/\1 '${salt}'/" $default_config
    # Change default storage to mysql
    sed -i "s/\('STORAGE',\).*'/\1 'mysql'/" $default_config
    # Change default database name
    sed -i "s/\('STORAGE_DB',\).*'/\1 '${pkgname}'/" $default_config
    # Change default user
    sed -i "s/\('STORAGE_USER',\).*'/\1 '${pkgname}'/" $default_config
    # Change default password
    sed -i "s/\('STORAGE_PASSWORD',\).*'/\1 '${pkgname}'/" $default_config
}

package() {
    cd "${pkgdir}"
    mkdir -p usr/share/webapps
    mv "${srcdir}/${pkgname}-${pkgver}" usr/share/webapps/${pkgname}
    mv "${srcdir}/vendor" usr/share/webapps/${pkgname}/vendor
    chown -R http:http "${pkgdir}"
}

