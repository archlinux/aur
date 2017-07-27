# Maintainer: Javier Torres <javitonino [at] gmail [dot] com>

pkgname=kolab-freebusy
pkgver=1.0.8
pkgrel=2
pkgdesc='Kolab Free/Busy Web Application'
arch=('any')
license=('GPL3')
depends=('roundcubemail-plugins-kolab' 'chwala' 'pear-net-ldap3')
makedepends=('php-composer' 'git')
url='http://kolab.org'
source=("https://mirror.kolabenterprise.com/pub/releases/${pkgname}-${pkgver}.tar.gz"
        "apache.patch"
        "composer.patch")
optdepends=('pykolab: configuration tool')

sha256sums=('fc0ac847192dfde195eae8f10422c1518c6605b16544b1da9df6aabea7b1934c'
            'ae77b4b6738030181b6580a5d54a4c4e412653a11ed1aa2b3b211f81820a7057'
            '3b8d450a052e301a25097cf81d180f2d42e22c6dbe94b220020f69d8ff057d41')

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
