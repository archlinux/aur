# Maintainer:  <none>
# Contributor: dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Martin Dünkelmann <nc-duenkekl3@netcologne.de> (https://aur.archlinux.org/account/MartinX3)

## The download URL/ filename does not change with version update. Need to check filenames inside downloaded ZIP file, or front webpage, for version.
_upstreamlistingurl='https://www.kyoceradocumentsolutions.eu/en/support/downloads.name-L2V1L2VuL21mcC9FQ09TWVNNNDEzMklETg==.html'
#_upstreamsourcedownloadpath='https://www.kyoceradocumentsolutions.de/content/download-center/de/drivers/all'
_upstreamsourcedownloadpath='https://www.kyoceradocumentsolutions.eu/content/download-center/eu/drivers/all/'
_upstreamsourcefilename='SANE_Driver_zip.download.zip'
_get_pkgver() {
  local _debarch
  case "${CARCH}" in
    'i386'|'i486'|'i586'|'i686')
      _debarch=i386
    ;;
    'x86_64')
      _debarch=amd64
    ;;
  esac
  printf '%s\n' "  >> Getting upstream software version for architecture '${CARCH}' ..." > /dev/stderr
  _ver="$(curl -L "${_upstreamlistingurl}" 2>/dev/null| grep -E "SANE Driver \([0-9\.]+\)" | head -n1 | sed -E 's|^.*SANE Driver \(([0-9.]+)\).*$|\1|')"
  printf '%s' "${_ver}"
}

pkgname=kyocera-sane
pkgver="$(_get_pkgver)"
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
license=('LicenseRef-proprietary')
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
  "${pkgname}-${pkgver}_SANE-Driver.zip::${_upstreamsourcedownloadpath}/${_upstreamsourcefilename}"
  'README.txt'
)
sha256sums=(
  '3076b7ae5e48564568ab7c660da3c77d6059b3fe96056f4df2a38544b579f8ab'
  '945f922065e8278d2ec6e0c1e8ce6851834359cd02ff85534fa3d7baccec6ffe'
)

prepare() {
    cd "${srcdir}"
    mkdir -p build
    local _debarch
    case "${CARCH}" in
      'i386'|'i486'|'i586'|'i686')
        _debarch=i386
      ;;
     'x86_64')
        _debarch=amd64
      ;;
    esac
    bsdtar xvf "${pkgname}_${pkgver}_${_debarch}.deb"
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
