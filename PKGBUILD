# $Id$
# Contributor: Evgeniy Alekseev <arcanis.arch at gmail dot com>
# Contributor: Tom <reztho at archlinux dot us>

pkgname=pdfsam-legacy
_pkgname=pdfsam
pkgver=2.2.4
pkgrel=1
pkgdesc="A free open source tool to split and merge pdf documents"
arch=('any')
url="http://www.pdfsam.org/"
license=('GPL')
depends=('java-environment' 'sh')
makedepends=('apache-ant' 'desktop-file-utils' 'gendesk' 'libarchive')
source=("http://downloads.sourceforge.net/project/${_pkgname}/${_pkgname}/${pkgver}/${_pkgname}-${pkgver}-out-src.zip")
install=${pkgname}.install
md5sums=('5947fc9cfc53cbc242a46881d9216957')

_branchdir="pdfsam-maine"
_builddir="${pkgname}-${pkgver}/build"
_buildver="pdfsam-basic"

prepare() {
  # create *.desktop file
  gendesk -n -f \
          --pkgname="${pkgname}" \
          --pkgdesc="${pkgdesk}" \
          --name="PDFsam Legacy" \
          --categories="Office"
}

build() {
  # unzip source arhives
  find . -name '*.zip' ! -name "${_pkgname}-${pkgver}-out-src.zip" -exec bsdtar -xf {} \;

  mkdir -p "${srcdir}/${_builddir}"
  cd "${srcdir}/${_branchdir}/ant"
  ant -Dbuild.dir="${srcdir}/${_builddir}" \
      -Dworkspace.dir="${srcdir}"
}

package() {
  install -dm755 "${pkgdir}/usr/share/java/${pkgname}/"
  # main program
  install -Dm644 "${srcdir}/${_builddir}/${_branchdir}/release/dist/${_buildver}/pdfsam-config.xml" \
                 "${pkgdir}/usr/share/java/${pkgname}/"
  install -Dm644 "${srcdir}/${_builddir}/${_branchdir}/release/dist/${_buildver}/${_pkgname}-${pkgver}.jar" \
                 "${pkgdir}/usr/share/java/${pkgname}/"

  # install plugins
  cd "${srcdir}/${_builddir}/${_branchdir}/release/dist/${_buildver}/plugins/"
  for _plugin in $(find * -type d); do
    install -dm755 "${pkgdir}/usr/share/java/${pkgname}/plugins/${_plugin}"
    install -m644 "${srcdir}/${_builddir}/${_branchdir}/release/dist/${_buildver}/plugins/${_plugin}/"* \
                  "${pkgdir}/usr/share/java/${pkgname}/plugins/${_plugin}/"
  done

  # install libs
  install -dm755 "${pkgdir}/usr/share/java/${pkgname}/"{lib,ext}
  install -m644 "${srcdir}/${_builddir}/${_branchdir}/release/dist/${_buildver}/lib/"* \
                "${pkgdir}/usr/share/java/${pkgname}/lib/"
  install -m644 "${srcdir}/${_builddir}/${_branchdir}/release/dist/${_buildver}/ext/"* \
                "${pkgdir}/usr/share/java/${pkgname}/ext/"

  # install scripts and change paths
  install -Dm755 "${srcdir}/${_builddir}/${_branchdir}/release/dist/${_buildver}/bin/run.sh" \
                 "${pkgdir}/usr/bin/${pkgname}"
  sed -i "s@DIRNAME=\"\`dirname \$0\`\"@DIRNAME=\"/usr/share/java/${pkgname}\"@g" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 "${srcdir}/${_builddir}/${_branchdir}/release/dist/${_buildver}/bin/run-console.sh" \
                 "${pkgdir}/usr/bin/${pkgname}-console"
  sed -i "s@DIRNAME=\"../lib/\"@DIRNAME=\"/usr/share/java/${pkgname}/lib/\"@g" "${pkgdir}/usr/bin/${pkgname}-console"

  # licenses (they are needed for plugins)
  cd "${srcdir}/${_builddir}/${_branchdir}/release/dist/${_buildver}/doc/license/"
  for _plugin in $(find * -type d); do
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/${_plugin}"
    install -m644 "${srcdir}/${_builddir}/${_branchdir}/release/dist/${_buildver}/doc/license/${_plugin}/"* \
                  "${pkgdir}/usr/share/licenses/${pkgname}/${_plugin}/"
  done

  # desktop
  install -Dm644 "${srcdir}/${_builddir}/${_branchdir}/release/dist/${_buildver}/doc/icons/pdfsam_basic.png" \
                 "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # docs
  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/examples"
  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/xsd"
  install -Dm644 "${srcdir}/${_builddir}/${_branchdir}/release/dist/${_buildver}/doc/pdfsam-1.1.0-tutorial.pdf" \
                 "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dm644 "${srcdir}/${_builddir}/${_branchdir}/release/dist/${_buildver}/doc/changelog-basic.txt" \
                 "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dm644 "${srcdir}/${_builddir}/${_branchdir}/release/dist/${_buildver}/doc/readme.txt" \
                 "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dm644 "${srcdir}/${_builddir}/${_branchdir}/release/dist/${_buildver}/doc/examples/"* \
                 "${pkgdir}/usr/share/doc/${pkgname}/examples/"
  install -Dm644 "${srcdir}/${_builddir}/${_branchdir}/release/dist/${_buildver}/doc/xsd/"* \
                 "${pkgdir}/usr/share/doc/${pkgname}/xsd/"
}
