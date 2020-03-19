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
_product=thunderbird
pkgver=75.0b1
_major=${pkgver/rc*}
_build=${pkgver/*rc}
pkgrel=1
pkgdesc='Standalone mail and news reader from mozilla.org'
arch=('i686' 'x86_64')
url="https://www.mozilla.org/thunderbird"
license=('GPL' 'LGPL' 'MPL')
depends=(gtk3 mozilla-common libxt startup-notification mime-types dbus-glib alsa-lib
         nss hunspell sqlite ttf-font icu)
optdepends=('hunspell: Spell checking'
            'hyphen: Hyphenation'
            'libcanberra: Sound support')
provides=("$_product=$pkgver" "$_pkgname=$pkgver")
conflicts=("$_pkgname" "$_pkgname-bin")
install=$pkgname.install

_arch32='linux-i686'
_arch64='linux-x86_64'
_urlbase="https://ftp.mozilla.org/pub/thunderbird/releases/${pkgver}"
_archstr=$([[ "${CARCH}" == 'x86_64' ]] && echo -n "${_arch64}" || echo -n "${_arch32}")

_localemoz() {
  #
  # Checking if a `tor-browser` package exists for current locale; a different language can be
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

  if curl --output /dev/null --silent --head --fail "${_urlbase}/${_archstr}/${_fulllocale}/${_product}-${pkgver}.tar.bz2"; then
    echo -n "${_fulllocale}"
  elif curl --output /dev/null --silent --head --fail "${_urlbase}/${_archstr}/${_shortlocale}/${_product}-${pkgver}.tar.bz2"; then
    echo -n "${_shortlocale}"
  else
    echo -n 'en-US'
  fi

}

_language="$(_localemoz)"

validpgpkeys=('14F26682D0916CDD81E37B6D61B7B526D98F0353')

# Syntax: _dist_checksum 'linux-i686'/'linux-x86_64'
#linux-i686/ar/thunderbird-75.0b1.tar.bz2
_dist_checksum() {
  curl --silent --fail "${_urlbase}/SHA256SUMS" | grep "${1}\/${_language}\/${_product}-${pkgver}.tar.xz" | cut -d ' ' -f1
}

source_i686=("${_urlbase}/${_arch32}/${_language}/${_product}-${pkgver}.tar.bz2"{,.asc})
source_x86_64=("${_urlbase}/${_arch64}/${_language}/${_product}-${pkgver}.tar.bz2"{,.asc})
source=("${pkgname}.desktop")

### IMPORTANT #################################################################
# No need for `makepkg -g`: the following sha256sums¸don't need to be updated #
# with each release, everything is done automatically! Leave them like this!  #
###############################################################################
sha256sums=('e44c55501f650a4e80b9c353b81f33e07ca65808db831eff6ca616aded233827')
sha256sums_i686=('aa512fc24aa309bf77ecfe5c66435dfcd432ed900478871e13f3e0f978eb84bd'
                 'SKIP')
sha256sums_x86_64=('aa512fc24aa309bf77ecfe5c66435dfcd432ed900478871e13f3e0f978eb84bd'
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

  # we search and replace using sed with / as delimiter below so don't allow slashes in these vars.
  # makepkg already enforces that there're no slashes in ${pkgname}, so we don't check that again here.
  if [[ ${pkgver} = */* || ${_language} = */* || ${pkgdesc} = */* ]]; then
    error '${pkgver}, ${_language} and ${pkgdesc} for this package are not allowed to contain /' >&2
    return 1
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
  cp -r thunderbird/ "$pkgdir"/opt/$_pkgname

  # Launchers
  ln -s /opt/$_pkgname/thunderbird "$pkgdir"/usr/bin/$_pkgname
  # breaks application as of 68.0b1
  # ln -sf thunderbird "$pkgdir"/opt/$_pkgname/thunderbird-bin

  _vendorjs="$pkgdir/opt/$_pkgname/defaults/preferences/vendor.js"
  install -Dm644 /dev/stdin "$_vendorjs" <<END
// Use LANG environment variable to choose locale
pref("intl.locale.requested", "");

// Use system-provided dictionaries
pref("spellchecker.dictionary_path", "/usr/share/hunspell");

// Disable default mailer checking.
pref("mail.shell.checkDefaultMail", false);

// Don't disable our bundled extensions in the application directory
pref("extensions.autoDisableScopes", 11);
pref("extensions.shownSelectionUI", true);
END

  _distini="$pkgdir/opt/$_pkgname/distribution/distribution.ini"
  install -Dm644 /dev/stdin "$_distini" <<END
[Global]
id=archlinux
version=1.0
about=Mozilla Thunderbird for Arch Linux

[Preferences]
app.distributor=archlinux
app.distributor.channel=$pkgname
END

  for i in 16 22 24 32 48 64 128 256; do
    install -d "$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/
    ln -s /opt/$_pkgname/chrome/icons/default/default$i.png \
          "$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/$_pkgname.png
  done
  
  install -Dm644 ../$pkgname.desktop \
    "$pkgdir/usr/share/applications"

  # Use system-provided dictionaries
  ln -Ts /usr/share/hunspell "$pkgdir"/opt/$_pkgname/dictionaries
  ln -Ts /usr/share/hyphen "$pkgdir"/opt/$_pkgname/hyphenation

  # Install a wrapper to avoid confusion about binary path
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<END
#!/bin/sh
exec /opt/$_pkgname/thunderbird "\$@"
END

  # Use system certificates
  ln -sf /usr/lib/libnssckbi.so "$pkgdir"/opt/$_pkgname/libnssckbi.so
}
