# Maintainer: korimitsu <korimitsu_aur.wackiness926@passinbox.com>
# Legacy DVBv3-only scan tables (no v5 install)

# This PKGBUILD handles:
# - Normalizing incompatible FEC values
# - Removing DVB-S2-only features
# - Adding missing MODULATION lines to DVB-S channels
# - Filtering out all DVB-S2 and non-QPSK channels
# - Removing empty files
# - Verifying the filtering worked correctly
# - Installing only the DVBv3-compatible scan tables

: ${_commit=}   # optionally pin to a pre-import rev
_pkgname='dtv-scan-tables'
pkgname='dtv-scan-tables-dvbv3-git'
pkgver=r1310.15661aa
pkgrel=1
pkgdesc='Digital TV scan tables (legacy DVBv3 only; filtered for converter compatibility)'
url='https://git.linuxtv.org/dtv-scan-tables.git'
license=('GPL-2.0-only' 'LGPL-2.0-only')
arch=('any')
makedepends=('git' 'v4l-utils')   # dvb-format-convert is used by `make dvbv3`
provides=('dtv-scan-tables-legacy')
# Avoid overlap with packages that also install /usr/share/dvbv3
conflicts=('dtv-scan-tables' 'dtv-scan-tables-git')
optdepends=('dtv-scan-tables-dvbv5-git: current DVBv5 scan tables')
source=("$_pkgname::git+https://git.linuxtv.org/dtv-scan-tables.git${_commit:+#commit=$_commit}")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$_pkgname"
  # 1) Normalize blank INNER_FEC and S2-only FECs to AUTO
  find dvb-s -type f -print0 | xargs -0 sed -i -E \
    -e 's/^([[:space:]]*INNER_FEC[[:space:]]*=\s*)$/\1AUTO/' \
    -e 's/^(.*INNER_FEC[[:space:]]*=\s*)(1\/4|2\/5|3\/5|4\/5|7\/9|8\/9|9\/10)\s*$/\1AUTO/'
  # 2) Remove MIS; zap/v3 can't represent STREAM_ID
  find dvb-s -type f -print0 | xargs -0 sed -i -E '/^[[:space:]]*STREAM_ID[[:space:]]*=.*/d'
  # 2.5) Make DVBS blocks explicit QPSK if MODULATION is missing
  while IFS= read -r -d '' f; do
    awk 'BEGIN{RS=""; ORS=""}
         {
           blk=$0
           if (blk ~ /(^|\n)[ \t]*DELIVERY_SYSTEM[ \t]*=[ \t]*DVBS([ \t]|$)/ &&
               blk !~ /(^|\n)[ \t]*MODULATION[ \t]*=/) {
             sub(/\n([ \t]*FREQUENCY[^\n]*)/, "\n\tMODULATION = QPSK\n\\1", blk)
           }
           print blk "\n"
         }' "$f" > "$f.tmp" && mv "$f.tmp" "$f"
  done < <(find dvb-s -type f -print0)
  # (optional) normalize CRLF
  find dvb-s -type f -exec sed -i 's/\r$//' {} +
  # 3) Keep only DVB-S QPSK stanzas; drop DVB-S2 and non-QPSK (8PSK/16/32APSK)
  while IFS= read -r -d '' f; do
    awk '
      BEGIN { header=""; header_done=0; blk="" }
      function bad(blk) {
        return (blk ~ /(^|\n)[[:space:]]*DELIVERY_SYSTEM[[:space:]]*=[[:space:]]*DVBS2([[:space:]]|$)/) \
            || (blk ~ /(^|\n)[[:space:]]*MODULATION[[:space:]]*=[[:space:]]*(8PSK|APSK\/16|APSK\/32|16APSK|32APSK)([[:space:]]|$)/)
      }
      function emit() {
        if (!blk) return
        if (!bad(blk)) {
          if (!header_done && header) { print header; header_done=1 }
          print blk
        }
        blk=""
      }
      # Capture header (comments) before the first channel block
      !header_done && !/^\[CHANNEL\][[:space:]]*$/ { header = header $0 ORS; next }
      # Start a new block, preserving [CHANNEL]
      /^\[CHANNEL\][[:space:]]*$/ { header_done=1; emit(); blk="[CHANNEL]" ORS; next }
      { blk = blk $0 ORS }
      END { emit() }
    ' "$f" > "$f.tmp" && mv "$f.tmp" "$f"
    # Drop files that ended up with no channel blocks
    grep -q '^\[CHANNEL\]' "$f" || rm -f "$f"
  done < <(find dvb-s -type f -print0)
  # 4) Final sanity check: fail if any DVB-S2 or non-QPSK modulation remains
  if grep -r -qE 'DELIVERY_SYSTEM[[:space:]]*=[[:space:]]*DVBS2|MODULATION[[:space:]]*=[[:space:]]*(8PSK|16APSK|32APSK|APSK\/16|APSK\/32)' dvb-s 2>/dev/null; then
    echo "ERROR: Found incompatible content after filtering:"
    grep -r -nE 'DELIVERY_SYSTEM[[:space:]]*=[[:space:]]*DVBS2|MODULATION[[:space:]]*=[[:space:]]*(8PSK|16APSK|32APSK|APSK\/16|APSK\/32)' dvb-s | head -10
    echo "Build cannot continue with DVB-S2 or non-QPSK content present."
    return 1
  fi
  echo "Filtering complete: all DVB-S2 and non-QPSK content removed successfully"
}

build() {
  cd "$_pkgname"
  make dvbv3
}

package() {
  cd "$_pkgname"
  # Install only the legacy v3 set (to /usr/share/dvbv3)
  make PREFIX="$pkgdir/usr" install_v3
}
