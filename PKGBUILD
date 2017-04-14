# Maintainer: Alex Talker ( alextalker at openmailbox dot org )
# Contributor: py_crash <agustin.ferrario@hotmail.com.ar>
# Based on kang's thunderbird-aurora
_name=thunderbird
_channel=earlybird
_milestone=54.0a2
_lang=ru

_release_year=2017
_release_month=04
_release_day=14
_release_time=$_release_year-$_release_month-$_release_day-00-40-26
_buildid=20170414004026

pkgname=$_name-$_channel-$_lang
pkgver=54.0a2.$_buildid
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
source_i686=("$_base_url/thunderbird-54.0a2.$_lang.linux-i686.tar.bz2")
source_x86_64=("$_base_url/thunderbird-54.0a2.$_lang.linux-x86_64.tar.bz2")

sha512sums=('d7c8c55e006b619cc9a78ab0ae0a89cbf5000b54a588dd4d14f7a961fff912069ea30b9c839121667549c086ffd21392abe3bade3abd1debdd5845d2da158538')
sha512sums_i686=('f64581953cabf579f6e2a0a188be2fec9063802d342d60025ee15be4122d11e19d6f94e15d4d2f325dd9c4c32b2cb48a2debd422a1ba1705b75e98d019ab7568')
sha512sums_x86_64=('39df2238343de4c02d24830bdb393aef1ff580816c442bdd5c30ae01b5abbd40c81f19c3500bc1fd05ab0404bd5b7c87f512cbca720e9d72560e4946e42e2d83')

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
