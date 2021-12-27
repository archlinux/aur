# Maintainer: Nicolas Stalder <n+archlinux@stalder.io>
# Based on banana9 package by: Hansruedi Patzen <hp@revy.ch>

pkgname=bananaplus
pkgver=10.0.10.21294
pkgrel=1
pkgdesc="Simple and fast accounting software"
url="https://www.banana.ch/"
arch=(x86_64)
license=(custom)
depends=(gtk3)

source=(https://www.banana.ch/accounting/files/$pkgname/exe/$pkgname.tgz)
# add dummy entries for `make generate-checksums` to create SHA256 instead of MD5 check sums
sha256sums=(34a680d4bd1be76d39a4793801891a8d140c8a2b27cff957e8526153510ba5fc)

# coredumps otherwise
options=(emptydirs !strip)

install_dir="/opt/${pkgname}/usr"

package() {
  rm $srcdir/$pkgname.tgz
  install -d "${pkgdir}/${install_dir}"

  cp -R $srcdir/usr/* $pkgdir/$install_dir
  mkdir -p $pkgdir/usr/bin
  ln -s /opt/bananaplus/usr/bin/bananaplus $pkgdir/usr/bin/bananaplus

  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  sed -i "s-Name=bananaplus-Name=Banana Accounting+-g" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  sed -i "s-Exec=usr/bin/bananaplus-Exec=/opt/bananaplus/usr/bin/bananaplus-g" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  install -Dm644 "${srcdir}/bananaplus.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/bananaplus.svg"
  install -Dm644 "${srcdir}/usr/share/mime-ac2.xml" "${pkgdir}/usr/share/mime-ac2.xml"

  license_source="${srcdir}/usr/share/License"
  for license_file in $(find "${license_source}" -type f -name "*.txt"); do
    install -Dm644 "${license_file}" "${pkgdir}/usr/share/licenses/${pkgname}/${license_file#${license_source}}"
  done

}
