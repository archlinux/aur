# Maintainer: v9pzm7 <deanae at qq dot com>

# This package repackages the Windows 11 Feature on Demand (FoD) font set by
# querying Windows Update for the Microsoft-hosted optional font CABs that
# match the configured Windows build and branch, then turning their font
# payloads into a single Arch package.
#
# It follows the same Windows Update FE3 SOAP metadata flow used by
# `uup-dump` (https://uupdump.net), emulating a Windows Update client for the
# configured build and branch.
#
# Build flow:
#   1. Call `GetCookie` to establish a valid FE3 service cookie for the session.
#   2. Call `SyncUpdates` with the expected device attributes and product
#      metadata to enumerate the matching Windows 11 FoD font updates.
#   3. Call `GetExtendedUpdateInfo2` for the selected update identities to
#      resolve the final Microsoft-hosted CAB download URLs.
#   4. Download and hash-verify those CABs, extract their TTF/TTC payloads,
#      verify the expected file set from `fontdata.sh`, and package the staged
#      result.
#
# `fontdata.sh` is the source of truth for FoD groups, CAB stems, and expected
# font file names. The Python helpers implement the Windows Update metadata
# lookup, URL resolution, TLS setup, and CAB downloads.
#
# All packaging and helper code in this repository was generated with AI
# assistance.
#
# Microsoft font files remain copyrighted by Microsoft and/or their respective
# authors. Usage outside a properly licensed Windows environment may be
# restricted by the Microsoft license terms. Review the applicable license and
# use requirements before installing or redistributing these fonts.

pkgname=ttf-ms-win11-fod-wu
pkgver=1.0.0
pkgrel=2
# Current Windows source build used for Windows Update metadata resolution.
_win_build=10.0.26100.1
_win_branch=ge_release
pkgdesc='Microsoft Windows 11 Feature on Demand TrueType fonts'
arch=(any)
url='https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list#fonts-included-in-feature-on-demand-fod-packages'
license=(custom)
provides=(ttf-font ttf-ms-win11-fod)
conflicts=(ttf-ms-win11-fod ttf-ms-win11-fod-auto)
makedepends=(p7zip python)

. ./fontdata.sh

# These FoD fonts are already shipped by ttf-ms-win11-base.
_base_package_overlaps=(
  msgothic.ttc
)

source=(resolver.py wu.py fonts.py fontdata.sh)
sha256sums=(
  '442ab8e6db3599601d2d2f2d72de11126af54f196f5c41c067d82b13a2e9e5ca'
  'fa4fb06029f799ea584b131701802c18adc37ff0e377cdf1fc4482f19883d0f1'
  '76f7fd322d10cb5fe31772b972e866739add86955eae4391effe4f2d55219eac'
  'bd23d028533c64eab81a8346bb9bf8cc6dbce83c4a0d5981c77d8679794cc129'
)

_cache_root_path() {
  printf '%s\n' "$srcdir/cache-${_win_build}"
}

_cab_dir_path() {
  printf '%s\n' "$(_cache_root_path)/cabs"
}

_font_dir_path() {
  printf '%s\n' "$(_cache_root_path)/fonts"
}

_cab_name_for_group() {
  local _group=$1
  printf 'Microsoft-Windows-LanguageFeatures-Fonts-%s-Package~31bf3856ad364e35~amd64~~.cab\n' \
    "${_fod_cab_stems[$_group]}"
}

prepare() {
  cd "$srcdir"

  local _cab_dir
  local _font_dir
  local _cache_valid=1
  local _cab
  local _cab_name
  local _fail=
  local _group
  local _group_spec
  local _font
  local -a _cabs=()
  local -a _expected_cabs=()
  local -a _resolver_group_args=()
  local -A _expected_cab_lookup=()

  _cab_dir="$(_cab_dir_path)"
  _font_dir="$(_font_dir_path)"

  for _group in "${_fod_groups[@]}"; do
    _cab_name="$(_cab_name_for_group "$_group")"
    _expected_cabs+=("$_cab_dir/$_cab_name")
    _expected_cab_lookup[$_cab_name]=1
  done

  for _group_spec in "${_fod_group_specs[@]}"; do
    _resolver_group_args+=(--group "$_group_spec")
  done

  install -d "$_cab_dir"

  shopt -s nullglob
  _cabs=("$_cab_dir"/*.cab)
  shopt -u nullglob

  for _cab in "${_cabs[@]}"; do
    _cab_name=${_cab##*/}
    if [[ -z ${_expected_cab_lookup[$_cab_name]} ]]; then
      _cache_valid=0
      break
    fi
  done

  if (( _cache_valid )); then
    for _cab in "${_expected_cabs[@]}"; do
      if [[ ! -f $_cab ]]; then
        _cache_valid=0
        break
      fi
    done
  fi

  if (( ! _cache_valid )); then
    echo "- Refreshing CAB cache"
    rm -rf "$_cab_dir"
    install -d "$_cab_dir"
    echo "- Downloading font CABs from Windows Update"
    python "$srcdir/resolver.py" download \
      --build "$_win_build" \
      --branch "$_win_branch" \
      --output-dir "$_cab_dir" \
      "${_resolver_group_args[@]}"
  else
    echo "- Reusing cached font CABs"
  fi

  rm -rf "$_font_dir"
  install -d "$_font_dir"

  echo "- Extracting font files from CABs"
  shopt -s nullglob
  _cabs=("$_cab_dir"/*.cab)
  shopt -u nullglob

  if (( ${#_cabs[@]} == 0 )); then
    echo "No CAB files are available. Exiting."
    return 1
  fi

  for _cab in "${_expected_cabs[@]}"; do
    if [[ ! -f $_cab ]]; then
      echo "Missing expected CAB: ${_cab##*/}. Exiting."
      return 1
    fi
    echo "  - $(basename "$_cab")"
    7z e -aoa "-o$_font_dir" "$_cab" "*/*.ttf" "*/*.ttc" >/dev/null
  done

  echo "- Verifying expected font files"
  for _group in "${_fod_groups[@]}"; do
    local -n _group_fonts="$_group"
    for _font in "${_group_fonts[@]}"; do
      if [[ -f $_font_dir/$_font ]]; then
        echo "  - $_font: Pass"
      else
        echo "  - $_font: MISSING"
        _fail=1
      fi
    done
    unset -n _group_fonts
  done

  if [[ -n $_fail ]]; then
    echo "One or more expected font files are missing. Exiting."
    return 1
  fi
}

package() {
  local _font_dir
  local _font
  local _overlap_font
  local -A _base_package_overlap_lookup=()

  _font_dir="$(_font_dir_path)"

  for _overlap_font in "${_base_package_overlaps[@]}"; do
    _base_package_overlap_lookup["$_overlap_font"]=1
  done

  for _font in "${_fod_all_fonts[@]}"; do
    if [[ -n ${_base_package_overlap_lookup[$_font]:-} ]]; then
      continue
    fi
    install -Dm644 "$_font_dir/$_font" -t "$pkgdir/usr/share/fonts/TTF"
  done
}
