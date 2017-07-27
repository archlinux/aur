# Maintainer: Javier Torres <javitonino [at] gmail [dot] com>

pkgname=irony
pkgver=0.3.1
pkgrel=2
pkgdesc='Kolab Groupware Access Protocol Layers (Cal/Card/GroupDAV support)'
arch=('any')
license=('GPL3')
depends=('roundcubemail-plugins-kolab' 'chwala' 'pear-net-ldap3')
optdepends=('pykolab: configuration tool')
makedepends=('php-composer' 'git')
url='http://kolab.org'
install=irony.install
source=("https://mirror.kolabenterprise.com/pub/releases/iRony-${pkgver}.tar.gz"
        "composer.patch"
        "php.ini"
        "${pkgname}.install"
        "${pkgname}.tmpfiles"
        "apache.patch")

sha256sums=('e6f3d4c643c73ee4bd0060d1979568d6a5db0ac6a8de2c6187bbb15940a7f347'
            '15ca2a9fdb50f65e535c56f1d74ee5689e8b9db949ff7c24f45916f36c4788a9'
            '62080ba2fded24b03b6fa449d69ae91ff2ba4350f063104bdb46ff0dcf235c99'
            '73d56319d0000f81c1f327177e43a440ec4a4a5d6f37ccd90c3603a399307b74'
            'd08c304c515cdba937541b7e1f099b16587cff0b1c5096eadcce66a5266e6b35'
            '98b4a75de89b39eeafe5df32c345989a2c1c8a8cb6f9b964e0608c5107c9a597')

prepare() {
    cd "${srcdir}/iRony-${pkgver}"
    patch -p1 < "${srcdir}/apache.patch"
    mv "doc/iRony.conf" "doc/${pkgname}.conf"
    
    # This avoids GitHub's throttling
    patch -p1 < "${srcdir}/composer.patch"
}

build() {
    cd "${srcdir}/iRony-${pkgver}"
    php -nc ${srcdir}/php.ini /usr/bin/composer install --prefer-source
}
            
package() {
    mkdir -p "${pkgdir}/usr/share/webapps/${pkgname}"
    cp -dpr --no-preserve=ownership "$srcdir/iRony-${pkgver}/public_html" "${pkgdir}/usr/share/webapps/${pkgname}"
    cp -dpr --no-preserve=ownership "$srcdir/iRony-${pkgver}/lib" "${pkgdir}/usr/share/webapps/${pkgname}"
    
    # Ignore hidden files (.git)
    cd "$srcdir/iRony-${pkgver}"
    find "vendor" -path "*/.*" -or -type f -exec \
        install -D {} "${pkgdir}/usr/share/webapps/${pkgname}/{}" \;
    
    # Link external dependencies
    ln -s "/usr/share/webapps/chwala/lib/" "${pkgdir}/usr/share/webapps/${pkgname}/lib/FileAPI"
    ln -s "/usr/share/webapps/roundcubemail/plugins//" "${pkgdir}/usr/share/webapps/${pkgname}/lib/plugins"
    ln -s "/usr/share/webapps/roundcubemail/program/lib/Roundcube/" "${pkgdir}/usr/share/webapps/${pkgname}/lib/Roundcube"
    
    mkdir -p "${pkgdir}/usr/share/doc"
    cp -dr --no-preserve=ownership "$srcdir/iRony-${pkgver}/doc" "${pkgdir}/usr/share/doc/${pkgname}"
    
    mkdir -p "${pkgdir}/var/log/${pkgname}"
    ln -s "/var/log/${pkgname}" "${pkgdir}/usr/share/webapps/${pkgname}/logs"
    ln -s "/var/log/${pkgname}/errors" "${pkgdir}/usr/share/webapps/${pkgname}/errors"
    
    install -Dm644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
    ln -s "/run/${pkgname}" "${pkgdir}/usr/share/webapps/${pkgname}/temp"
    
    ln -s "/etc/webapps/roundcubemail/config" "${pkgdir}/usr/share/webapps/${pkgname}"
    install -Dm644 "${srcdir}/iRony-${pkgver}/config/dav.inc.php.sample" "${pkgdir}/etc/webapps/roundcubemail/config/dav.inc.php.sample"
}
