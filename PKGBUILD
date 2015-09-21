# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

# There's a bunch of fonts included and only some overlap. Maybe this could be made into a split package.

# Competitors: MPDF, TCPDF

# Check your configuration and enable the necessary extensions
#   (cd /usr/share/webapps/dompdf/www; php setup.php > ~/php-dompdf.html)
# View file in web browser then delete

set -u
_pkgname='dompdf'
pkgname="php-${_pkgname}"
pkgver='0.6.1'
pkgrel='1'
pkgdesc='HTML to PDF converter'
arch=('any')
url='https://github.com/dompdf/dompdf'
license=('APACHE')
depends=('php>=5.3' 'php-gd' 'php-font-lib')
optdepends=(
  'httpd: web support'
  'pdflib: preferred rendering library'
  'cpdf: acceptable rendering library'
  #'php-gd: graphical output only rendering library'
  'php-gmagick: improves handling of transparent PNG images'
  'php-imagick: improves handling of transparent PNG images'
)
options=('!strip')
# View the output of web/setup.php for the best list of required extensions
# dom: enabled by default in compile
# pcre,zlib,mbstring: enable in compile
# opcache: enabled in compile but not enabled by default
_verwatch=("${url}/releases" "${url#*github.com}/archive/v\(.*\)\.tar\.gz" 'l')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/dompdf/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('2c96984f77adaac565ee6fd57d6b82794a3caa080ccbb409fb153bdcdd7d2cde')

prepare() {
  set -u
  cd "${_pkgname}-${pkgver}"
  chmod 644 'dompdf.php'
  set +u
}

package() {
  set -u
  cd "${_pkgname}-${pkgver}"
  rm -f 'composer.json'
  install -Dpm644 'LICENSE.LGPL' "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"
  rm -f 'LICENSE.LGPL'
  rm -f 'CONTRIBUTING.md' 'README.md'

  install -d "${pkgdir}/usr/share/webapps/${_pkgname}"
  mv * "${pkgdir}/usr/share/webapps/${_pkgname}/"

  # Writable font directory according to https://code.google.com/p/dompdf/wiki/Installation
  chmod 1777 "${pkgdir}/usr/share/webapps/${_pkgname}/lib/fonts/"
  touch "${pkgdir}/usr/share/webapps/${_pkgname}/lib/fonts/log.htm"
  chmod 666 "${pkgdir}/usr/share/webapps/${_pkgname}/lib/fonts/log.htm"

  # Required php-font-lib addon
  #rmdir "${pkgdir}/usr/share/webapps/${_pkgname}/lib/php-font-lib"
  ln -sf '/usr/share/webapps/FontLib' "${pkgdir}/usr/share/webapps/${_pkgname}/lib/php-font-lib/classes"
  set +u
}
set +u
