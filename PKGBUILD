# Maintainer: Alex Talker ( alextalker at openmailbox dot org )
# Contributor: py_crash <agustin.ferrario@hotmail.com.ar>
# Based on kang's thunderbird-aurora
_name=thunderbird
_channel=earlybird
_milestone=52.0a2
_lang=ru

_release_year=2016
_release_month=12
_release_day=31
_release_time=$_release_year-$_release_month-$_release_day-00-40-03
_buildid=20161231004003

pkgname=$_name-$_channel-$_lang
pkgver=52.0a2.$_buildid
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
source_i686=("$_base_url/thunderbird-52.0a2.$_lang.linux-i686.tar.bz2")
source_x86_64=("$_base_url/thunderbird-52.0a2.$_lang.linux-x86_64.tar.bz2")

sha512sums=('d7c8c55e006b619cc9a78ab0ae0a89cbf5000b54a588dd4d14f7a961fff912069ea30b9c839121667549c086ffd21392abe3bade3abd1debdd5845d2da158538')
sha512sums_i686=('9aa97bcf9b520d64bdd36eefc3cb9198041f7ae3cf31eaa8e78e35d6eab93cd9005bb59874e4cf5018b38f7ec2594cdb92f9a9962362e30f47d7e8d85021371c')
sha512sums_x86_64=('09677f26aff51123ad21d6322f868d3f5985390806e4d425c116e2273c44f6ded48eb06be8d8e8d0cd5d880684ee3fcc0657e6b2b4e7fef6e09d9187f37ee60d')

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
