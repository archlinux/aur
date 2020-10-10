# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>
# Contributor: Cedric MATHIEU <me.xenom @ gmail.com>

_name=flast-gecko
_channel=nightly
_lang=ja
pkgname=${_name}-${_channel}
pkgdesc="Standalone Web Browser from FascodeNetwork — Nightly build (${_lang})"
url="https://github.com/FascodeNet/flast-gecko/"
# _version=81.0a1
_version=`curl https://raw.githubusercontent.com/FascodeNet/flast-gecko/master/browser/config/version.txt`
#_release_id=2020-08-16-12-06
pkgver="${_version}.$(date +%Y%m%d%H%M)"
pkgrel=1
arch=(x86_64)
license=(MPL GPL LGPL)
depends=(dbus-glib gtk3 libxt nss mime-types)
optdepends=('pulseaudio: audio support'
            'ffmpeg: h.264 video'
            'hunspell: spell checking'
            'hyphen: hyphenation'
            'libnotify: notification integration'
            'networkmanager: location detection via available WiFi networks'
            'speech-dispatcher: text-to-speech')
_url="https://github.com/FascodeNet/flast-gecko/releases/latest/download"
_src="/firefox.${_lang}.linux"
_filename="$(date +%Y%m%d%H%M)-firefox-${_version}.${_lang}.linux"
source=("${pkgname}.desktop" 'policies.json')
source_x86_64=("${_filename}-x86_64.tar.bz2"::"${_url}/${_src}-x86_64.tar.bz2")
sha512sums=(SKIP SKIP)
sha512sums_x86_64=(SKIP)
package() {
  OPT_PATH="opt/${pkgname}"

  # Install the package files
  install -d "${pkgdir}"/{usr/bin,opt}
  cp -r firefox "${pkgdir}"/${OPT_PATH}
  ln -s "/${OPT_PATH}/firefox" "${pkgdir}"/usr/bin/${pkgname}

  # Install .desktop files
  install -Dm644 "${srcdir}"/${pkgname}.desktop -t "${pkgdir}"/usr/share/applications

  # Install icons
  SRC_LOC="${srcdir}"/firefox/browser
  DEST_LOC="${pkgdir}"/usr/share/icons/hicolor
  for i in 16 32 48 64 128
  do
      install -Dm644 "${SRC_LOC}"/chrome/icons/default/default${i}.png "${DEST_LOC}"/${i}x${i}/apps/${pkgname}.png
  done

  # Disable auto-updates
  install -Dm644 "${srcdir}"/policies.json -t "${pkgdir}"/${OPT_PATH}/distribution

  # Use system-provided dictionaries
  rm -rf "${pkgdir}"/${OPT_PATH}/{dictionaries,hyphenation}
  ln -sf /usr/share/hunspell "${pkgdir}"/${OPT_PATH}/dictionaries
  ln -sf /usr/share/hyphen "${pkgdir}"/${OPT_PATH}/hyphenation
}
