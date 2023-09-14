# Maintainer: Ruben
# Contributor: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

_major=1
_minor=0
_patch=5
pkgname=dnieremote-bin
pkgver="${_major}.${_minor}.${_patch}"
pkgrel=3
pkgdesc="DNIeRemote enable to use the smartphone as reader for Spanish DNI"
arch=('x86_64')
url="https://www.dnielectronico.es/"
license=('custom')
depends=('gtkmm3' 'openssl-1.1')
source=("https://www.dnielectronico.es/descargas/Apps/DNIeRemote_${_major}.${_minor}-${_patch}_amd64.zip")
b2sums=('03a1c73cb15192918a2494a087222c3d2d29a12e8ca762dbae4458b3bbcf6b0a8923122556cc54e53c483519d9a04741570ba56daf06289bfe55e1d96d9ba320')

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
  rm -rf "${pkgdir}/usr/share/pixmaps" "${pkgdir}/usr/local" "${pkgdir}/usr/lib/libdnieremotepkcs11.so" "${pkgdir}/usr/lib/libdnieremotepkcs11.so.0"
  ln -fsT "libdnieremotepkcs11.so.0.0.4" "${pkgdir}/usr/lib/libdnieremotepkcs11.so.0"
  ln -fsT "libdnieremotepkcs11.so.0.0.4" "${pkgdir}/usr/lib/libdnieremotepkcs11.so"

  # Install docfile
  install -D -m644 "README.txt" "${pkgdir}/usr/share/doc/${pkgname}/README.txt"
}
