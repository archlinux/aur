# Maintainer: Andrey Vihrov <andrey.vihrov at gmail.com>
# Contributor: Sven Schober <sschober (at) sssm (dot) de>
# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: SanskritFritz (gmail)

pkgname=wuala
pkgver=20141107 # Loader version
pkgrel=1
epoch=1
pkgdesc="A new way of storing, sharing and publishing files on the Internet.  It's free, simple and secure."
arch=('any')
url="http://www.wuala.com/"
license=('custom:wuala')
depends=('java-runtime' 'xdg-utils' 'desktop-file-utils' 'hicolor-icon-theme')
optdepends=('fuse: filesystem integration')
install="wuala.install"
source=("http://cdn.wuala.com/repo/other/wuala.tar.gz"
        "${pkgname}.png"
        "${pkgname}.desktop"
        "LICENSE")
sha256sums=('bf06e729fcfadcd88b2c84b5117bc292e838ad5dbd1d881fb5f689753533ccf7'
            '5652a80b03372e0a3dee76158a6bc8846d68dae0b453326cb314db5c39b1fac0'
            '19eef73cfa5c4d58c6bda076edab3fd63bfed06f01e5caee95432a67f1362510'
            'ff272cf434454a903a7f4eba82a6c34e48cc58eebb53c9f232028b61e2af8b31')

prepare() {
  cd "${srcdir}/${pkgname}"

  # Adjust loader3.jar location
  sed -i -e "s|loader3\.jar|/usr/share/java/${pkgname}/loader3\.jar|" wuala

  # Don't leave a waiting shell process when running Wuala
  sed -i -e 's/^  \$JAVA/  exec \$JAVA/' wuala
}

package() {
  cd "${srcdir}/${pkgname}"

  JAVA_DIR="${pkgdir}/usr/share/java/${pkgname}"
  DOC_DIR="${pkgdir}/usr/share/doc/${pkgname}"
  BIN_DIR="${pkgdir}/usr/bin"

  # Directories
  install -d "${JAVA_DIR}" "${DOC_DIR}" "${BIN_DIR}"

  # Launcher scripts
  install -m 755 wuala{,cmd} "${BIN_DIR}"

  # jar
  install -m 644 loader3.jar "${JAVA_DIR}"

  # Docs
  install -m 644 readme.txt copyright "${DOC_DIR}"

  cd "${srcdir}"

  # Desktop files
  install -D -m 644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m 644 "${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/${pkgname}.png"

  # License
  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
