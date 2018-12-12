# Maintainer: Cyano Hao < c at cyano dot cn >
# Contributor: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>
# Contributor: Cedric MATHIEU <me.xenom @ gmail.com>

_name=firefox
_channel=nightly
_lang=en-GB
_pkgname=${_name}-${_channel}
pkgname=${_name}-${_channel}-${_lang,,}
pkgdesc="Standalone Web Browser from Mozilla — Nightly build (${_lang})"
url="https://www.mozilla.org/${_lang}/${_name}/${_channel}"

_version=66.0a1
declare -A _build_id
_build_id=(
	[id]="$(curl https://ftp.mozilla.org/pub/${_name}/${_channel}/latest-mozilla-central-l10n/${_name}-${_version}.${_lang}.linux-${CARCH}.checksums | grep '.partial.mar' | cut -d' ' -f4 | grep -E -o '[[:digit:]]{14}' | sort | tail -n1)"
	[year]="${_build_id[id]:0:4}"
	[month]="${_build_id[id]:4:2}"
	[day]="${_build_id[id]:6:2}"
	[hour]="${_build_id[id]:8:2}"
	[min]="${_build_id[id]:10:2}"
	[sec]="${_build_id[id]:12:2}"
	[date]="${_build_id[id]:0:8}"
	[time]="${_build_id[id]:8:6}"
)

pkgver=${_version}.${_build_id[date]}.${_build_id[time]}
pkgrel=1
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
conflicts=('firefox-nightly')
depends=('dbus-glib' 'gtk3' 'libxt' 'nss' 'mime-types')
optdepends=('pulseaudio: audio support'
            'ffmpeg: h.264 video'
            'gtk2: flash plugin support'
            'hunspell: spell checking'
            'hyphen: hyphenation'
            'libnotify: notification integration'
            'networkmanager: location detection via available WiFi networks'
            'speech-dispatcher: text-to-speech'
            'startup-notification: support for FreeDesktop Startup Notification')

_url="https://ftp.mozilla.org/pub/${_name}/${_channel}/${_build_id[year]}/${_build_id[month]}/${_build_id[year]}-${_build_id[month]}-${_build_id[day]}-${_build_id[hour]}-${_build_id[min]}-${_build_id[sec]}-mozilla-central-l10n"
_src="${_name}-${_version}.${_lang}.linux-${CARCH}"
_filename="${_build_id[date]}-${_build_id[time]}-${_src}"
source=('firefox-nightly.desktop'
        'policies.json'
        "${_filename}.tar.bz2"::"${_url}/${_src}.tar.bz2"
        "${_filename}.tar.bz2.asc"::"${_url}/${_src}.tar.bz2.asc")
sha512sums=('b514abafc559ec03a4222442fa4306db257c3de9e18ed91a0b37cc9d7058a8e08a241442e54a67659a3ab4512a5dae6a0b94ea7a33d08ef0b8a76a9eac902095'
            '5ed67bde39175d4d10d50ba5b12063961e725e94948eadb354c0588b30d3f97d2178b66c1af466a6e7bd208ab694227a1391c4141f88d3da1a1178454eba5308'
            'SKIP'
            'SKIP')
validpgpkeys=('14F26682D0916CDD81E37B6D61B7B526D98F0353') # Mozilla’s GnuPG release key

package() {
  OPT_PATH="opt/${_pkgname}"

  # Install the package files
  install -d "${pkgdir}"/{usr/bin,opt}
  cp -r ${_name} "${pkgdir}"/${OPT_PATH}
  ln -s "/${OPT_PATH}/${_name}" "${pkgdir}"/usr/bin/${_pkgname}

  # Install .desktop files
  install -Dm644 "${srcdir}"/${_pkgname}.desktop -t "${pkgdir}"/usr/share/applications

  # Install icons
  SRC_LOC="${srcdir}"/${_name}/browser
  DEST_LOC="${pkgdir}"/usr/share/icons/hicolor
  for i in 16 32 48 64 128
  do
      install -Dm644 "${SRC_LOC}"/chrome/icons/default/default${i}.png "${DEST_LOC}"/${i}x${i}/apps/${_pkgname}.png
  done

  # Disable auto-updates
  install -Dm644 "${srcdir}"/policies.json -t "${pkgdir}"/${OPT_PATH}/distribution

  # Use system-provided dictionaries
  rm -rf "${pkgdir}"/${OPT_PATH}/{dictionaries,hyphenation}
  ln -sf /usr/share/hunspell "${pkgdir}"/${OPT_PATH}/dictionaries
  ln -sf /usr/share/hyphen "${pkgdir}"/${OPT_PATH}/hyphenation
}
