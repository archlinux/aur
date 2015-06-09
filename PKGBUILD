# Maintainer: Javier Torres <javitonino [at] gmail [dot] com>
pkgname=chwala
pkgver=0.3.0
pkgrel=1
pkgdesc='Kolab File Management'
arch=('any')
license=('AGPL3')
makedepends=()
depends=('php-mcrypt' 'pear-http-request2' 'roundcubemail' 'smarty3' 'php-kolabformat')
url='http://kolab.org'
install=chwala.install
#backup=()
source=("http://mirror.kolabsys.com/pub/releases/${pkgname}-${pkgver}.tar.gz"
        "chwala.install"
        "chwala.tmpfiles"
        "apache.patch")
#optdepends=()

sha256sums=('e6da2d63d25a070b2a9dbcc437ba5e85048ce86fe736840001fc6702d0ea73bb'
            '63c6661fe031f001357ffbecaed8bcd9f1d56549d5223c89e583713cc01d9e51'
            'e88b39da4157a2ff99e692d771b10c496ab1122f240d72db0a2c8bcacdfcf09b'
            'd41a6b0eefdc7e5a4b134813bc772644e462eb7b768f2f18bd28aae9d169cfb6')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    patch -p1 < "${srcdir}/apache.patch"
}
            
package() {
  mkdir -p "${pkgdir}/usr/share/webapps/chwala"
  cp -dpr --no-preserve=ownership "$srcdir/${pkgname}-${pkgver}/public_html" "${pkgdir}/usr/share/webapps/${pkgname}/public_html"
  
  # Exclude external dependecies. Use system version instead
  cd "$srcdir/${pkgname}-${pkgver}"
  find "lib" -type f \( -path "lib/ext/*" -or -exec \
    install -D {} "${pkgdir}/usr/share/webapps/${pkgname}/{}" \; \)
  
  # Link to system roundcube
  mkdir "${pkgdir}/usr/share/webapps/${pkgname}/lib/ext"
  ln -s "/usr/share/webapps/roundcubemail/program/lib/Roundcube" "${pkgdir}/usr/share/webapps/${pkgname}/lib/ext"
  
  ln -s "/etc/webapps/roundcubemail/config" "${pkgdir}/usr/share/webapps/${pkgname}/config"
  
  mkdir -p "${pkgdir}/usr/share/doc"
  cp -dpr --no-preserve=ownership "$srcdir/${pkgname}-${pkgver}/doc" "${pkgdir}/usr/share/doc/${pkgname}"
   
  mkdir -p "${pkgdir}/var/log/${pkgname}"
  ln -s "/var/log/${pkgname}" "${pkgdir}/usr/share/webapps/${pkgname}/logs"
  
  mkdir -p "${pkgdir}/var/cache/${pkgname}"  
  ln -s "/var/cache/${pkgname}" "${pkgdir}/usr/share/webapps/${pkgname}/cache"
  
  install -Dm644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
  ln -s "/run/${pkgname}" "${pkgdir}/usr/share/webapps/${pkgname}/temp"
}
