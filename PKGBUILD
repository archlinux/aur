# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Based on thunderbird-beta-bin: Det <nimetonmaili g-mail>
# Based on [extra]'s thunderbird: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Based on tor-browser: grufo <madmurphy333 AT gmail DOT com>
#
# Before running makepkg, you must do this (as normal user):
#
#     gpg --auto-key-locate nodefault,wkd --locate-keys release@mozilla.com
#

pkgname=thunderbird-localized-beta-bin
_pkgname=thunderbird-beta
pkgver=111.0b4
pkgrel=1
pkgdesc='Standalone mail and news reader from mozilla.org — localized beta version'
arch=('i686' 'x86_64')
url="https://www.mozilla.org/thunderbird"
license=('GPL' 'LGPL' 'MPL')
depends=(
  glibc gtk3 libgdk-3.so libgtk-3.so mime-types dbus libdbus-1.so dbus-glib
  alsa-lib nss hunspell sqlite ttf-font libvpx libvpx.so zlib bzip2 libbz2.so
  botan libwebp libwebp.so libwebpdemux.so libevent libjpeg-turbo libffi
  libffi.so nspr gcc-libs libx11 libxrender libxfixes libxext libxcomposite
  libxdamage pango libpango-1.0.so cairo gdk-pixbuf2 icu libicui18n.so
  libicuuc.so freetype2 libfreetype.so fontconfig libfontconfig.so glib2
  libglib-2.0.so pixman libpixman-1.so gnupg json-c
)
optdepends=(
  'libotr: OTR support for active one-to-one chats'
  'libnotify: Notification integration'
)
provides=("thunderbird=$pkgver" "thunderbird-beta=$pkgver")
conflicts=("thunderbird-beta" "thunderbird-beta-bin")

_arch32='linux-i686'
_arch64='linux-x86_64'
_urlbase="https://ftp.mozilla.org/pub/thunderbird/releases/${pkgver}"
_archstr=$([[ "${CARCH}" == 'x86_64' ]] && echo -n "${_arch64}" || echo -n "${_arch32}")

_localemoz() {
  #
  # Checking if a `thunderbird` package exists for current locale; a different language can be
  # chosen by giving a `THUNDERBIRD_PKGLANG` environment variable to `makepkg`, for instance:
  #
  # THUNDERBIRD_PKGLANG='en-US' makepkg
  #

  if [[ -n "${THUNDERBIRD_PKGLANG}" ]]; then
    echo -n "${THUNDERBIRD_PKGLANG}"
    return 0
  fi

  local _fulllocale="$(locale | grep LANG | cut -d= -f2 | cut -d. -f1 | sed s/_/\-/)"
  local _shortlocale="$(locale | grep LANG | cut -d= -f2 | cut -d_ -f1)"

  if curl --output /dev/null --silent --head --fail "${_urlbase}/${_archstr}/${_fulllocale}/thunderbird-${pkgver}.tar.bz2"; then
    echo -n "${_fulllocale}"
  elif curl --output /dev/null --silent --head --fail "${_urlbase}/${_archstr}/${_shortlocale}/thunderbird-${pkgver}.tar.bz2"; then
    echo -n "${_shortlocale}"
  else
    echo -n 'en-US'
  fi

}

_language="$(_localemoz)"

validpgpkeys=('14F26682D0916CDD81E37B6D61B7B526D98F0353')

# Syntax: _dist_checksum 'linux-i686'/'linux-x86_64'
_dist_checksum() {
  curl --silent --fail "${_urlbase}/SHA256SUMS" | grep "${1}/${_language}/thunderbird-${pkgver}.tar.bz2" | cut -d ' ' -f1
}

source_i686=("${_urlbase}/${_arch32}/${_language}/thunderbird-${pkgver}.tar.bz2"{,.asc})
source_x86_64=("${_urlbase}/${_arch64}/${_language}/thunderbird-${pkgver}.tar.bz2"{,.asc})
source=("${pkgname}.desktop")

