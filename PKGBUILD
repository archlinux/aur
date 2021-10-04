# Maintainer: Ruben
# Contributor: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=dnieremote-bin
pkgver=1.0
pkgrel=4
pkgdesc="DNIeRemote enable to use the smartphone as reader for Spanish DNI"
arch=('x86_64')
url="https://www.dnielectronico.es/"
license=('custom')
depends=('gtkmm3')
source=("https://www.dnielectronico.es/descargas/Apps/DNIeRemote_${pkgver}-${pkgrel}_amd64.zip"
        "https://www.dnielectronico.es/PDFs/DNIeRemote_user_manual.pdf")
sha256sums=('c56acb2e01a75ad00dc2e6b940f4040140f979a9446415d5932118bd3a014bee'
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
  ln -fsT "libdnieremotepkcs11.so.0.0.3" "${pkgdir}/usr/lib/libdnieremotepkcs11.so.0"
  ln -fsT "libdnieremotepkcs11.so.0.0.3" "${pkgdir}/usr/lib/libdnieremotepkcs11.so"

  # Install manual
  install -D -m644 "DNIeRemote_user_manual.pdf" "${pkgdir}/usr/share/doc/${pkgname}/README.pdf"
}
