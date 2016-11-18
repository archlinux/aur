# Maintainer: Alex Talker ( alextalker at openmailbox dot org )
# Contributor: py_crash <agustin.ferrario@hotmail.com.ar>
# Based on kang's thunderbird-aurora
pkgname=thunderbird-earlybird
_name=thunderbird
_channel=earlybird
_milestone=52.0a2

_release_year=2016
_release_month=11
_release_day=18
_release_time=$_release_year-$_release_month-$_release_day-00-40-04
_buildid=20161118004004


pkgver=52.0a2.$_buildid
pkgrel=1
pkgdesc="Standalone Mail/News reader - Earlybird channel"
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
url="http://www.mozilla.org/${_name}/channel"
depends=('alsa-lib' 'cairo' 'dbus-glib' 'desktop-file-utils' 'fontconfig' 
          'freetype2' 'gtk3' 'hicolor-icon-theme' 'hunspell' 'libevent'
          'libjpeg' 'libmng' 'libpng' 'libvpx' 'libxt' 'mozilla-common'
          'nspr' 'nss' 'shared-mime-info' 'sqlite3' 'startup-notification')
optdepends=('libcanberra: for sound support')
replaces=("${_name}-aurora")
install="${pkgname}.install"

source=("${pkgname}.desktop")

_base_url="http://ftp.mozilla.org/pub/thunderbird/nightly/$_release_year/$_release_month/$_release_time-comm-aurora"
source_i686=("$_base_url/thunderbird-52.0a2.en-US.linux-i686.tar.bz2")
source_x86_64=("$_base_url/thunderbird-52.0a2.en-US.linux-x86_64.tar.bz2")

sha512sums=('a36bb5710b9cd6637cf6f538808e2fba8c99fdd1d486446ff9ee8094ca30b5592c17b3e808cae1da7ff2b28123f54902ed4ee1501585a8dcfc54d581588638d3')
sha512sums_i686=('2e5d0fb6700182e0baa38c6c8cd3beaac91e00d6df20a703cacf9e0f1e7ef50920a1faac96fe30937e150bfe2fc4757b41d9bbb7f03f1c2d71ad2627c08b6805')
sha512sums_x86_64=('b82cafba11b6db45e93f84bc7af6da47960974b3fe1c1ce66c32fa49ecfa5c829f150e983f7a11a8505aa4ebfea2d6488ba021e99728ff9b3050a0090d8647d8')

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