### IMPORTANT #################################################################
# No need for `makepkg -g`: the following sha256sums¸don't need to be updated #
# with each release, everything is done automatically! Leave them like this!  #
###############################################################################
sha256sums=('4890cc98cc21f3f2dbf4134627217b11167c73954a549fbe7ca0bbc8ca79b2d4')
sha256sums_i686=("$(_dist_checksum "${_arch32}")"
                 'SKIP')
sha256sums_x86_64=("$(_dist_checksum "${_arch64}")"
                   'SKIP')

prepare() {

  # use colors only if we have them
  if [[ $(which tput > /dev/null 2>&1 && tput -T "${TERM}" colors || echo -n '0') -ge 8 ]] ; then
    local _COL_YELLOW_='\e[0;33m'
    local _COL_LIGHTGREY_='\e[0;37m'
    local _COL_BRED_='\e[1;31m'
    local _COL_BBLUE_='\e[1;34m'
    local _COL_BWHITE_='\e[1;37m'
    local _COL_DEFAULT_='\e[0m'
  fi

  msg "Packaging ${pkgname} (language: ${_language})..."

  if [[ -z "${THUNDERBIRD_PKGLANG}" ]]; then
    echo -e "\n  ${_COL_BBLUE_}->${_COL_DEFAULT_} ${_COL_BRED_}NOTE:${_COL_DEFAULT_} If you want to package ${_COL_BWHITE_}${pkgname}${_COL_DEFAULT_} in a different language, please"
    echo -e "     set a \`${_COL_YELLOW_}THUNDERBIRD_PKGLANG${_COL_DEFAULT_}\` environment variable before running makepkg.\n"
    echo '     For instance:'
    echo -e "\n        ${_COL_LIGHTGREY_}THUNDERBIRD_PKGLANG='en-US' makepkg${_COL_DEFAULT_}\n"
  fi

}

package() {
  # Create directories
  msg2 "Creating directory structure..."
  install -d "$pkgdir"/usr/bin
  install -d "$pkgdir"/usr/share/applications
  install -d "$pkgdir"/opt

  msg2 "Moving stuff in place..."
  # Install
  cp -r thunderbird/ "${pkgdir}/opt/${_pkgname}"

  # Launchers
  ln -s "/opt/${_pkgname}/thunderbird" "${pkgdir}/usr/bin/${_pkgname}"
  # breaks application as of 68.0b1
  # ln -sf thunderbird "$pkgdir/opt/${_pkgname}/thunderbird-bin"

  # vendor.js
  _vendorjs="$pkgdir/opt/${_pkgname}/defaults/preferences/vendor.js"
  install -Dm644 /dev/stdin "${_vendorjs}" <<END
// Use LANG environment variable to choose locale
pref("intl.locale.matchOS", true);

// Disable default mailer checking.
pref("mail.shell.checkDefaultMail", false);

// Don't disable our bundled extensions in the application directory
pref("extensions.autoDisableScopes", 11);
pref("extensions.shownSelectionUI", true);
END

  # Desktop
  install -m644 "${pkgname}.desktop" "${pkgdir}"/usr/share/applications/

  # Icons
  for i in 16 22 24 32 48 256; do
    install -d "${pkgdir}"/usr/share/icons/hicolor/${i}x${i}/apps/
    ln -s "/opt/${_pkgname}/chrome/icons/default/default$i.png" \
          "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/${_pkgname}.png"
  done

  # Use system-provided dictionaries
  ln -Ts /usr/share/hunspell "${pkgdir}/opt/${_pkgname}/dictionaries"
  ln -Ts /usr/share/hyphen "${pkgdir}/opt/${_pkgname}/hyphenation"

  # Use system certificates
  ln -sf /usr/lib/libnssckbi.so "$pkgdir"/opt/$_pkgname/libnssckbi.so
}
