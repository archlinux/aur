# Maintainer: Javier Torres <javitonino [at] gmail [dot] com>

pkgname=kolab-webadmin
pkgver=3.2.6
pkgrel=1
pkgdesc='Kolab Web Administration Panel'
arch=('any')
license=('GPL3')
makedepends=()
depends=('php-ldap' 'pear-net-ldap3')
url="http://kolab.org"
install=kolab-webadmin.install
#backup=()
source=("http://mirror.kolabsys.com/pub/releases/${pkgname}-${pkgver}.tar.gz"
        "apache.patch")
optdepends=('pykolab: configuration tool')

sha256sums=('c39083cb2862a844aaef380953ce58c937016ae76f0bef4350da4b3206aefd27'
            '9f3c03d486a66437fb57ecefc883bd740af6b8b74237b2f819d13ad5df9b034c')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    
    patch -p1 < "${srcdir}/apache.patch"
}
            
package() {
    mkdir -p "${pkgdir}/usr/share/webapps/${pkgname}"
    cp -dpr --no-preserve=ownership "$srcdir/${pkgname}-${pkgver}/public_html" "${pkgdir}/usr/share/webapps/${pkgname}"
    
    # Exclude external dependecies. Use system version instead
    cd "$srcdir/${pkgname}-${pkgver}"
    find "lib" -type f \( -path "lib/ext/*" -or -exec \
        install -D {} "${pkgdir}/usr/share/webapps/${pkgname}/{}" \; \)
    
    mkdir -p "${pkgdir}/usr/share/doc"
    cp -dpr --no-preserve=ownership "$srcdir/${pkgname}-${pkgver}/doc" "${pkgdir}/usr/share/doc/${pkgname}"
    
    mkdir -p "${pkgdir}/var/log/${pkgname}"
    ln -s "/var/log/${pkgname}" "${pkgdir}/usr/share/webapps/${pkgname}/logs"
    
    mkdir -p "${pkgdir}/var/cache/${pkgname}"  
    ln -s "/var/cache/${pkgname}" "${pkgdir}/usr/share/webapps/${pkgname}/cache"
}
