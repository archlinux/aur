# PKGBUILD for ttf-ms-no-big-downloads
# Maintainer: Tom Hale <tom at hale dot ee>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164

# BUILD INSTRUCTIONS:
# -------------------
# This PKGBUILD downloads fonts from a Windows 11 Enterprise evaluation ISO
# using httpdirfs + udfclient + wimlib to extract only the font files
# without downloading the entire multi-gigabyte ISO. Only the segments of the
# ISO that are required to access the font data are transferred via HTTP.
pkgname=ttf-ms-no-big-downloads
pkgver=10.0.22621.525
pkgrel=1
pkgdesc='Microsoft Windows 11 TrueType fonts (auto-downloaded via HTTP streaming)'
arch=('any')
url='https://www.microsoft.com/en-us/software-download/windows11'
license=('custom')
depends=()
makedepends=('httpdirfs' 'udfclient' 'wimlib')
provides=('ttf-font' 'ttf-ms-fonts' 'ttf-ms-win11' 'ttf-tahoma' 'emoji-font')
conflicts=('ttf-ms-win11' 'ttf-ms-win11-auto' 'ttf-ms-fonts' 'ttf-tahoma' 'ttf-vista-fonts')

# Windows 11 Enterprise Evaluation ISO (build 22621.525, 22H2)
_iso='22621.525.220925-0207.ni_release_svc_refresh_CLIENTENTERPRISEEVAL_OEMRET_x64FRE_en-us.iso'
_iso_url="https://software-static.download.prss.microsoft.com/dbazure/988969d5-f34g-4e03-ac9d-1f9786c66751/${_iso}"
# Persistent httpdirfs byte-range cache — survives makepkg -C across builds
_http_cache="${XDG_CACHE_HOME:-$HOME/.cache}/$pkgname"

# ISO is NOT in source=() — httpdirfs byte-range streams only the segments
# that are actually read during extraction (~200 MiB), avoiding the full 4.73 GiB
# download that makepkg's DLAGENT would perform.
source=()
sha256sums=()

prepare() {
  cd "$srcdir"

  # Clean stale mounts from interrupted builds
  fusermount3 -uz mnt/iso 2>/dev/null || fusermount -uz mnt/iso 2>/dev/null || true
  fusermount3 -uz mnt/http 2>/dev/null || fusermount -uz mnt/http 2>/dev/null || true
  rm -rf mnt fonts license  # preserve httpdirfs cache for speed on rebuilds

  mkdir -p mnt/http mnt/iso "$_http_cache"

  # Mount ISO URL via HTTP streaming — only fetches byte-range segments that
  # are actually read.  Total transfer is the font data itself (~200 MiB),
  # not the full 5 GiB ISO.
  httpdirfs \
    --cache --cache-location "$_http_cache" \
    --dl-seg-size 1 --max-conns 15 \
    --refresh-timeout 60 \
    --single-file-mode \
    "$_iso_url" mnt/http

  # Mount the ISO with a FUSE UDF filesystem
  udfclient "mnt/http/${_iso}" mnt/iso

  # List all font files in image 1 (the sole Enterprise Evaluation image)
  # and extract them directly — no full-WIM decompression needed
  wimdir "mnt/iso/sources/install.wim" 1 \
    | grep '/Windows/Fonts/.*\.tt[cf]$' \
    | xargs -r wimextract "mnt/iso/sources/install.wim" 1 \
      --no-acls --dest-dir="$srcdir/fonts"

  # Extract license files from the WIM (RTF EULA)
  wimdir "mnt/iso/sources/install.wim" 1 \
    | grep -i '/Windows/System32/Licenses/neutral/.*license\.rtf$' \
    | xargs -r wimextract "mnt/iso/sources/install.wim" 1 \
      --no-acls --dest-dir="$srcdir/license"

  # Unmount FUSE filesystems (lazy so in-flight reads complete)
  fusermount3 -uz mnt/iso 2>/dev/null || fusermount -uz mnt/iso 2>/dev/null || true
  fusermount3 -uz mnt/http 2>/dev/null || fusermount -uz mnt/http 2>/dev/null || true
}

package() {
  install -dm755 "$pkgdir/usr/share/fonts/TTF"
  find "$srcdir/fonts" -type f \( -name '*.ttf' -o -name '*.ttc' \) \
    -exec install -m644 {} "$pkgdir/usr/share/fonts/TTF" \;

  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  find "$srcdir/license" -type f \
    -exec install -m644 {} "$pkgdir/usr/share/licenses/$pkgname" \;

  # Silence STDOUT from install commands
} >/dev/null

# vim:set ts=2 sw=2 et ft=PKGBUILD:
