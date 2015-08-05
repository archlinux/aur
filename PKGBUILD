# Maintainer: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>

pkgroot=ucsf-chimera
pkgname=ucsf-chimera
pkgver=1.10.1
pkgrel=3
pkgdesc='Extensible molecular modeling system'
url='https://rbvi.ucsf.edu/chimera/'
_source=https://rbvi.ucsf.edu/chimera/cgi-bin/secure/chimera-get.py
license=('MIT')
install=ucsf-chimera.install
arch=('i686' 'x86_64')

case "${CARCH}" in
  (i686)
    _file="chimera-${pkgver}-linux.bin"
    _filepath="linux/${_file}"
  ;;
  (x86_64)
    _file="chimera-${pkgver}-linux_x86_64.bin"
    _filepath="linux_x86_64/${_file}"
  ;;
esac

prepare(){
  cd "${srcdir}"

  echo 'IMPORTANT: By downloading you accept the UCSF Chimera Non-Commercial Software License Agreement!'
  echo 'IMPORTANT: The license agreement can be found here: https://rvbi.ucsf.edu/chimera/license.html'
  echo 'IMPORTANT: If you do not agree, please press Ctrl-C now.'
  echo 'IMPORTANT: Downloading in 10 seconds...'

  sleep 10

  _ident="$(curl -s -F file="${_filepath}" -F choice=Accept "${_source}" | grep 'ident' | grep -Po '(?<=value=").*(?=")')"
  curl -L -F file="${_filepath}" -F ident="${_ident}" -F choice=Notified -F download=Start\ Download "${_source}" -o "${_file}"
}

package() {
  cd "${srcdir}"

  # Prepare the directory structure.
  install -dm755 "${pkgdir}/opt"

  # Run the installer.
  chmod +x "${_file}"
  echo "${pkgdir}/opt/ucsf-chimera" | "./${_file}"
}

# vim: ft=sh ts=2 sw=2 et
