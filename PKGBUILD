# Maintainer: Danilo Pianini <danilo.pianini@gmail.com>
pkgname=pantum-cp2100-cm2100-driver
pkgver="1.0.39"
pkgrel="1"
pkgdesc="Linux driver for Pantum CP2100 and CM2100 printers V$pkgver"
arch=('x86_64' 'i386' 'i686')
url="https://global.pantum.com/support/download/driver/"
license=('proprietary')
makedepends=('python' 'curl' 'unzip' 'binutils' 'zstd')
depends=('cups' 'cups-filters' 'ghostscript')
sha256sums=()
source=()

# Convert pkgver "1.0.39" -> "V1_0_39" for upstream ZIP filename
_pkgver_upstream="V${pkgver//./_}"
_zipfile="Pantum_CP2100_CM2100_LinuxDriver%20${_pkgver_upstream}.zip"
_url="https://drivers.pantum.com/userfiles/files/download/drive/CM2100/${_zipfile}"

# Extracts the data payload of a .deb into a target directory.
# Usage: extract_deb <deb-file> <dest-dir>
extract_deb() {
  local deb="$1" dest="$2"
  [[ -f "$deb" ]] || { echo "extract_deb: missing deb: $deb"; return 1; }
  [[ -n "$dest" ]] || { echo "extract_deb: missing destination"; return 1; }
  mkdir -p "$dest"

  # Find the data tarball inside the .deb (supports xz/gz/bz2/zst/none)
  local data_member
  data_member="$(ar t "$deb" | grep -E '^data\.tar\.(xz|gz|bz2|zst)?$' | head -n1)"
  [[ -n "$data_member" ]] || { echo "extract_deb: no data.tar.* in $deb"; return 1; }

  echo ">> Extracting $data_member from $deb to $dest"
  case "$data_member" in
    *.xz)  ar p "$deb" "$data_member" | tar -xJpf - -C "$dest" ;;
    *.gz)  ar p "$deb" "$data_member" | tar -xzpf - -C "$dest" ;;
    *.bz2) ar p "$deb" "$data_member" | tar -xjpf - -C "$dest" ;;
    *.zst) ar p "$deb" "$data_member" | tar --zstd -xpf - -C "$dest" ;;
    *tar)  ar p "$deb" "$data_member" | tar -xpf  - -C "$dest" ;;
    *)     echo "extract_deb: unknown data member: $data_member"; return 1 ;;
  esac
}

# Map Arch Linux $CARCH to Debian .deb architecture
to_deb_arch() {
  case "$1" in
    x86_64) echo "amd64" ;;
    i686)   echo "i386" ;;
    *)      echo "$1" ;;
  esac
}

build() {
  cd "$srcdir"/*LinuxDriver*/Resources
  local _debarch
  _debarch="$(to_deb_arch "$CARCH")"
  local deb
  deb="$(printf '%s\n' pantum2100_${pkgver}-*_${_debarch}.deb | head -n1)"
  [[ -f "$deb" ]] || { echo "No deb found for arch $_debarch"; ls -la; return 1; }
  _debout="$srcdir/debroot-${pkgver}-${_debarch}"
  rm -rf "$_debout"
  extract_deb "$deb" "$_debout"
}

package() {
  local _debarch
  _debarch="$(to_deb_arch "$CARCH")"
  _debout="$srcdir/debroot-${pkgver}-${_debarch}"
  [[ -d "$_debout" ]] || { echo "package(): missing extracted dir: $_debout"; return 1; }
  echo ">> Installing files into \$pkgdir"
  mkdir -p "$pkgdir"
  cp -a --no-preserve=ownership "$_debout"/. "$pkgdir"/
}

