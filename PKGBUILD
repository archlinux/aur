# Maintainer: py_crash <agustin.ferrario@hotmail.com.ar>
# Based on kang's thunderbird-aurora
pkgname=thunderbird-earlybird-ru
_name=thunderbird
_channel=earlybird
_lang=ru
_pkgname="${_name}"-"${_channel}"
_milestone=39.0a2
pkgver=39.0a2.20150405004005
pkgrel=1
pkgdesc="Standalone Mail/News reader - Earlybird channel"
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
url="http://www.mozilla.org/${_name}/channel"
depends=('alsa-lib' 'cairo' 'dbus-glib' 'desktop-file-utils' 'fontconfig' 
          'freetype2' 'gtk2' 'hicolor-icon-theme' 'hunspell' 'libevent'
          'libjpeg' 'libmng' 'libpng' 'libvpx' 'libxt' 'mozilla-common'
          'nspr' 'nss' 'shared-mime-info' 'sqlite3' 'startup-notification')
optdepends=('libcanberra: for sound support')
replaces=("${_name}-aurora")
install="${_pkgname}.install"

_baseurl="http://ftp.mozilla.org/pub/mozilla.org/${_name}/nightly/latest-comm-aurora-l10n"
_filename="${_name}-${_milestone}.${_lang}.linux-${CARCH}"
_sha512sum="$(curl -vs "${_baseurl}/${_filename}.checksums" 2>&1 | grep "${_filename}.tar.bz2" | grep sha512 | cut -d " " -f1)"

source=("${_pkgname}.desktop"
        "${_baseurl}/${_filename}.tar.bz2")
sha512sums=('c6b9266b52e0328f1ff69e1d2dd3683d2904d85ea1b0f903e5781ea7a1347d0a079e4bfa01e2414498c1fe90e2aef2cc896d394ac7546155617eabeecf3dba30' 
            "${_sha512sum}" )

pkgver() {
          cd "${_name}"
          echo "${_milestone}.$(cat platform.ini|grep BuildID|cut -d "=" -f2 )"
         }

package() {
  install -d "${pkgdir}"/{usr/bin,opt}
  cp -a ${_name} "${pkgdir}/opt/${_pkgname}"
  ln -s "${pkgdir}/opt/${_pkgname}/${_name}" "${pkgdir}/usr/bin/${_name}"
  for i in 16x16 22x22 24x24 32x32 48x48 256x256; do
    install -Dm644 ${_name}/chrome/icons/default/default${i/x*/}.png "${pkgdir}/usr/share/icons/hicolor/${i}/apps/${_pkgname}.png"
  done
  install -Dm644 ${_pkgname}.desktop "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  rm -rf "${pkgdir}/opt/${_pkgname}/dictionaries"
#  ln -sf /usr/share/hunspell "${pkgdir}/opt/${_pkgname}/dictionaries"
}
