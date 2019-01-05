# Maintainer: Jeremy Audet <jerebear@protonmail.com>
# shellcheck shell=bash
# shellcheck disable=SC2034,SC2154

pkgname='gog-pyre'
pkgver='1.50427.11957.23366'
pkgrel=2
pkgdesc='A party-based RPG in which you lead a band of exiles to freedom. (GOG version)'
url='https://www.gog.com/game/pyre'
license=('custom')
groups=('games' 'gog')
# May also work on i686, but untested. Most 64-bit dependencies (e.g. sdl2) are
# bundled with the game.
arch=('x86_64')
depends=('binkplayer-bin')
makedepends=('unzip')
# Copy the game file into the current directory before building.
source=("local:///pyre_${pkgver//./_}.sh"
        "${pkgname}.desktop"
        "${pkgname}")
sha256sums=('f42b4c55975df69e8d98069dea72178320485f6bb8b8a1573490e10331fa17d2'
            'f66a8ad19f05d826afbe2a9375d1b6317f9166dc304ba1be2b92913064bf6971'
            '5b91e71101efe303986851df828d2e3934715232bfc12bb3634d1ec49cf70e42')

prepare() {
  # GOG games for linux appear to consist of a makeself script, mojosetup gzip
  # archive, and game zip archive, concatenated in that order. The makeself
  # script can extract the mojosetup archive. But mojosetup is an interactive
  # GUI application, which is useless in this context. As a fall-back solution,
  # this function calculates the number of bytes consumed by the makeself script
  # and mojosetup archive, and strips them.
  #
  # A hacky way of verifying $header_bytes is to call unzip on the game file and
  # see how many bytes it skips in search of the start of the zip archive.
  bash "pyre_${pkgver//./_}.sh" --dumpconf > conf

  local makeself_lines
  # shellcheck disable=SC1091
  makeself_lines="$(( "$(source conf && echo "${OLDSKIP}")" - 1 ))"

  local makeself_bytes
  makeself_bytes="$(
    head "pyre_${pkgver//./_}.sh" --lines "${makeself_lines}" \
    | wc --bytes
  )"

  local mojosetup_bytes
  # shellcheck disable=SC1091
  mojosetup_bytes="$(source conf && echo "${filesizes}")"

  local header_bytes
  header_bytes="$((makeself_bytes + mojosetup_bytes))"

  tail --bytes=+"$((header_bytes + 1))" "pyre_${pkgver//./_}.sh" > pyre.zip
  unzip -qd pyre pyre.zip

  # Pyre writes to DebugLog.txt, which results in a permission denied error.
  # AFAICT, this is a bug, and Pyre should write to a location suited for the
  # purpose, such as a subdirectory of the calling user's $XDG_CACHE_HOME.
  rm pyre/data/noarch/game/DebugLog.txt
  ln -s /dev/stdout pyre/data/noarch/game/DebugLog.txt
}

package() {
  # game files and launcher
  install -d "${pkgdir}/opt/${pkgname}"
  cp -rt "${pkgdir}/opt/${pkgname}" "${srcdir}/pyre/data/noarch/"*
  chmod 755 "${pkgdir}/opt/${pkgname}/start.sh"
  install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  # desktop environment integration
  install -Dm644 \
    "${srcdir}/pyre/data/noarch/support/icon.png" \
    "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 \
    "${srcdir}/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # license
  install -Dm644 \
    "${srcdir}/pyre/data/noarch/docs/End User License Agreement.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
