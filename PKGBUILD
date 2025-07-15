# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Holger Döbler <holger.doebler@posteo.de>
pkgname=verapdf
pkgver=1.28.2
pkgrel=1
epoch=
pkgdesc="purpose-built, open source, file-format validator covering all PDF/A parts and conformance levels"
arch=('any')
url="https://verapdf.org/"
license=('GPL-3.0-or-later OR MPL-2.0')
groups=()
depends=('java-runtime' 'bash')
makedepends=('unzip')
source=("https://software.verapdf.org/rel/${pkgver%.*}/${pkgname}-greenfield-${pkgver}-installer.zip"
        "$pkgname.png::https://avatars1.githubusercontent.com/u/9946925?s=280&v=4"
        "$pkgname.desktop"
        "auto-install.xml")
noextract=("${pkgname}-greenfield-${pkgver}-installer.zip" 'auto-install.sh')
md5sums=('8d897ed4401321107f87b2fe9e1f4b16'
         '076b23717ab675281ed53dcf84471b89'
         'd84e22d0455afdf60816e182d66ce089'
         '312f8dc7e9c4a6ecfd25d75aff7b22c9')

prepare() {
  cd "${srcdir}"
  unzip "${pkgname}-greenfield-${pkgver}-installer.zip"
  sed -e "s;/usr/share/verapdf;${pkgdir}/usr/share/${pkgname};" < auto-install.xml > ${pkgname}-greenfield-${pkgver}/auto-install.xml
}

package() {
  cd "${srcdir}/${pkgname}-greenfield-${pkgver}"
  ./${pkgname}-install auto-install.xml
  rm "${pkgdir}/usr/share/verapdf/.installationinformation"
  rm -r "${pkgdir}/usr/share/verapdf/Uninstaller"
  mkdir -p "${pkgdir}/usr/bin"
  for f in verapdf verapdf-gui ; do
    ln -s "/usr/share/${pkgname}/$f" "${pkgdir}/usr/bin/$f"
  done
  install -Dm644 "${srcdir}/${pkgname}.png" \
    "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "${srcdir}/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
