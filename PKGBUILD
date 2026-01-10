# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Paul Kramer (https://aur.archlinux.org/account/gitterrost4, <gitterrost4[at)gmail]dot(com>)

_pkgname=brother-dcp7055w-cups
pkgname="${_pkgname}-bin"
pkgver=3.0.1
pkgrel=2
pkgdesc="CUPS wrapper for Brother DCP-7055W printer."
arch=(
  "i686"
  "x86_64"
)
url="https://support.brother.com/g/b/producttop.aspx?c=gb&lang=en&prod=dcp7055w_us_eu_as"
license=("GPL-2.0-or-later")
depends=(
  "cups"
  "lib32-glibc"
)
makedepends=(
  'libarchive' # For 'bsdtar'
  'sh'
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
source=(
  "https://download.brother.com/welcome/dlf005533/dcp7055wcupswrapper-${pkgver}-1.i386.deb"
  # https://download.brother.com/welcome/dlf101125/brgenml1cupswrapper-3.1.0-1.i386.deb
)
sha256sums=(
  'ca096dc07c519e5335f132f74ffcd1deef8863e6600d16a2cb044d65629137dd'
)

prepare() {
  cd "${srcdir}"

  if [ -d data ]; then
    rm -R data
  fi
  #if [ -d control ]; then
  #  rm -R control
  #fi
  mkdir -p data
  #mkdir -p control

  printf '%s\n' "   > Extracting contents of debian archive ..."
  bsdtar -C data -xvf data.tar.gz
  #bsdtar -C control -xvf control.tar.gz
}

package() {
  cd "${srcdir}/data"

  install -Dvm0755 -t "${pkgdir}/opt/brother/Printers/DCP7055W/cupswrapper"  "./opt/brother/Printers/DCP7055W/cupswrapper"/{brcupsconfig4,brother_lpdwrapper_DCP7055W}
  install -Dvm0644 -t "${pkgdir}/opt/brother/Printers/DCP7055W/cupswrapper"  "./opt/brother/Printers/DCP7055W/cupswrapper"/brother-DCP-7055W-cups-en.ppd

  install -dvm0755 "${pkgdir}/usr/lib/cups/filter"
  ln -sv "/opt/brother/Printers/DCP7055W/cupswrapper"/brother_lpdwrapper_DCP7055W     "${pkgdir}/usr/lib/cups/filter"/

  install -dvm0755 "${pkgdir}/usr/share/cups/model/Brother"
  ln -sv "/opt/brother/Printers/DCP7055W/cupswrapper"/brother-DCP-7055W-cups-en.ppd  "${pkgdir}/usr/share/cups/model/Brother"/
}
