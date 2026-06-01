# PKGBUILD for ttf-ms-win-http-auto
# Maintainer: Tom Hale <tom at hale dot ee>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164

# BUILD INSTRUCTIONS:
# -------------------
# This PKGBUILD downloads fonts from the latest Windows 11 Enterprise
# Evaluation ISO using httpdirfs + udfclient + wimlib to extract only the
# font files without downloading the entire multi-gigabyte ISO. Only the
# segments of the ISO that are required to access the font data are
# transferred via HTTP.
#
# The fwlink below resolves to the latest US English 64-bit Enterprise
# Evaluation ISO. When Microsoft releases a new build, the fwlink
# automatically points to the new ISO — no PKGBUILD edit needed.
#
# pkgver() reads BUILD and SPBUILD from the ISO filename. After the first
# successful prepare(), MAJOR and MINOR are also saved from WIM metadata
# so subsequent builds use the fully authoritative version.
pkgname=ttf-ms-win-http-auto
pkgrel=1
pkgdesc='Microsoft Windows 11 TrueType fonts (downloaded via HTTP streaming)'
arch=('any')
url='https://www.microsoft.com/en-us/evalcenter/download-windows-11-enterprise'
license=('custom')
depends=()
makedepends=('httpdirfs' 'udfclientfs-fuse3' 'wimlib' 'curl')
provides=('ttf-font' 'ttf-ms-fonts' 'ttf-ms-win11' 'ttf-tahoma' 'emoji-font')
conflicts=(ttf-ms-win{10,11} ttf-ms-win{10,11}-auto 'ttf-ms-fonts' 'ttf-tahoma' 'ttf-vista-fonts')

# Microsoft Evaluation Center fwlink for the latest US English 64-bit
# Windows 11 Enterprise Evaluation ISO. Resolved once at PKGBUILD parse
# time. The initial pkgver is derived from the ISO filename; prepare()
# later saves the authoritative version from WIM XML metadata.
_fwlink='https://go.microsoft.com/fwlink/?linkid=2334167&clcid=0x4009&culture=en-us'
_iso_url="$(curl -sIL -o /dev/null -w '%{url_effective}' "${_fwlink}")"
_iso="${_iso_url##*/}"
_build="${_iso%%\.*}"
_spbuild="${_iso#*.}"
_spbuild="${_spbuild%%.*}"
pkgver="10.0.${_build}.${_spbuild}"

# Persistent httpdirfs byte-range cache — survives makepkg -C across builds
_http_cache="${XDG_CACHE_HOME:-${HOME}/.cache}/${pkgname}"

# ISO is NOT in source=() — httpdirfs byte-range streams only the segments
# that are actually read during extraction (~200 MiB), avoiding the full
# download that makepkg's DLAGENT would perform.
source=()
sha256sums=()

