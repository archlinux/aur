# Maintainer: gaou-piou <i.am.piou@gmail.com>
# Contributor: GCMarvin <GCMarvin@users.noreply.github.com>

pkgname=ttf-google-sans-hinted
_nfver=3.4.0
pkgver=1
pkgrel=3
pkgdesc="Google Sans fonts (GoogleSans, GoogleSansDisplay), optionally Nerd Fonts patched and/or ttfautohint hinted"
url='https://flutter.googlesource.com/gallery-assets'
arch=('any')
license=('custom')
makedepends=('python' 'python-fonttools' 'parallel' 'fontforge' 'ttfautohint')
options=(!strip !zipman)
conflicts=('ttf-google-sans')
provides=('ttf-google-sans' 'ttf-font-nerd')

source=(
  'fonts.tar.gz::https://flutter.googlesource.com/gallery-assets/+archive/refs/heads/master/lib/fonts.tar.gz'
  "font-patcher-${_nfver}::https://github.com/ryanoasis/nerd-fonts/releases/download/v${_nfver}/FontPatcher.zip"
  'make_features.py'
)
sha256sums=('d4e4731431e4f97b6046d5042270338a9527c18ccf733efbb8187eded97f18c3'
            'a8f11e511ed7c69e96680858c06b50a643ea7752e26d5cd13dd5e5cc53ab1760'
            '0723caa5f49782372701905a5acbc577cb7437a87fd30d9b30524a499a505632')

# ── Build-time options (all settable via env vars) ──────────────────────────
#
#  NERD_PATCH  true/false   Patch fonts with Nerd Fonts glyphs (default: false)
#
#  HINTING     true/false   Apply ttfautohint (default: false)
#
#  HINT_MODE   nnn|qqq|qsq|sss   3-char stem-width mode string for ttfautohint:
#                pos1=grayscale  pos2=GDI ClearType  pos3=DW ClearType
#                n=natural  q=quantized  s=strong
#                nnn=HiDPI  qqq=balanced  sss=aggressive low-DPI
#
#  Font family selection:
#  WANT_GOOGLE_SANS          true/false  (default: true)
#  WANT_GOOGLE_SANS_DISPLAY  true/false  (default: true)
#
#  FEATURE_DEFAULTS  "tag,tag,..."  (default: empty = leave the fonts alone)
#                 Bake these GSUB features into the font's 'calt' feature, so
#                 that EVERY renderer applies them, not only pango (see the
#                 note below). Asked during the build as well (none / the two
#                 cosmetic ones / a list of your own), so it does not need the
#                 environment - although this font has almost nothing worth
#                 baking. Audit of
#                 GoogleSans-Regular.ttf, shaping every codepoint with each
#                 feature on and off:
#                   case   52 subs, but it is NOT mild: it raises ( ) [ ] { }
#                          to capital height AND turns every digit into a
#                          .cap (cap-height) digit: "100%" -> one.cap
#                          zero.cap zero.cap percent.cap. Not a default.
#                   ss01   one sub: * -> asterisk.num (numeral height)
#                   ss02   one sub: : -> colon.time
#                   tnum   tabular figures plus .tf spaced punctuation; the
#                          font's default figures are proportional
#                   smcp, c2sc  real small caps - never as a default
#                   aalt, dlig, frac, lnum, pnum  change nothing in this build
#                 So: nothing to bake for a better desktop font. The option
#                 is here so that FEATURE_DEFAULTS/tag sets behave the same in
#                 every package of this family, and for the occasional
#                 "ss01 everywhere" experiment.
#
#  FEATURE_FAMILY  "Name"  (default: empty = edit the fonts in place)
#                 Install the result as this family instead, so the stock
#                 Google Sans stays available.
#
#  Why calt: fontconfig's fontfeatures is read by pango/GTK only. Chromium,
#  Electron, Qt, LibreOffice, kitty and Firefox ignore it, and a browser can
#  only ask from page CSS. A shaper applies a fixed list of features whatever
#  the font declares (ccmp locl mark mkmk kern calt liga clig rlig), so
#  moving a feature's lookups into calt is the only way to make it the
#  default in every program. CSS can still say "calt" 0.
#
#  Non-interactive examples:
#    NERD_PATCH=true HINTING=true HINT_MODE=qqq makepkg -si
#    NERD_PATCH=false HINTING=false WANT_GOOGLE_SANS_DISPLAY=false makepkg -si
#    FEATURE_DEFAULTS=ss01 makepkg -si
# ────────────────────────────────────────────────────────────────────────────

