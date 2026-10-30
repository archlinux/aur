# Future release template: publish-aur.sh selects this only for a pinned bundle.
# The current aur/PKGBUILD continues to describe its published binary release.
# Maintainer: Markus Maiwald <markus@maiwald.work>
pkgname=sober-bin
_upstream_version=2026.10.31
pkgver="${_upstream_version//-/_}"
pkgrel=2
pkgdesc='Local-first repository governance and code review with native core grammars'
arch=('x86_64')
url='https://sober-dev.app'
license=('LSL-1.0' 'custom')
depends=('tree-sitter>=0.26' 'tree-sitter<0.27')
provides=('sober')
conflicts=('sober')
_core_grammars='go rust c-sharp typescript tsx zig janus python javascript c cpp bash java ruby php html css json markdown toml '
source=(
  "https://pkg.sober-dev.app/ce/sober_v${_upstream_version}_linux_amd64"
  "https://pkg.sober-dev.app/ce/SHA256SUMS"
  "https://pkg.sober-dev.app/ce/sober-grammars_v${_upstream_version}_linux_amd64.tar.gz"
)
# Validate paths and types before extracting the archive ourselves.
noextract=("sober-grammars_v${_upstream_version}_linux_amd64.tar.gz")
sha256sums=(
  'b465a5361215c0dc1c7a88b244d9185a6378e722ba49176db7170dd1724be97f'
  'SKIP'
  '227257b5f7f21d16e90bb2a07b935e0fe8c5fa8bcdc17f4a3cc78df634e6a15d'
)

prepare() {
  cd "${srcdir}"
  local bin="sober_v${_upstream_version}_linux_amd64"
  local archive="sober-grammars_v${_upstream_version}_linux_amd64.tar.gz"
  local file expected actual name type language refresh=0 refreshed
  [[ -f SHA256SUMS ]] || { echo 'missing release manifest' >&2; return 1; }
  for file in "$bin" "$archive"; do
    [[ -f $file ]] || { echo "missing release source file: $file" >&2; return 1; }
    if ! awk -v name="$file" '$2 == name { found=1 } END { exit !found }' SHA256SUMS; then refresh=1; fi
  done
  if [[ $refresh == 1 ]]; then
    refreshed=$(mktemp "${srcdir}/.sober-manifest.XXXXXX") || return 1
    if ! curl -fsSL "https://pkg.sober-dev.app/ce/SHA256SUMS?ref=${_upstream_version}" -o "$refreshed"; then
      rm -f -- "$refreshed"
      return 1
    fi
    # Replace only srcdir's cache link; retain the original download cache.
    mv -f -- "$refreshed" SHA256SUMS || { rm -f -- "$refreshed"; return 1; }
  fi
  for file in "$bin" "$archive"; do
    # makepkg links download-cache files into srcdir. Require a regular target;
    # the release manifest and recipe pins below authenticate its bytes.
    [[ -f $file ]] || { echo "missing release source file: $file" >&2; return 1; }
    expected=$(awk -v name="$file" '$2 == name {print tolower($1)}' SHA256SUMS)
    actual=$(sha256sum "$file" | awk '{print $1}')
    [[ $expected =~ ^[0-9a-f]{64}$ && $expected == "$actual" ]] || { echo "source does not match its unique release SHA256SUMS line: $file" >&2; return 1; }
    if [[ $file == "$bin" ]]; then
      [[ $expected == "${sha256sums[0]}" ]] || return 1
    else
      [[ $expected == "${sha256sums[2]}" ]] || return 1
    fi
  done
  tar -tzf "$archive" > grammar-bundle.files || return 1
  tar -tvzf "$archive" > grammar-bundle.types || return 1
  [[ -s grammar-bundle.files ]] || return 1
  while IFS= read -r name; do
    [[ $name =~ ^[a-zA-Z0-9._/-]+$ && $name != *..* ]] || { echo 'invalid grammar archive path' >&2; return 1; }
    case "$name" in
      SHA256SUMS|core-grammars.txt|grammars/*.so|licenses/LICENSE.tree-sitter|licenses/*/LICENSE*|licenses/*/NOTICE*|licenses/*/COPYING*) ;;
      *) echo "unsupported grammar archive path: $name" >&2; return 1 ;;
    esac
  done < grammar-bundle.files
  while IFS= read -r type; do
    [[ $type == -* ]] || { echo 'grammar archive contains nonregular entry' >&2; return 1; }
  done < grammar-bundle.types
  [[ $(sort grammar-bundle.files | uniq -d | wc -l) == 0 ]] || { echo 'duplicate grammar archive entry' >&2; return 1; }
  rm -rf grammar-bundle
  mkdir grammar-bundle
  tar --no-same-owner --no-same-permissions -xzf "$archive" -C grammar-bundle || return 1
  cd grammar-bundle
  [[ -s core-grammars.txt && -s SHA256SUMS && -s licenses/LICENSE.tree-sitter ]] || { echo 'incomplete grammar bundle' >&2; return 1; }
  [[ $(tr '\n' ' ' < core-grammars.txt) == "$_core_grammars" && -n $_core_grammars ]] || { echo 'core grammar roster mismatch' >&2; return 1; }
  for language in $_core_grammars; do
    [[ -f grammars/$language.so ]] || { echo "missing core grammar: $language" >&2; return 1; }
  done
  for file in grammars/*.so; do
    language=${file#grammars/}; language=${language%.so}
    local licensed=0 license
    for license in licenses/"$language"/LICENSE* licenses/"$language"/COPYING* licenses/"$language"/NOTICE*; do
      if [[ -f $license && -s $license ]]; then licensed=1; fi
    done
    [[ $licensed == 1 ]] || { echo "missing grammar license: $language" >&2; return 1; }
  done
  # Every payload file needs exactly one hash; never allow checksum paths to
  # escape the extraction root. The archive itself is pinned by makepkg.
  while IFS= read -r name; do
    [[ $name == SHA256SUMS ]] && continue
    expected=$(awk -v name="$name" '$2 == name {print tolower($1)}' SHA256SUMS)
    actual=$(sha256sum "$name" | awk '{print $1}')
    [[ $expected =~ ^[0-9a-f]{64}$ && $expected == "$actual" ]] || { echo "grammar payload checksum mismatch: $name" >&2; return 1; }
  done < ../grammar-bundle.files
}

package() {
  install -Dm755 "${srcdir}/sober_v${_upstream_version}_linux_amd64" "${pkgdir}/usr/bin/sober"
  local file
  for file in "${srcdir}"/grammar-bundle/grammars/*.so; do
    install -Dm644 "$file" "${pkgdir}/usr/lib/sober/grammars/${file##*/}"
  done
  while IFS= read -r file; do
    case "$file" in
      licenses/*) install -Dm644 "${srcdir}/grammar-bundle/$file" "${pkgdir}/usr/share/licenses/${pkgname}/${file#licenses/}" ;;
    esac
  done < "${srcdir}/grammar-bundle.files"
  install -Dm644 "${srcdir}/SHA256SUMS" "${pkgdir}/usr/share/doc/${pkgname}/SHA256SUMS"
  install -Dm644 "${srcdir}/grammar-bundle/SHA256SUMS" "${pkgdir}/usr/share/doc/${pkgname}/grammar-SHA256SUMS"
}