prepare() {
  cd "$srcdir"
  out="Pantum_CP2100_CM2100_LinuxDriver_${pkgver}.zip"
  part="$out.part"
  echo ">> Fetch 1: download (could be real ZIP or HTML stub)"
  # Add a referer and accept header; some anti-bot setups check these
  curl -fsSL --compressed \
    -A 'Mozilla/5.0' \
    -H 'Accept: */*' \
    -e 'https://global.pantum.com/support/download/driver/' \
    -o "$part" "$_url" || { echo "Download failed"; exit 1; }
  # If it’s already a ZIP, we’re done.
  if unzip -tq "$part" >/dev/null 2>&1; then
    echo ">> Got a valid ZIP directly."
    mv -f "$part" "$out"
  else
    mime="$(file -b "$part" 2>/dev/null || true)"
    # Case A: gzipped HTML stub
    if echo "$mime" | grep -qi 'gzip compressed'; then
      echo ">> Detected gzipped HTML stub, inflating..."
      html="$(zcat -- "$part")"
      rm -f "$part"
    # Case B: plain HTML stub
    elif echo "$mime" | grep -qi 'html'; then
      echo ">> Detected plain HTML stub."
      html="$(cat -- "$part")"
      rm -f "$part"
    # Case C: ZIP that contains one HTML file (rare)
    elif unzip -tq "$part" >/dev/null 2>&1; then
      entries="$(unzip -Z1 "$part" 2>/dev/null || true)"
      if [[ "$(printf '%s\n' "$entries" | wc -l)" -eq 1 ]]; then
        stubfile="$(printf '%s\n' "$entries")"
        if unzip -p "$part" "$stubfile" | head -c 15 | grep -q '^<html>'; then
          echo ">> Detected stub inside single-file ZIP; extracting HTML..."
          html="$(unzip -p "$part" "$stubfile")"
          rm -f "$part"
        fi
      fi
    fi
    # We must have HTML by now
    if [[ -z "${html:-}" ]]; then
      echo ">> Unexpected content (not ZIP, not HTML):"
      file "$part" || true
      head -c 200 "$part" || true
      exit 1
    fi
    echo ">> Extracting arg1 from HTML..."
    arg1="$(python - <<'PY'
import re, sys
data = sys.stdin.read()
m = re.search(r"var\s+arg1\s*=\s*'([0-9A-F]+)'", data)
print(m.group(1) if m else "")
PY
<<< "$html")"
    if [[ -z "$arg1" ]]; then
      echo "Failed to extract arg1 from stub."
      printf '%s\n' "$html" | head -n 60
      exit 1
    fi
    echo ">> Computing acw_sc__v2 cookie..."
    cookie_val="$(python - "$arg1" <<'PY'
import sys
arg1 = sys.argv[1].strip()
pos = [0xf,0x23,0x1d,0x18,0x21,0x10,0x1,0x26,0xa,0x9,0x13,0x1f,0x28,0x1b,0x16,0x17,0x19,0xd,0x6,0xb,0x27,0x12,0x14,0x8,0xe,0x15,0x20,0x1a,0x2,0x1e,0x7,0x4,0x11,0x5,0x3,0x1c,0x22,0x25,0xc,0x24]
mask = "3000176000856006061501533003690027800375"
out = ['']*len(pos)
for i, ch in enumerate(arg1):
    for j, p in enumerate(pos):
        if p == i+1:
            out[j] = ch
            break
arg2 = ''.join(out)
n = min(len(arg2), len(mask))
res = []
for i in range(0, n, 2):
    a = int(arg2[i:i+2], 16)
    m = int(mask[i:i+2], 16)
    res.append(f"{a ^ m:02x}")
print(''.join(res))
PY
)"
    [[ -n "$cookie_val" ]] || { echo "Failed to compute cookie"; exit 1; }
    echo ">> Fetch 2: download real ZIP with cookie..."
    curl -fsSL --compressed \
         -A 'Mozilla/5.0' \
         -H "Cookie: acw_sc__v2=${cookie_val}" \
         -H 'Accept: application/zip,*/*' \
         -e 'https://global.pantum.com/support/download/driver/' \
         -o "$out" "$_url" || { echo "Second download failed"; exit 1; }
  fi
  echo ">> Validating final ZIP..."
  unzip -tq "$out" >/dev/null 2>&1 || { echo "Final ZIP invalid"; file "$out"; exit 1; }
  echo ">> Unpacking ZIP so build() can find Resources/..."
  bsdtar -xf "$out"
}
