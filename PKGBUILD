# Maintainer: Javier Torres <javitonino [at] gmail [dot] com>

pkgname=kolab-freebusy
pkgver=1.0.7
pkgrel=1
pkgdesc='Kolab Free/Busy Web Application'
arch=('any')
license=('GPL3')
depends=('roundcubemail-plugins-kolab' 'chwala' 'pear-net-ldap3')
makedepends=('php-composer' 'git')
url='http://kolab.org'
source=("http://mirror.kolabsys.com/pub/releases/${pkgname}-${pkgver}.tar.gz"
        "apache.patch"
        "composer.patch")
optdepends=('pykolab: configuration tool')

sha256sums=('cdc4a2b4fa5e8fb5074356d619ee5c97748638707eff7dc3fec28250ad020da2'
            'ae77b4b6738030181b6580a5d54a4c4e412653a11ed1aa2b3b211f81820a7057'
            '3f115d728fb9d1cbfc379ede7fc717dcc8d0105e5b0204807ecc221a826da64d')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    
    patch -p1 < "${srcdir}/composer.patch"
    patch -p1 < "${srcdir}/apache.patch"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    composer install
}
            
package() {
    mkdir -p "${pkgdir}/usr/share/webapps/${pkgname}"
    cp -dpr --no-preserve=ownership "$srcdir/${pkgname}-${pkgver}/public_html" "${pkgdir}/usr/share/webapps/${pkgname}"
    cp -dpr --no-preserve=ownership "$srcdir/${pkgname}-${pkgver}/lib" "${pkgdir}/usr/share/webapps/${pkgname}"

    # Ignore hidden files (.git)
    cd "$srcdir/${pkgname}-${pkgver}"
    find "vendor" -path "*/.*" -or -type f -exec \
        install -D {} "${pkgdir}/usr/share/webapps/${pkgname}/{}" \;
    
    ln -s "/usr/share/webapps/roundcubemail/plugins//" "${pkgdir}/usr/share/webapps/${pkgname}/lib/plugins"
    ln -s "/usr/share/webapps/roundcubemail/program/lib/Roundcube/" "${pkgdir}/usr/share/webapps/${pkgname}/lib/Roundcube"
    
    mkdir -p "${pkgdir}/usr/share/doc"
    cp -dr --no-preserve=ownership "$srcdir/${pkgname}-${pkgver}/doc" "${pkgdir}/usr/share/doc/${pkgname}"
    
    mkdir -p "${pkgdir}/var/log/${pkgname}"
    ln -s "/var/log/${pkgname}" "${pkgdir}/usr/share/webapps/${pkgname}/log"
    
    mkdir -p "${pkgdir}/etc/webapps/${pkgname}/config"
    ln -s "/etc/webapps/roundcubemail/config/defaults.inc.php" "${pkgdir}/etc/webapps/${pkgname}/config"
    ln -s "/etc/webapps/roundcubemail/config/config.inc.php" "${pkgdir}/etc/webapps/${pkgname}/config"
    install -Dm0644 "$srcdir/${pkgname}-${pkgver}/config/config.ini.sample" "${pkgdir}/etc/webapps/${pkgname}/config"
    
    ln -s "/etc/webapps/${pkgname}/config" "${pkgdir}/usr/share/webapps/${pkgname}/config"
}
