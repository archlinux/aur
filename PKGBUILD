# Maintainer: VitalyR <vr@vitalyr.com>
# Contributor: George Rawlinson <george@rawlinson.net.nz>
# Contributor: Cyano Hao <c@cyano.cn>
# Contributor: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>
# Contributor: Cedric MATHIEU <me.xenom @ gmail.com>

_name=firefox
_channel=nightly
_lang=en-US
_pkgname="${_name}-${_channel}"
pkgname="${_pkgname}-bin"
provides=('firefox-nightly')
conflicts=('firefox-nightly')
pkgdesc="Fast, Private & Safe Web Browser from Mozilla — Nightly Build (${_lang})"
url="https://www.mozilla.org/${_lang}/${_name}/${_channel}"

# Apparently there is an alternate URL - https://archive.mozilla.org/pub/
_base_url="https://ftp.mozilla.org/pub/${_name}/${_channel}"
_version=154.0a1
_build_id_raw=20260617101013
declare -A _build_id
_build_id=(
  [year]="${_build_id_raw:0:4}"
  [month]="${_build_id_raw:4:2}"
  [day]="${_build_id_raw:6:2}"
  [hour]="${_build_id_raw:8:2}"
  [min]="${_build_id_raw:10:2}"
  [sec]="${_build_id_raw:12:2}"
  [date]="${_build_id_raw:0:8}"
  [time]="${_build_id_raw:8:6}"
)

pkgver=154.0a1.20260617.101013

pkgrel=1

arch=('x86_64' 'aarch64')
license=('MPL' 'GPL' 'LGPL')
depends=(
  'dbus-glib'
  'gtk3'
  'libxt'
  'nss'
  'mime-types'
  'python'
)
optdepends=(
  'pulseaudio: audio support'
  'ffmpeg: h.264 video'
  'hunspell: spell checking'
  'hyphen: hyphenation'
  'libnotify: notification integration'
  'networkmanager: location detection via available WiFi networks'
  'speech-dispatcher: text-to-speech'
  'startup-notification: support for FreeDesktop Startup Notification'
)
_url="${_base_url}/${_build_id[year]}/${_build_id[month]}/${_build_id[year]}-${_build_id[month]}-${_build_id[day]}-${_build_id[hour]}-${_build_id[min]}-${_build_id[sec]}-mozilla-central"

_src_x86_64="${_name}-${_version}.${_lang}.linux-x86_64"
_src_aarch64="${_name}-${_version}.${_lang}.linux-aarch64"

_filename_x86_64="${_build_id[date]}-${_build_id[time]}-${_src_x86_64}"
_filename_aarch64="${_build_id[date]}-${_build_id[time]}-${_src_aarch64}"

source=(
  'firefox-nightly.desktop'
  'policies.json'
)

source_x86_64=(
  "${_filename_x86_64}.tar.xz::${_url}/${_src_x86_64}.tar.xz"
  "${_filename_x86_64}.tar.xz.asc::${_url}/${_src_x86_64}.tar.xz.asc")

source_aarch64=(
  "${_filename_aarch64}.tar.xz::${_url}/${_src_aarch64}.tar.xz"
  "${_filename_aarch64}.tar.xz.asc::${_url}/${_src_aarch64}.tar.xz.asc")


sha512sums=('320659477fc3319db4b73492aa6ce39c3a5dbc4ab8adc27440cb1e7ab69dad2cea83a57d7cd77eebfe833fb8a48c7e021bdca851f1be4840fae292afdba96664'
            '5ed67bde39175d4d10d50ba5b12063961e725e94948eadb354c0588b30d3f97d2178b66c1af466a6e7bd208ab694227a1391c4141f88d3da1a1178454eba5308')
sha512sums_x86_64=('b05c96948a0def2b16bae2ad643838353a7052b98777ca70b866e3f6a83019de1d6853223da4b7f3de8d29ecc14492d0c5e3f56089f31c25ea1bf33701acdf5c'
                   'SKIP')
sha512sums_aarch64=('70cb579f01546bee7116ef628792ac5fadcc033c433fd7f3125bff308a3e0463563c6581a9e0ac16047f1c76ca891d46175874b4d5c4ccd1aab26a2a3dc33b09'
                    'SKIP')

validpgpkeys=('14F26682D0916CDD81E37B6D61B7B526D98F0353') # Mozilla’s GnuPG release key

package() {
  OPT_PATH="usr/lib/${_pkgname}"

  # Install the package files
  install -d "${pkgdir}"/{usr/bin,usr/lib}
  cp -r ${_name} "${pkgdir}"/${OPT_PATH}
  ln -s "/${OPT_PATH}/${_name}" "${pkgdir}"/usr/bin/${_pkgname}

  # Install .desktop files
  install -Dm644 "${srcdir}"/${_pkgname}.desktop -t "${pkgdir}"/usr/share/applications

  # Install icons
  SRC_LOC="${srcdir}"/${_name}/browser
  DEST_LOC="${pkgdir}"/usr/share/icons/hicolor
  for i in 16 32 48 64 128; do
    install -Dm644 "${SRC_LOC}"/chrome/icons/default/default${i}.png "${DEST_LOC}"/${i}x${i}/apps/${_pkgname}.png
  done

  # Disable auto-updates
  install -Dm644 "${srcdir}"/policies.json -t "${pkgdir}"/${OPT_PATH}/distribution

  # Use system-provided dictionaries
  rm -rf "${pkgdir}"/${OPT_PATH}/{dictionaries,hyphenation}
  ln -sf /usr/share/hunspell "${pkgdir}"/${OPT_PATH}/dictionaries
  ln -sf /usr/share/hyphen "${pkgdir}"/${OPT_PATH}/hyphenation
}
