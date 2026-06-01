# PKGBUILD for ttf-ms-win-http-auto
# Maintainer: Tom Hale <tom at hale dot ee>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164

# This PKGBUILD downloads fonts from the latest Windows 11 Enterprise
# Evaluation ISO using httpdirfs + udfclient + wimlib to extract only the
# font files without downloading the entire multi-gigabyte ISO. Only the
# segments of the ISO required to access the font data are transferred via HTTP.

pkgname=ttf-ms-win-http-auto
pkgdesc='Microsoft Windows 11 TrueType fonts (downloaded via HTTP streaming)'
pkgver=10.0.26100.2894  # overridden by pkgver() after prepare() dumps install.wim info
pkgrel=1
arch=('any')
url='https://www.microsoft.com/en-us/evalcenter/download-windows-11-enterprise'
license=('custom')
depends=()
makedepends=('httpdirfs' 'udfclientfs-fuse3' 'wimlib' 'curl')
provides=('ttf-font' 'ttf-ms-fonts' 'ttf-ms-win11' 'ttf-tahoma' 'emoji-font')
conflicts=(ttf-ms-win{10,11} ttf-ms-win{10,11}-auto 'ttf-ms-fonts' 'ttf-tahoma' 'ttf-vista-fonts')
# ISO is NOT in source=() — httpdirfs byte-range streams only the segments
# that are actually read during extraction (~350 MiB), avoiding the full
# download that makepkg's DLAGENT would perform.
source=()
sha256sums=()

prepare() {
    echo $_unusedvbardir
  # Microsoft Evaluation Center link for the latest US English 64-bit ISO, listed at:
  # https://www.microsoft.com/en-us/evalcenter/download-windows-11-enterprise
  # When Microsoft releases a new build, the fwlink automatically forwards to the new ISO
  _fwlink='https://go.microsoft.com/fwlink/?linkid=2334167&clcid=0x4009&culture=en-us'
  # Allow override with a different link, eg for a different language
  [ "$TTF_MS_WIN_URL" ] && _fwlink="$TTF_MS_WIN_URL"
  _iso_url="$(curl -sIL -o /dev/null -w '%{url_effective}' "${_fwlink}")"
  _iso="${_iso_url##*/}"

  # Clean possible stale mounts from SIGKILL interrupted builds
  fusermount3 -uz mnt/iso 2>/dev/null || fusermount -uz mnt/iso 2>/dev/null || true
  fusermount3 -uz mnt/http 2>/dev/null || fusermount -uz mnt/http 2>/dev/null || true

  # Allow storing httpdirfs cache for faster rebuilds. About 350MB is used.
  # You'd probably only want to set this if you're debugging this PKGBUILD.
  # If $TTF_MS_WIN_HTTP_CACHE is set, user is responsible for their own cache cleanup
  if [ "$TTF_MS_WIN_HTTP_CACHE" ]; then
    httpdirfs_cache_opts=(--cache --cache-location "${TTF_MS_WIN_HTTP_CACHE}")
  fi

  # Cleanup trap for FUSE mounts — fires on any prepare() exit
  # shellcheck disable=SC2329  # _cleanup invoked indirectly via trap
  _cleanup() {
    local _status=$?
    set +e
    fusermount3 -uz mnt/iso 2>/dev/null || fusermount -uz mnt/iso 2>/dev/null || true
    fusermount3 -uz mnt/http 2>/dev/null || fusermount -uz mnt/http 2>/dev/null || true
    return "$_status"
  }
  trap _cleanup EXIT INT HUP TERM

  # Mount ISO URL via HTTP streaming — only fetches byte-range segments
  # that are actually read (font data ~200 MiB, not full ISO)
  httpdirfs "${httpdirfs_cache_opts[@]}" \
    --dl-seg-size 1 --max-conns 8 \
    --refresh-timeout 10 --single-file-mode \
    "${_iso_url}" mnt/http

  # Mount the ISO with a FUSE UDF filesystem
  udfclientfs --read-only "mnt/http/${_iso}" mnt/iso

  local _wim_image_idx=1  # Use the first image inside the .wim
  # Save WIM XML for image 1, converting UTF-16LE to UTF-8
  wiminfo "mnt/iso/sources/install.wim" "${_wim_image_idx}" --xml | iconv -f UTF-16LE -t UTF-8 > "${srcdir}/wiminfo.xml"

  # List all font files in image 1 (the sole Enterprise Evaluation image)
  # and extract them directly — no full-WIM decompression needed
  wimdir "mnt/iso/sources/install.wim" "${_wim_image_idx}" \
    | grep '/Windows/Fonts/.*\.tt[cf]$' \
    | xargs -r wimextract "mnt/iso/sources/install.wim" "${_wim_image_idx}" \
      --no-acls --dest-dir="${srcdir}/fonts"

  # Extract license files from the WIM (RTF EULA)
  wimdir "mnt/iso/sources/install.wim" "${_wim_image_idx}" \
    | grep -i '/Windows/System32/Licenses/neutral/.*license\.rtf$' \
    | xargs -r wimextract "mnt/iso/sources/install.wim" "${_wim_image_idx}" \
      --no-acls --dest-dir="${srcdir}/license"
}

# Version is only available after prepare() mounts the ISO and extracts wiminfo
pkgver() {
  # Extract version from <PKEYCONFIGVERSION> tag
  # Format: 10.0.26200.6584;2016-01-01T00:00:00Z
  # sed captures the 4-field version (digits.digits.digits.digits) after the tag:
  #   <PKEYCONFIGVERSION>10.0.26200.6584;DATE</PKEYCONFIGVERSION>
  #                     ^^^^^^^^^^^^^^^^
  local _ver
  _ver="$(sed -En 's/.*<PKEYCONFIGVERSION>[[:space:]]*([0-9]+\.[0-9]+\.[0-9]+\.[0-9]+).*/\1/p' "${srcdir}/wiminfo.xml")"
  # check _ver is non-empty and error i fit is:
  if [ ! "$_ver" ]; then
    printf "Couldn't derive version from %s data:\n" "${srcdir}/wiminfo.xml" >&2
    head -n20 "${srcdir}/wiminfo.xml"
    exit 1
  fi

  echo "$_ver"
}

package() {
  install -dm755 "${pkgdir}/usr/share/fonts/TTF"
  find "${srcdir}/fonts" -type f \( -name '*.ttf' -o -name '*.ttc' \) \
    -exec install -m644 {} "${pkgdir}/usr/share/fonts/TTF" \;

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  find "${srcdir}/license" -type f \
    -exec install -m644 {} "${pkgdir}/usr/share/licenses/${pkgname}" \;

  # No font registration needed — Arch's fontconfig pacman hook runs fc-cache -f automatically
}
# >/dev/null ### FIXME: fdsfads

# vim:set ts=2 sw=2 et ft=PKGBUILD:
