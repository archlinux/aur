# Maintainer: Forest Crossman <cyrozap at gmail dot com>

pkgname=digilent.adept.runtime
pkgver=2.30.1
pkgrel=1
pkgdesc="The Adept Runtime consists of the shared libraries, firmware images, and configuration files necessary to communicate with Digilent's devices."
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://reference.digilentinc.com/reference/software/adept/start"
license=('custom')
depends=('libusb')
options=('!strip')
backup=('etc/digilent-adept.conf' 'etc/ld.so.conf.d/digilent-adept-libraries.conf' 'etc/udev/rules.d/52-digilent-usb.rules')
source_aarch64=("https://files.digilent.com/Software/Adept2%20Runtime/${pkgver}/${pkgname}_${pkgver}_arm64.deb")
source_armv6h=("https://files.digilent.com/Software/Adept2%20Runtime/${pkgver}/${pkgname}_${pkgver}_armhf.deb")
source_armv7h=($source_armv6h)
source_x86_64=("https://files.digilent.com/Software/Adept2%20Runtime/${pkgver}/${pkgname}_${pkgver}_amd64.deb")
sha256sums_aarch64=('8cd460e3fbcafb8b6d72dced44edcc9ba68ea72ffe6bba49e0dfaad71ba07392')
sha256sums_armv6h=('8a4cd3a540d45985d8c37bf5ec69993b523ed1d93635bb9a1ea008fbfe25b0ad')
sha256sums_armv7h=($sha256sums_armv6h)
sha256sums_x86_64=('e5e51d2640c2ff34ef3b436f3bdf37838120b15160d73dfbab82e90773b6b372')

# Need to change the user agent string because Cloudflare may block curl and wget
DLAGENTS=('https::/usr/bin/curl -qgb "" -fLC - --retry 3 --user-agent Mozilla --retry-delay 3 -o %o %u')

package() {
  # Extract
  tar -xf data.tar.gz --exclude="usr/share/lintian" -C "${pkgdir}"/

  # Correct paths
  [ -d "${pkgdir}"/usr/lib64 ] && mv "${pkgdir}"/usr/{lib64,lib}
  [ -d "${pkgdir}"/usr/sbin ] && mv "${pkgdir}"/usr/{sbin,bin}

  # License files
  install -dm 755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/copyright"
  ln -s "/usr/share/doc/${pkgname}/EULA" "${pkgdir}/usr/share/licenses/${pkgname}/EULA"
}
