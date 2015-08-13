# Maintainer: Andrey Vihrov <andrey.vihrov at gmail.com>
# Contributor: Sven Schober <sschober (at) sssm (dot) de>
# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: SanskritFritz (gmail)

pkgname=wuala
pkgver=1
pkgrel=20150323
epoch=1
pkgdesc="A new way of storing, sharing and publishing files on the Internet.  It's free, simple and secure."
arch=("any")
url="http://www.wuala.com/"
license=("custom:wuala")
depends=('java-runtime')
optdepends=('fuse: filesystem integration'
            'xdg-utils: desktop integration')
source=("http://cdn.wuala.com/repo/other/wuala.tar.gz"
        "${pkgname}.png"
        "${pkgname}.desktop"
        "LICENSE")
sha256sums=('bf06e729fcfadcd88b2c84b5117bc292e838ad5dbd1d881fb5f689753533ccf7'
            '20cee0643762403e5498dc3c0b9d1f958c21bfd1b2c776d6a2ab7a5989fb6e80'
            '7877eac17e3d447f52979bbc21e32b31267382a5cb418463ba47a9b259953a53'
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
