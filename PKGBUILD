# Maintainer: Tom Hale <tom at hale dot ee>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164

# This PKGBUILD downloads fonts from the latest Windows 11 Enterprise
# Evaluation ISO using httpdirfs + udfclient + wimlib to extract only the
# font files without downloading the entire multi-gigabyte ISO. Only the
# segments of the ISO required to access the font data are transferred via HTTP.

pkgname=ttf-ms-win-httpdirfs
pkgdesc='Microsoft Windows TrueType fonts (downloaded via HTTP streaming)'
pkgver=10.0.26100.2894  # overridden by pkgver() after prepare() dumps install.wim info
pkgrel=1
arch=('any')
url='https://www.microsoft.com/en-us/evalcenter/download-windows-11-enterprise'
license=('custom')
depends=()
makedepends=('curl' 'httpdirfs' 'udfclientfs-fuse3' 'wimlib')
provides=('ttf-font' 'ttf-ms-fonts' 'ttf-ms-win11' 'ttf-tahoma' 'emoji-font')
conflicts=(ttf-ms-win{10,11} ttf-ms-win{10,11}-auto 'ttf-ms-fonts' 'ttf-tahoma' 'ttf-vista-fonts')
# ISO is NOT in source=() — httpdirfs byte-range streams only the segments
# that are actually read during extraction (~350 MiB), avoiding the full
# download that makepkg's DLAGENT would perform.
source=()
sha256sums=()

prepare() {
  local _redir_url _iso_url _iso
  local _http_mount='mnt/http' _iso_mount='mnt/iso'
  local _wim_image="${_iso_mount}/sources/install.wim"
  # Microsoft Evaluation Center link for the latest US English 64-bit ISO, listed at:
  # https://www.microsoft.com/en-us/evalcenter/download-windows-11-enterprise
  # When Microsoft releases a new build, the fwlink automatically forwards to the new ISO
  # _fwlink='https://go.microsoft.com/fwlink/?linkid=2334167'
  # The above is often slow and sometimes times out, but it redirects to:
  _redir_url='https://aka.ms/Win11E-ISO-25H2-en-us'
  # Allow override with a different link, eg for a different language
  [ "${TTF_MS_WIN_URL:-}" ] && _redir_url="$TTF_MS_WIN_URL"

  # Get the real URL from the forwarding URL. It should return something like:
  # https://software-static.download.prss.microsoft.com/dbazure/888969d5-f34g-4e03-ac9d-1f9786c66749/26200.6584.250915-1905.25h2_ge_release_svc_refresh_CLIENTENTERPRISEEVAL_OEMRET_x64FRE_en-us.iso
  _iso_url="$(curl -sIL -w '%{url_effective}' -o /dev/null --retry 30 --retry-delay 1 "${_redir_url}")" \
    || { echo "curl error: couldn't get link to .iso file" >&2; exit 1; }
  _iso="${_iso_url##*/}"

  # Clean possible stale mounts from SIGKILL interrupted builds
  fusermount3 -uz "${_iso_mount}" 2>/dev/null || true
  fusermount3 -uz "${_http_mount}" 2>/dev/null || true

  # Allow storing httpdirfs cache for faster rebuilds. About 350MB is used.
  # You'd probably only want to set this if you're debugging this PKGBUILD.
  # If $TTF_MS_WIN_HTTP_CACHE is set, user is responsible for their own cache cleanup
  if [ "${TTF_MS_WIN_HTTP_CACHE:-}" ]; then
    _httpdirfs_cache_opts=(--cache --cache-location "${TTF_MS_WIN_HTTP_CACHE}")
  fi

  # Cleanup trap for FUSE mounts — fires on any prepare() exit
  # shellcheck disable=SC2329  # _cleanup invoked indirectly via trap
  _traps_saved="$(trap)"
  _cleanup() {
    local _status=$?
    set +e
    trap '' EXIT HUP INT QUIT TERM
    echo "Cleaning up mount points..."
    fusermount3 -uz "${_iso_mount}" 2>/dev/null || true
    fusermount3 -uz "${_http_mount}" 2>/dev/null || true
    # Restore standard pkgbuild traps
    eval "${_traps_saved}"
    return "${_status}"
  }
  trap _cleanup EXIT HUP INT QUIT TERM

  # Create mount points
  mkdir -p "${_http_mount}" "${_iso_mount}"

  # Mount ISO URL via HTTP streaming — only fetches byte-range segments
  # that are actually read (font data ~350 MiB, not full ISO)
  #
  # Default log level includes noisy INFO. Set to 7 for fatal | error | warning only.
  # https://github.com/fangfufu/httpdirfs/blob/26cce591de8518f3dd09c45ed241d1051411bc05/src/log.h#L35-L50
  echo "Mounting HTTP source via httpdirfs..."
  HTTPDIRFS_LOG_LEVEL=7 httpdirfs "${_httpdirfs_cache_opts[@]}" \
    --dl-seg-size 1 --retry-wait 1 --single-file-mode \
    "${_iso_url}" "${_http_mount}" > /dev/null

  # LinkTable_print:  Invalid link count: 0

  # Mount the ISO UDF filesystem read-only with FUSE
  echo "Mounting ${_iso}..."
  udfclientfs -o ro "${_http_mount}/${_iso}" "${_iso_mount}"

  # Use the first image inside the .wim (the sole Enterprise Evaluation image)
  # Set $TTF_MS_WIN_WIM_IDX to override  (1-indexed)
  local _wim_image_idx="${TTF_MS_WIN_WIM_IDX:-1}"
  # Save WIM XML for image 1, converting UTF-16LE to UTF-8
  echo "Getting install.wim image metadata from image #${_wim_image_idx}..."
  wiminfo "${_wim_image}" "${_wim_image_idx}" --xml | iconv -f UTF-16LE -t UTF-8 > "${srcdir}/wiminfo.xml"

  # Extract package() files from {ISO_IMAGE}/sources/install.wim
  echo "Extracting licence.rtf"
  wimdir "${_wim_image}" "${_wim_image_idx}" \
  | grep -i '/Windows/System32/Licenses/neutral/.*license\.rtf$' \
  | xargs -r wimextract "${_wim_image}" "${_wim_image_idx}" \
    --no-acls --dest-dir="${srcdir}/license"

  echo "Extracting all font files..."
  wimdir "${_wim_image}" "${_wim_image_idx}" \
  | grep '/Windows/Fonts/.*\.tt[cf]$' \
  | xargs -r wimextract "${_wim_image}" "${_wim_image_idx}" \
    --no-acls --dest-dir="${srcdir}/fonts"

  _cleanup  # Unmount UDF image and HTTP mounts, restore standard traps
}

