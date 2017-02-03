# Maintainer: Alex Talker ( alextalker at openmailbox dot org )
# Contributor: py_crash <agustin.ferrario@hotmail.com.ar>
# Based on kang's thunderbird-aurora
_name=thunderbird
_channel=earlybird
_milestone=53.0a2
_lang=ru

_release_year=2017
_release_month=02
_release_day=03
_release_time=$_release_year-$_release_month-$_release_day-00-40-20
_buildid=20170203004020

pkgname=$_name-$_channel-$_lang
pkgver=53.0a2.$_buildid
pkgrel=1
pkgdesc="Standalone Mail/News reader - Earlybird channel [ $_lang ]"
url="http://www.mozilla.org/${_name}/channel"
license=('MPL' 'GPL' 'LGPL')

arch=('i686' 'x86_64')
depends=('alsa-lib' 'cairo' 'dbus-glib' 'desktop-file-utils' 'fontconfig' 
          'freetype2' 'gtk3' 'hicolor-icon-theme' 'hunspell' 'libevent'
          'libjpeg' 'libmng' 'libpng' 'libvpx' 'libxt' 'mozilla-common'
          'nspr' 'nss' 'shared-mime-info' 'sqlite3' 'startup-notification')
optdepends=('libcanberra: for sound support')

replaces=("${_name}-aurora")
install="${pkgname}.install"

source=("${pkgname}.desktop")

_base_url="http://ftp.mozilla.org/pub/thunderbird/nightly/$_release_year/$_release_month/$_release_time-comm-aurora-l10n"
source_i686=("$_base_url/thunderbird-53.0a2.$_lang.linux-i686.tar.bz2")
source_x86_64=("$_base_url/thunderbird-53.0a2.$_lang.linux-x86_64.tar.bz2")

sha512sums=('d7c8c55e006b619cc9a78ab0ae0a89cbf5000b54a588dd4d14f7a961fff912069ea30b9c839121667549c086ffd21392abe3bade3abd1debdd5845d2da158538')
sha512sums_i686=('b2df240d9058d3e78e55c137275fdc325b522fe78c6f43048ef81da261b8d73372a88ad3a6455605919b1e0ba92ce2909b65624aca94f3d71e868620b6d9eb9a')
sha512sums_x86_64=('fd8a770952a2466b28f5ae7f97c05126629f5fc96e04ad040c38bb35887f68ce171b2b892a4eafbbf309280717523fde98e12c097e20e0bff08c778b656c3da7')

pkgver() {
    cd "${_name}"
    echo "${_milestone}.$(cat platform.ini|grep BuildID|cut -d "=" -f2 )"
}

package() {
  install -d "${pkgdir}"/{usr/bin,opt}

  cp -a ${_name} "${pkgdir}/opt/${pkgname}"
  ln -s /opt/${pkgname}/${_name} "${pkgdir}/usr/bin/${pkgname}"

  for i in 16x16 22x22 24x24 32x32 48x48 256x256; do
    install -Dm644 ${_name}/chrome/icons/default/default${i/x*/}.png "${pkgdir}/usr/share/icons/hicolor/${i}/apps/${pkgname}.png"
  done

  install -Dm644 ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  rm -rf "${pkgdir}/opt/${pkgname}/dictionaries"
  ln -sf /usr/share/hunspell "${pkgdir}/opt/${pkgname}/dictionaries"
}
