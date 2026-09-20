# Maintainer: Mike Pento <mjpento@gmail.com>

pkgname=apache-cxf
pkgver=4.1.8
pkgrel=1
pkgdesc='open source services framework'
arch=('any')
license=('Apache-2.0')
url='http://cxf.apache.org'
depends=('bash' 'java-runtime')
options=('!strip')
source=("https://dlcdn.apache.org/cxf/${pkgver}/${pkgname}-${pkgver}.tar.gz"
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

sha256sums=('cad0302b53f32a424b175fef5f117142e74d0ae91cfe201aedbee316f2550ac2'
            'c52ba86604138776e50f6fc9506e21ad6f30064a54a0aaef3d5316245b14e668')
