# Maintainer: Alex Talker ( alextalker at openmailbox dot org )
# Contributor: py_crash <agustin.ferrario@hotmail.com.ar>
# Based on kang's thunderbird-aurora
_name=thunderbird
_channel=earlybird
_milestone=54.0a2
_lang=ru

_release_year=2017
_release_month=05
_release_day=05
_release_time=$_release_year-$_release_month-$_release_day-00-40-04
_buildid=20170505004004

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
sha512sums_i686=('2e74ae517e4ceaf4ebedc369d3e3e58873f865e959896163069dc40d4de69d94b8f9716262cf4a69184c00a598b24730b8033084b6476300662921119f6994cc')
sha512sums_x86_64=('f235cc2306ce8bcaf00007440f7f56d2660b668b498696169fc154dc158f898652bff778ef2d69eeb65a0f27a059817e40290ffa768db5ed858ece0f8807da63')

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
