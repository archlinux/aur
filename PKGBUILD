# Maintainer: Ruben
# Contributor: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=dnieremote-bin
pkgver=1.0
pkgrel=3
pkgdesc="DNIeRemote enable to use the smartphone as reader for Spanish DNI"
arch=('x86_64')
url="https://www.dnielectronico.es/"
license=('custom')
depends=('gtkmm3')
source=("https://www.dnielectronico.es/descargas/Apps/DNIeRemoteSetup_${pkgver}-${pkgrel}_amd64.deb"
        "https://www.dnielectronico.es/PDFs/DNIeRemote_user_manual.pdf")
noextract=("DNIeRemoteSetup_${pkgver}-${pkgrel}_amd64.deb")
sha256sums=('8e9d431c8019e11386f0f5f9232e77a147c5b6898055cc3033008418f0fdc94a'
            'afb1520fc5d3329d5ef271d89b6c7026d9208b79c52de0d491eaf543d642f9d0')

package() {
  bsdtar -O -xf "DNIeRemoteSetup_${pkgver}-${pkgrel}_amd64.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

  # Fix permissions
  find "${pkgdir}" -type f -exec chmod 644 {} \;
  find "${pkgdir}" -type d -exec chmod 755 {} \;
  chmod 755 "${pkgdir}/usr/bin/dnieremotewizard"
  chown -R root:root "${pkgdir}/usr"

  # Fix libs
  mv "${pkgdir}/usr/local/lib" "${pkgdir}/usr/lib"
  rm -rf "${pkgdir}/usr/local" "${pkgdir}/usr/lib/libdnieremotepkcs11.so" "${pkgdir}/usr/lib/libdnieremotepkcs11.so.0"
  ln -fsT "libdnieremotepkcs11.so.0.0.2" "${pkgdir}/usr/lib/libdnieremotepkcs11.so.0"
  ln -fsT "libdnieremotepkcs11.so.0.0.2" "${pkgdir}/usr/lib/libdnieremotepkcs11.so"

  # Install manual
  install -D -m644 "DNIeRemote_user_manual.pdf" "${pkgdir}/usr/share/doc/${pkgname}/README.pdf"
}
