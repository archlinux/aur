# Maintainer: Ruben
# Contributor: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

_major=1
_minor=0
_patch=4
pkgname=dnieremote-bin
pkgver="${_major}.${_minor}.${_patch}"
pkgrel=1
pkgdesc="DNIeRemote enable to use the smartphone as reader for Spanish DNI"
arch=('x86_64')
url="https://www.dnielectronico.es/"
license=('custom')
depends=('gtkmm3')
source=("https://www.dnielectronico.es/descargas/Apps/DNIeRemote_${_major}.${_minor}-${_patch}_amd64.zip")
sha256sums=('c56acb2e01a75ad00dc2e6b940f4040140f979a9446415d5932118bd3a014bee')

prepare() {
  # Create docfile
  cat << EOF > README.txt
# DNIeRemote

Puedes acceder al manual de DNIeRemote en línea en la URL:
https://www.dnielectronico.es/descargas/Apps/manual_DNIeRemote.html

También es posible descargar una versión en PDF en la URL:
https://www.dnielectronico.es/PDFs/DNIeRemote_user_manual.pdf
EOF
}

package() {
  bsdtar -O -xf "DNIeRemoteSetup_${_major}.${_minor}-${_patch}_amd64.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

  # Fix permissions
  find "${pkgdir}" -type f -exec chmod 644 {} \;
  find "${pkgdir}" -type d -exec chmod 755 {} \;
  chmod 755 "${pkgdir}/usr/bin/dnieremotewizard"
  chown -R root:root "${pkgdir}/usr"

  # Fix libs
  mv "${pkgdir}/usr/local/lib" "${pkgdir}/usr/lib"
  rm -rf "${pkgdir}/usr/local" "${pkgdir}/usr/lib/libdnieremotepkcs11.so" "${pkgdir}/usr/lib/libdnieremotepkcs11.so.0"
  ln -fsT "libdnieremotepkcs11.so.0.0.3" "${pkgdir}/usr/lib/libdnieremotepkcs11.so.0"
  ln -fsT "libdnieremotepkcs11.so.0.0.3" "${pkgdir}/usr/lib/libdnieremotepkcs11.so"

  # Install docfile
  install -D -m644 "README.txt" "${pkgdir}/usr/share/doc/${pkgname}/README.txt"
}
