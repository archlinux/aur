# Maintainer: Alexander Minges <alexander.minges@gmail.com>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
pkgroot=ucsf-chimera
pkgname=ucsf-chimera
pkgver=1.17.3
pkgrel=1
pkgdesc='Extensible molecular modeling system'
url='https://rbvi.ucsf.edu/chimera/'
_source=https://rbvi.ucsf.edu/chimera/cgi-bin/secure/chimera-get.py
license=('custom:ucsf-chimera')
install=ucsf-chimera.install
arch=('x86_64')

_file="chimera-${pkgver}-linux_x86_64.bin"
_filepath="linux_x86_64/${_file}"

prepare(){
  cd "${srcdir}"

  if [ -f "${_file}" ]; then
    return
  fi

  echo 'IMPORTANT: By downloading you accept the UCSF Chimera Non-Commercial Software License Agreement!'
  echo 'IMPORTANT: The license agreement can be found here: https://rvbi.ucsf.edu/chimera/license.html'
  echo 'IMPORTANT: If you do not agree, please press Ctrl-C now.'
  echo 'IMPORTANT: Downloading in 10 seconds...'

  sleep 10

  _ident="$(curl -s -F file="${_filepath}" -F choice=Accept "${_source}")"
  _ident="$(echo "$_ident" | grep 'a href' | awk -F'[?=&]' '{print $4}')"
  _ident="$(echo "$_ident" | sed 's@+@ @g;s@%@\\x@g' | xargs -0 printf "%b")"
  curl -L -F file="${_filepath}" -F ident="${_ident}" -F choice=Notified "${_source}" -o "${_file}"
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