_validate_hint_mode() {
  if [[ ! "$HINT_MODE" =~ ^[nqs]{3}$ ]]; then
    echo "Error: HINT_MODE='$HINT_MODE' is invalid."
    echo "  Must be 3 chars from: n (natural)  q (quantized)  s (strong)"
    echo "  Examples: nnn  qqq  qsq  sss"
    exit 1
  fi
}

_show()   { printf "  [%s] %s\n" "$1" "$2"; }
# "|| _yn=''": at EOF (makepkg </dev/null, chroot, CI) read returns 1, and
# makepkg runs build() with set -e, so the whole build used to abort here.
_ask_yn() { local _default="${2:-n}"; read -p "  $1? (default: $_default) " _yn || _yn=""; _yn="${_yn:-$_default}"; }

# _ask_choice TITLE DEFAULT KEY:description ... -> sets _choice to a KEY.
# Enter (or EOF) keeps DEFAULT; anything else must be a listed number, so a
# typo cannot silently pick something.
_ask_choice() {
  local _title="$1" _default="$2"; shift 2
  local -a _items=("$@")
  local _i _ans
  echo "  $_title:"
  for _i in "${!_items[@]}"; do
    printf "    %d) %-10s %s%s\n" "$((_i + 1))" "${_items[$_i]%%:*}" "${_items[$_i]#*:}" \
      "$([[ "${_items[$_i]%%:*}" == "$_default" ]] && echo "  (default)")"
  done
  while :; do
    read -r -p "  > " _ans || _ans=""
    if [[ -z "$_ans" ]]; then _choice="$_default"; return; fi
    if [[ "$_ans" =~ ^[0-9]+$ ]] && (( _ans >= 1 && _ans <= ${#_items[@]} )); then
      _choice="${_items[$((_ans - 1))]%%:*}"; return
    fi
    echo "  Enter 1-${#_items[@]}, or press Enter for $_default."
  done
}

build() {
  # ══════════════════════════════════════════════════════════════════════════
  # Prompt section — all questions, only when env vars are not pre-set
  # ══════════════════════════════════════════════════════════════════════════
  echo ""
  echo "╔══════════════════════════════════════════════════════╗"
  echo "║         ttf-google-sans-hinted — build options       ║"
  echo "╚══════════════════════════════════════════════════════╝"

  # ── Nerd Fonts patching ──────────────────────────────────────────────────
  if [[ -z "${NERD_PATCH:-}" ]]; then
    _ask_yn "Patch fonts with Nerd Fonts glyphs" n
    [[ "$_yn" =~ ^[yY]$ ]] && NERD_PATCH=true || NERD_PATCH=false
  fi
  NERD_PATCH="${NERD_PATCH:-false}"

  # ── Hinting ──────────────────────────────────────────────────────────────
  if [[ -z "${HINTING:-}" ]]; then
    echo ""
    _ask_yn "Apply ttfautohint hinting" n
    [[ "$_yn" =~ ^[yY]$ ]] && HINTING=true || HINTING=false
  fi
  HINTING="${HINTING:-false}"

  if [[ "$HINTING" == true && -z "${HINT_MODE:-}" ]]; then
    echo ""
    echo "  Hinting stem-width mode:"
    select _choice in "Balanced (qqq)" "HiDPI (nnn)" "Aggressive (sss)" "Custom"; do
      case "$_choice" in
        "Balanced (qqq)")   HINT_MODE=qqq; break ;;
        "HiDPI (nnn)")      HINT_MODE=nnn; break ;;
        "Aggressive (sss)") HINT_MODE=sss; break ;;
        "Custom") read -p "  Enter 3-char mode (e.g. qsq): " HINT_MODE || HINT_MODE=qqq; break ;;
      esac
    done
  fi
  HINT_MODE="${HINT_MODE:-qqq}"
  [[ "$HINTING" == true ]] && _validate_hint_mode

  # ── Font family selection ────────────────────────────────────────────────
  if [[ -z "${WANT_GOOGLE_SANS:-}${WANT_GOOGLE_SANS_DISPLAY:-}" ]]; then
    echo ""
    echo "  ── Font families ────────────────────────────────────────"
    _ask_yn "Include Google Sans (Regular, Medium, Bold + Italics)" y
    [[ "$_yn" =~ ^[yY]$ ]] && WANT_GOOGLE_SANS=true || WANT_GOOGLE_SANS=false

    _ask_yn "Include Google Sans Display (Regular, Medium, Bold + Italics)" y
    [[ "$_yn" =~ ^[yY]$ ]] && WANT_GOOGLE_SANS_DISPLAY=true || WANT_GOOGLE_SANS_DISPLAY=false
  fi

  WANT_GOOGLE_SANS="${WANT_GOOGLE_SANS:-true}"
  WANT_GOOGLE_SANS_DISPLAY="${WANT_GOOGLE_SANS_DISPLAY:-true}"

  # ── OpenType features ────────────────────────────────────────────────────
  if [[ -z "${FEATURE_DEFAULTS:-}" ]]; then
    echo ""
    echo "  ── OpenType features ────────────────────────────────────"
    echo "  A font cannot declare a feature \"on by default\": programs apply a fixed"
    echo "  list (kern calt liga ...) and ignore the rest. Baking moves a feature's"
    echo "  lookups into calt, which every program applies - the only way Chromium,"
    echo "  Electron, Qt and LibreOffice honour one, since they never read"
    echo "  fontconfig's fontfeatures. GTK is covered either way by fonts.conf."
    _ask_choice "Bake features into calt" none \
      "none:leave the fonts as upstream ships them (default)" \
      "cosmetic:ss01,ss02 - asterisk.num and colon.time, the only two that change little" \
      "custom:type the tag list yourself"
    case $_choice in
      none)     FEATURE_DEFAULTS="" ;;
      cosmetic) FEATURE_DEFAULTS="ss01,ss02" ;;
      custom)
        echo "  Tags, comma or space separated (e.g. \"ss01,ss02\"):"
        read -r -p "  > " _tags || _tags=""
                _tags="${_tags//[[:space:]]/,}"          # "a b" == "a,b"
        while [[ "$_tags" == *,,* ]]; do _tags="${_tags//,,/,}"; done
        _tags="${_tags#,}"; _tags="${_tags%,}"
        FEATURE_DEFAULTS="$_tags"
        [[ -n "$FEATURE_DEFAULTS" ]] || echo "  Nothing entered - baking nothing."
        ;;
    esac
    if [[ -n "$FEATURE_DEFAULTS" ]]; then
      echo ""
      echo "A copy under another family name keeps the stock look available; set"
      echo "FEATURE_FAMILY to the name for it (e.g. FEATURE_FAMILY=\"Google Sans Alt\") and"
      echo "build again. Without it the packaged files keep their names and the"
      echo "features apply everywhere, with no way back except CSS \"calt\" 0."
    fi
    echo ""
  fi
  FEATURE_DEFAULTS="${FEATURE_DEFAULTS:-}"
  FEATURE_FAMILY="${FEATURE_FAMILY:-}"
  local _v
  for _v in ${FEATURE_DEFAULTS//,/ }; do
    if [[ ! "$_v" =~ ^[A-Za-z0-9]{4}$ ]]; then
      echo "Error: FEATURE_DEFAULTS: '$_v' is not a feature tag (e.g. ss01)."; exit 1
    fi
  done

  if [[ "$WANT_GOOGLE_SANS$WANT_GOOGLE_SANS_DISPLAY" != *true* ]]; then
    echo "Error: no font families selected. Aborting."; exit 1
  fi

  # ── Build summary ─────────────────────────────────────────────────────────
  echo ""
  echo "  ── Build summary ───────────────────────────────────────"
  printf "  NERD_PATCH:  %s\n" "$NERD_PATCH"
  printf "  HINTING:     %s%s\n" "$HINTING" "$( [[ "$HINTING" == true ]] && echo "  (mode=$HINT_MODE)" )"
  echo ""
  _show "$( [[ "$WANT_GOOGLE_SANS"         == true ]] && echo "x" || echo " " )" "Google Sans"
  _show "$( [[ "$WANT_GOOGLE_SANS_DISPLAY" == true ]] && echo "x" || echo " " )" "Google Sans Display"
  echo "  ────────────────────────────────────────────────────────"
  echo ""

  # ══════════════════════════════════════════════════════════════════════════
  # Step 1 — Select font files from the downloaded archive
  # ══════════════════════════════════════════════════════════════════════════
  rm -rf "$srcdir/selected" "$srcdir/patched"
  mkdir -p "$srcdir/selected" "$srcdir/patched"

  if [[ "$WANT_GOOGLE_SANS" == true ]]; then
    find "$srcdir" -maxdepth 1 -name 'GoogleSans-*.ttf' ! -path '*/._*' \
      -exec cp -n {} "$srcdir/selected/" \;
  fi

  if [[ "$WANT_GOOGLE_SANS_DISPLAY" == true ]]; then
    find "$srcdir" -maxdepth 1 -name 'GoogleSansDisplay-*.ttf' ! -path '*/._*' \
      -exec cp -n {} "$srcdir/selected/" \;
  fi

  local _sel_count; _sel_count=$(ls "$srcdir/selected/" | wc -l)
  echo "==> Selected $_sel_count font files for processing."
  if (( _sel_count == 0 )); then
    echo "Error: no fonts matched the selection."; exit 1
  fi

  # ══════════════════════════════════════════════════════════════════════════
  # Step 2 — Nerd Fonts patching (skipped when NERD_PATCH=false)
  # ══════════════════════════════════════════════════════════════════════════
  if [[ "$NERD_PATCH" == true ]]; then
    printf "%b" "\e[1;33m==> WARNING:\e[0m Patching with Nerd Fonts glyphs — this takes a while...\n"
    find "$srcdir/selected" -name '*.ttf' ! -path '*/._*' | sort | \
      parallel -j4 python "$srcdir/font-patcher-${_nfver}" \
        --variable-width-glyphs -q -c {} \
        -out "$srcdir/patched" &>/dev/null || true
    local _hintsrc="$srcdir/patched"
  else
    local _hintsrc="$srcdir/selected"
  fi

  # ══════════════════════════════════════════════════════════════════════════
  # Step 3 — ttfautohint hinting
  # ══════════════════════════════════════════════════════════════════════════
  if [[ "$HINTING" == true ]]; then
    local _xheight
    case "$HINT_MODE" in
      nnn) _xheight=12 ;;
      *)   _xheight=14 ;;
    esac
    printf "%b" "\e[1;32m==> INFO:\e[0m Applying ttfautohint (mode=$HINT_MODE, x-height=${_xheight}px)...\n"
    mkdir -p "$srcdir/patched/hinted"
    for _f in "$_hintsrc"/*.ttf; do
      [[ -f "$_f" ]] || continue
      ttfautohint \
        --hinting-range-min=8 \
        --hinting-range-max=50 \
        --hinting-limit=200 \
        --increase-x-height="$_xheight" \
        --x-height-snapping-exceptions="" \
        --fallback-script=none \
        --fallback-scaling \
        --stem-width-mode="$HINT_MODE" \
        --no-info \
        --ignore-restrictions \
        "$_f" "$srcdir/patched/hinted/$(basename "$_f")"
    done
  fi

  # ══════════════════════════════════════════════════════════════════════════
  # Step 4 — Bake features into calt (FEATURE_DEFAULTS; empty = skip)
  # Last, on the finished files, so ttfautohint never sees the extra lookups.
  # ══════════════════════════════════════════════════════════════════════════
  local _fsrc="$_hintsrc" _fam=()
  [[ "$HINTING" == true ]] && _fsrc="$srcdir/patched/hinted"
  if [[ -n "$FEATURE_DEFAULTS" ]]; then
    [[ -n "$FEATURE_FAMILY" ]] && _fam=(--family "$FEATURE_FAMILY")
    echo "==> Baking $FEATURE_DEFAULTS into calt${FEATURE_FAMILY:+ (as '$FEATURE_FAMILY')}..."
    python "$srcdir/make_features.py" --features "$FEATURE_DEFAULTS" \
      "${_fam[@]+"${_fam[@]}"}" -o "$srcdir/featured" "$_fsrc"/*.ttf
  fi

  # Persist state for package()
  printf "%s\n%s\n%s\n" "$HINTING" "$NERD_PATCH" "$FEATURE_DEFAULTS" > "$srcdir/.build_state"
}

package() {
  local HINTING NERD_PATCH FEATURE_DEFAULTS
  { read -r HINTING; read -r NERD_PATCH; read -r FEATURE_DEFAULTS; } \
    < "$srcdir/.build_state" 2>/dev/null || { HINTING=false; NERD_PATCH=false; FEATURE_DEFAULTS=""; }

  install -d "$pkgdir/usr/share/fonts/TTF"

  if [[ -n "$FEATURE_DEFAULTS" ]]; then
    install -m644 "$srcdir/featured/"*.ttf "$pkgdir/usr/share/fonts/TTF"
  elif [[ "$HINTING" == true ]]; then
    install -m644 "$srcdir/patched/hinted/"*.ttf "$pkgdir/usr/share/fonts/TTF"
  elif [[ "$NERD_PATCH" == true ]]; then
    install -m644 "$srcdir/patched/"*.ttf "$pkgdir/usr/share/fonts/TTF"
  else
    install -m644 "$srcdir/selected/"*.ttf "$pkgdir/usr/share/fonts/TTF"
  fi

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  cat > "$pkgdir/usr/share/licenses/$pkgname/LICENSE" <<'EOF'
Google Sans fonts are proprietary fonts owned by Google LLC.
They are distributed as part of Google's Flutter gallery assets.
See https://flutter.googlesource.com/gallery-assets for details.

Nerd Fonts glyphs are licensed under their respective open-source licenses.
See https://github.com/ryanoasis/nerd-fonts for details.
EOF
}