prepare() {
  # Cleanup trap for FUSE mounts — fires on any prepare() exit
  # shellcheck disable=SC2329  # _cleanup invoked indirectly via trap
  _cleanup() {
    echo "+++++++++ clean up +++++++++"
    local _status=$?
    set +e
    fusermount3 -uz mnt/iso 2>/dev/null || fusermount -uz mnt/iso 2>/dev/null || true
    fusermount3 -uz mnt/http 2>/dev/null || fusermount -uz mnt/http 2>/dev/null || true
    return "$_status"
  }
  trap _cleanup EXIT INT HUP TERM

  cd "${srcdir}"

  # Clean possible stale mounts from SIGKILL interrupted builds
  fusermount3 -uz mnt/iso 2>/dev/null || fusermount -uz mnt/iso 2>/dev/null || true
  fusermount3 -uz mnt/http 2>/dev/null || fusermount -uz mnt/http 2>/dev/null || true
  rm -rf mnt fonts license  # preserve httpdirfs cache for speed on rebuilds

  mkdir -p mnt/http mnt/iso "${_http_cache}"

  # Mount ISO URL via HTTP streaming — only fetches byte-range segments
  # that are actually read (font data ~200 MiB, not full ISO)
  httpdirfs \
    --cache --cache-location "${_http_cache}" \
    --dl-seg-size 1 --max-conns 15 \
    --refresh-timeout 60 \
    --single-file-mode \
    "${_iso_url}" mnt/http

  # Mount the ISO with a FUSE UDF filesystem
  udfclientfs -r "mnt/http/${_iso}" mnt/iso

  # Save WIM XML metadata (raw XML document, no text prefix)
  wiminfo "mnt/iso/sources/install.wim" --extract-xml="${srcdir}/wiminfo.xml"

  # Derive authoritative version from WIM metadata; fall back to ISO filename
  local _ver_source
  {
    local _major _minor _build _spbuild
    _major="$(awk -F'[<>]' '/<MAJOR>/{print $3; exit}' "${srcdir}/wiminfo.xml")"
    _minor="$(awk -F'[<>]' '/<MINOR>/{print $3; exit}' "${srcdir}/wiminfo.xml")"
    _build="$(awk -F'[<>]' '/<BUILD>/{print $3; exit}' "${srcdir}/wiminfo.xml")"
    _spbuild="$(awk -F'[<>]' '/<SPBUILD>/{print $3; exit}' "${srcdir}/wiminfo.xml")"
    if [[ -n "${_major}" && -n "${_minor}" && -n "${_build}" && -n "${_spbuild}" ]]; then
      _ver_source='WIM XML'
      printf '%s.%s.%s.%s\n' "${_major}" "${_minor}" "${_build}" "${_spbuild}"
    else
      _ver_source='ISO filename'
      local _fb _fb_build _fb_spbuild
      _fb="${_iso#*.}"
      _fb_build="${_iso%%\.*}"
      _fb_spbuild="${_fb%%.*}"
      printf '10.0.%s.%s\n' "${_fb_build}" "${_fb_spbuild}"
    fi
  } > "${srcdir}/version"
  printf 'Derived version %s from %s\n' "$(cat "${srcdir}/version")" "${_ver_source}"

  # List all font files in image 1 (the sole Enterprise Evaluation image)
  # and extract them directly — no full-WIM decompression needed
  wimdir "mnt/iso/sources/install.wim" 1 \
    | grep '/Windows/Fonts/.*\.tt[cf]$' \
    | xargs -r wimextract "mnt/iso/sources/install.wim" 1 \
      --no-acls --dest-dir="${srcdir}/fonts"

  # Extract license files from the WIM (RTF EULA)
  wimdir "mnt/iso/sources/install.wim" 1 \
    | grep -i '/Windows/System32/Licenses/neutral/.*license\.rtf$' \
    | xargs -r wimextract "mnt/iso/sources/install.wim" 1 \
      --no-acls --dest-dir="${srcdir}/license"
}

# Derive pkgver from the ISO filename (available without mounting).
# After the first prepare() the WIM-derived .version cache takes priority.
# ISO filename format: "BUILD.SPBUILD.date-arch.CLIENTEVAL...en-us.iso"
pkgver() {
  # Use authoritative WIM version cache if available
  if [[ -f "${srcdir}/version" ]]; then
    cat "${srcdir}/version"
    return
  fi

  # Fallback: parse BUILD and SPBUILD from the ISO filename.
  # MAJOR and MINOR default to 10.0 for NT 10.0 (Windows 10/11).
  local _build _spbuild
  _build="${_iso%%\.*}"
  _spbuild="${_iso#*.}"
  _spbuild="${_spbuild%%.*}"
  printf '10.0.%s.%s\n' "${_build}" "${_spbuild}"
}

package() {
  install -dm755 "${pkgdir}/usr/share/fonts/TTF"
  find "${srcdir}/fonts" -type f \( -name '*.ttf' -o -name '*.ttc' \) \
    -exec install -m644 {} "${pkgdir}/usr/share/fonts/TTF" \;

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  find "${srcdir}/license" -type f \
    -exec install -m644 {} "${pkgdir}/usr/share/licenses/${pkgname}" \;

  # No font registration needed — Arch's fontconfig pacman hook runs fc-cache -f automatically
} >/dev/null

# vim:set ts=2 sw=2 et ft=PKGBUILD:
