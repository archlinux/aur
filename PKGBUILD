# Maintainer: korimitsu <korimitsu_aur.wackiness926@passinbox.com>
# Legacy DVBv3-only scan tables (no v5 install)

# This PKGBUILD:
# - Pre-filters DVB-S files to DVBS+QPSK only (drops DVBS2, 8PSK/PSK/8/APSK, MIS/STREAM_ID, PILOT, ROLLOFF - normalizes FEC - adds MODULATION=QPSK if missing)
# - Lets dvb-format-convert build dvbv3 tables for ATSC/DVB-C/DVB-T/DVB-S
# - Skips ISDB-T (legacy v3 format doesn't support it)
# - Installs only non-empty subdirs and fails if the resulting package has zero channels
# - Tip: In upstream dvbv5 scan files, the [ ... ] -usually [CHANNEL]- section header is just
#   the channel name, and can be any string (e.g. "[Movistar]"). The script doesn't touch it,
#   only filters keys inside each section before converting to dvbv3.

: ${_commit=}   # optionally pin to a specific rev (empty = tip)
_pkgname='dtv-scan-tables-dvbv3'
pkgname='dtv-scan-tables-dvbv3-git'
pkgver=r1310.15661aa
pkgrel=6
pkgdesc='Digital TV scan tables (legacy DVBv3 only - ATSC/DVB-C/DVB-S/DVB-T filtered for v3 compatibility)'
url='https://git.linuxtv.org/dtv-scan-tables.git'
license=('GPL-2.0-only' 'LGPL-2.0-only')
arch=('any')
makedepends=('git' 'v4l-utils')   # dvb-format-convert is used by `make dvbv3`
provides=('dtv-scan-tables-dvbv3' 'dtv-scan-tables-legacy')
# Conflict 'dtv-scan-tables-git' has to be removed, when the metapackage 'dtv-scan-tables' including "dtv-scan-tables-dvbv*-git" is created. Currently that package is already owned so it's incompatible.
conflicts=('dtv-scan-tables' 'dtv-scan-tables-git' 'dtv-scan-tables-patched')
optdepends=('dtv-scan-tables-dvbv5-git: current DVBv5 scan tables')
source=("$_pkgname::git+https://git.linuxtv.org/dtv-scan-tables.git${_commit:+#commit=$_commit}")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$_pkgname"

  # Upstream satellite dir name changed in history - detect it
  SATDIR="satellites"
  [[ -d dvb-s ]] && SATDIR="dvb-s"

  if [[ -d "$SATDIR" ]]; then
    rm -rf filtered-sat && cp -a "$SATDIR" filtered-sat

    # 1) Normalize FECs, remove MIS/PILOT/ROLLOFF, fix CRLF
    find filtered-sat -type f -print0 | xargs -0 sed -i -E \
      -e 's/^([[:space:]]*INNER_FEC[[:space:]]*=\s*)$/\1AUTO/' \
      -e 's/^(.*INNER_FEC[[:space:]]*=\s*)(1\/4|2\/5|3\/5|4\/5|7\/9|8\/9|9\/10)\s*$/\1AUTO/' \
      -e '/^[[:space:]]*STREAM_ID[[:space:]]*=.*/d' \
      -e '/^[[:space:]]*PILOT[[:space:]]*=.*/d' \
      -e '/^[[:space:]]*ROLLOFF[[:space:]]*=.*/d' \
      -e 's/\r$//'

    # 2) For DVBS blocks lacking MODULATION, inject QPSK
    while IFS= read -r -d '' f; do
      awk 'BEGIN{RS=""; ORS=""}
           function has(k, re){ return $0 ~ ("(^|\\n)[ \\t]*" k "[ \\t]*=[ \\t]*" re "([ \\t]|$)") }
           {
             rec=$0
             if (has("DELIVERY_SYSTEM","DVBS") && !has("MODULATION","[A-Z0-9/]+")) {
               sub(/\n([ \t]*FREQUENCY[^\n]*)/, "\n\tMODULATION = QPSK\n\\1", rec)
             }
             print rec "\n"
           }' "$f" > "$f.tmp" && mv "$f.tmp" "$f"
    done < <(find filtered-sat -type f -print0)

    # 3) Drop DVBS2 and non-QPSK (8PSK/PSK/8/16APSK/32APSK/APSK/16/APSK/32) blocks - keep comments/preamble
    while IFS= read -r -d '' f; do
      awk '
        BEGIN { RS=""; ORS=""; header=""; header_done=0; kept=0 }
        function bad(s) {
          return s ~ /(^|\n)[[:space:]]*DELIVERY_SYSTEM[[:space:]]*=[[:space:]]*DVBS2([[:space:]]|$)/ \
              || s ~ /(^|\n)[[:space:]]*MODULATION[[:space:]]*=[[:space:]]*(8PSK|PSK\/8|APSK\/16|APSK\/32|16APSK|32APSK)([[:space:]]|$)/
        }
        {
          rec=$0
          if (!header_done && rec !~ /^\[/) { header=rec; next }
          if (!bad(rec)) {
            if (!header_done && length(header)) { print header; header_done=1 }
            print rec "\n"; kept=1
          }
        }
        END { if (!kept) {} }
      ' "$f" > "$f.tmp"

      # Remove file if no [CHANNEL] blocks remain
      if ! grep -q '^\[' "$f.tmp"; then
        rm -f "$f" "$f.tmp"
      else
        mv "$f.tmp" "$f"
      fi
    done < <(find filtered-sat -type f -print0)

    # 4) Final sanity on filtered set
    if grep -r -qE 'DELIVERY_SYSTEM[[:space:]]*=[[:space:]]*DVBS2|MODULATION[[:space:]]*=[[:space:]]*(8PSK|PSK/8|16APSK|32APSK|APSK/16|APSK/32)|^[[:space:]]*(PILOT|ROLLOFF|STREAM_ID)[[:space:]]*=' filtered-sat 2>/dev/null; then
      echo "ERROR: DVB-S2/non-QPSK remnants found after filtering"; return 1
    fi

    # 5) Replace the upstream satellite dir so `make dvbv3` converts only v3-safe DVB-S
    rm -rf "$SATDIR"
    mv filtered-sat "$SATDIR"
    echo "DVB-S filter done: kept only DVBS+QPSK - comments preserved - empty files removed."
  else
    echo "No satellite directory found (nothing to filter)."
  fi
}

build() {
  cd "$_pkgname"
  # Converts ATSC/DVB-C/DVB-T and our now-filtered DVB-S into dvbv3/
  make dvbv3
}

package() {
  cd "$_pkgname"

  local dest="$pkgdir/usr/share/dvbv3"
  install -d "$dest"

  # Only install subdirs that exist AND contain at least one non-empty file.
  # ISDB-T intentionally skipped (legacy v3 formats do not support it).
  for d in atsc dvb-c dvb-s dvb-t; do
    if [[ -d "dvbv3/$d" ]] && find "dvbv3/$d" -type f -size +0 -print -quit >/dev/null; then
      install -d "$dest/$d"
      install -m 644 dvbv3/$d/* "$dest/$d/" 2>/dev/null || true
      # Drop empty files, if any slipped through
      find "$dest/$d" -type f -size 0 -delete
      # Prune dir if it ended up empty
      rmdir "$dest/$d" 2>/dev/null || true
    fi
  done

  # Final safety: require at least one non-empty file overall
  if ! find "$dest" -type f -size +0 -print -quit >/dev/null 2>&1; then
    echo "No channels left after filtering - aborting"; return 1
  fi
}
