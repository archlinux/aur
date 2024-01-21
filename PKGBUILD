# Maintainer:  Martin Dünkelmann <nc-duenkekl3@netcologne.de> (https://aur.archlinux.org/account/MartinX3)
# Contributor: dreieck (https://aur.archlinux.org/account/dreieck)
# Maintainer:  Martin Dünkelmann <nc-duenkekl3@netcologne.de> (https://aur.archlinux.org/account/MartinX3)

pkgname=kyocera-sane
pkgver=2.1.4406
pkgrel=1
pkgdesc='Kyocera sane scanner support package for many Kyocera printers.'
arch=(
  'i386'
  'i486'
  'i586'
  'i686'
  'x86_64'
)
url='https://www.kyocera.com/'
license=('custom')
depends=(
  'freeimage'
  'gcc-libs'
  'glibc'
  'libtiff5'
  'libusb'
  'libjpeg'
  'openssl-1.1'
  'sane'
)
makedepends=()
source=(
  'https://www.kyoceradocumentsolutions.de/content/download-center/de/drivers/all/SANE_Driver_zip.download.zip'
  'README.txt'
)
sha256sums=(
  '6729c68ab90a1e8f4edef3fc4a35942e965cbded11d4d51b7a897bc98eb02fae'
  '945f922065e8278d2ec6e0c1e8ce6851834359cd02ff85534fa3d7baccec6ffe'
)

prepare() {
    cd "${srcdir}"
    mkdir -p build
    case "${CARCH}" in
      'i386'|'i486'|'i586'|'i686')
        bsdtar xvf "${pkgname}_${pkgver}_i386.deb"
      ;;
      'x86_64')
        bsdtar xvf "${pkgname}_${pkgver}_amd64.deb"
      ;;
    esac
    bsdtar xvf "${srcdir}/data.tar.xz" -C "${srcdir}/build"
}

build() {
  cd "${srcdir}/build"

  # From .deb postinst
  install -dvm755 "etc/sane.d/dll.d"
  touch "etc/sane.d/dll.d/kyocera.conf"
  printf '%s\n' 'kyocera'          >> "etc/sane.d/dll.d/kyocera.conf"
  printf '%s\n' 'kyocera_gdi_a3'   >> "etc/sane.d/dll.d/kyocera.conf"
  printf '%s\n' 'kyocera_wc3'      >> "etc/sane.d/dll.d/kyocera.conf"
  printf '%s\n' 'kyocera_wc3_usb'  >> "etc/sane.d/dll.d/kyocera.conf"

  chmod 644 "etc/sane.d"/*.conf
  chmod 644 "etc/sane.d/dll.d"/*.conf

  # Move UDEV rule do documentation, since it creates overly persmissive permissions.
  mv -v "etc/udev/rules.d/40-scanner-permissions.rules" "usr/share/doc/${pkgname}"/
  chmod 644 "usr/share/doc/${pkgname}/40-scanner-permissions.rules"
  rmdir -v "etc/udev/rules.d"

  # Move the license into place.
  install -Dvm644 "usr/share/doc/${pkgname}/copyright" "usr/share/licenses/${pkgname}/COPYRIGHT"
  rm "usr/share/doc/${pkgname}/copyright"

  # Clean unnecessary files.
  case "${CARCH}" in
    'i386'|'i486'|'i586'|'i686')
      rm -r "usr/lib/i386-linux-gnu"
    ;;
    'x86_64')
      rm -r "usr/lib/x86_64-linux-gnu"
    ;;
  esac
  rm -r "usr/local"
}

package() {
  cd "${srcdir}/build"

  # Move files into place
  cp -rv * "${pkgdir}"/

  install -Dvm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${srcdir}/README.txt"
}