# Version is only available after prepare() mounts the ISO and extracts wiminfo
pkgver() {
  # Extract version from <PKEYCONFIGVERSION> tag
  # Format: 10.0.26200.6584;2016-01-01T00:00:00Z
  # sed captures the 4-field version (digits.digits.digits.digits) after the tag:
  #   <PKEYCONFIGVERSION>10.0.26200.6584;{date}</PKEYCONFIGVERSION>
  #                     ^^^^^^^^^^^^^^^^
  local _ver
  _ver="$(sed -En 's/.*<PKEYCONFIGVERSION>[[:space:]]*([0-9]+\.[0-9]+\.[0-9]+\.[0-9]+).*/\1/p' "${srcdir}/wiminfo.xml")"

  if [ ! "${_ver}" ]; then
    printf "Couldn't derive version from %s data:\n" "${srcdir}/wiminfo.xml" >&2
    head -n20 "${srcdir}/wiminfo.xml"
    exit 1
  fi

  echo "${_ver}"
}

check() {
  local font_count # 137 files expected as at 2026-06-01
  font_count="$(find "${srcdir}/fonts" | wc -l)"
  if [[ ${font_count} -lt 100 ]]; then
    echo "Expected over 100 fonts in ${srcdir}/fonts, but only got ${font_count}." >&2
    exit 1
  fi
}

package() {
  echo "Packaging fonts with version: ${pkgver}..."
  install -dm755 "${pkgdir}/usr/share/fonts/TTF"
  find "${srcdir}/fonts" -type f \( -name '*.ttf' -o -name '*.ttc' \) \
    -exec install -m644 {} "${pkgdir}/usr/share/fonts/TTF" \;

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  find "${srcdir}/license" -type f \
    -exec install -m644 {} "${pkgdir}/usr/share/licenses/${pkgname}" \;
  # No font registration needed — Arch's fontconfig pacman hook runs fc-cache -f automatically
}

# vim:set ts=2 sw=2 et ft=PKGBUILD:
