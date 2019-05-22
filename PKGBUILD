# Maintainer: Michael J. Pento <mjpento@verizon.net>
# Contributor: Caleb Cushing <xenoterracide@gmail.com>
# Contributor: Attila Bukor <r1pp3rj4ck@w4it.eu>

pkgname=apache-cxf
pkgver=3.3.2
pkgrel=1
pkgdesc='open source services framework'
arch=('any')
license=('Apache')
url='http://cxf.apache.org'
depends=('java-runtime')
options=('!strip')
source=("http://www.us.apache.org/dist/cxf/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        'apache-cxf.sh')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -m755 -d \
    "${pkgdir}/usr/share/java/${pkgname}/lib" \
    "${pkgdir}/usr/share/doc/${pkgname}" \
    "${pkgdir}/usr/bin" \
    "${pkgdir}/etc/profile.d"

  cp -r "${srcdir}/${pkgname}-${pkgver}/lib/"* \
          "${pkgdir}/usr/share/java/${pkgname}/lib"
  rm "${pkgdir}/usr/share/java/${pkgname}/lib/WHICH_JARS"
  cp -r "${srcdir}/${pkgname}-${pkgver}/docs/api" \
          "${pkgdir}/usr/share/doc/${pkgname}"

  cp -r "${srcdir}/${pkgname}-${pkgver}/bin" "${pkgdir}/usr/"
  find "${pkgdir}/usr/bin/" -name '*.bat' -delete
  find "${pkgdir}/usr/bin/" -type f -exec sed -i -e '$s#$JAVA_HOME#/usr/lib/jvm/default-runtime/#' '{}' ';'
  find "${pkgdir}/usr/bin/" -type f -exec sed -i -e 's#sun_tool_path=.*#sun_tool_path=/usr/lib/jvm/default/lib/tools.jar#' '{}' ';'

  # to resolve conflict between midnight commander and apache-cxf
  mv "${pkgdir}/usr/bin/mc" "${pkgdir}/usr/bin/apache-mc"

  install -m 644  "${srcdir}/apache-cxf.sh" "${pkgdir}/etc/profile.d"
}

sha256sums=('f97a385436173597211edcd8e1648d5fa4aaaa00ce1f4fa1a7537a7944aba1be'
            'c52ba86604138776e50f6fc9506e21ad6f30064a54a0aaef3d5316245b14e668')
