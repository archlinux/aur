# Maintainer: everyx <lunt.luo#gmail.com>

_pkgbase=rime-ice
_schemas=(rime_ice double_pinyin double_pinyin_flypy double_pinyin_mspy double_pinyin_ziguang double_pinyin_abc)
_pkgname=$_pkgbase
pkgname=$_pkgname-git
pkgver=r301.d9c024d
pkgrel=1
pkgdesc="Rime 配置：雾凇拼音 | 长期维护的简体词库"
arch=("any")
url="https://github.com/iDvel/rime-ice"
license=("GPL3")
makedepends=("git" "librime" "rime-prelude" "coreutils" "grep" "sed")
provides=("${_pkgname}")
conflicts=(
  "rime-emoji"
  "${_pkgname}"
  "${_pkgbase}-pinyin"
  "${_pkgbase}-double-pinyin"
  "${_pkgbase}-double-pinyin-flypy"
  "${_pkgbase}-double-pinyin-mspy"
  "${_pkgbase}-double-pinyin-ziguang"
  "${_pkgbase}-double-pinyin-abc"
)
source=("${_pkgname}::git+${url}.git")
sha512sums=("SKIP")

pkgver() {
  cd "${_pkgname}" &&
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

_suggestion=${_pkgbase//-/_}_suggestion.yaml

prepare() {
  cd "${_pkgname}" &&
    mv ./default.yaml "./${_suggestion}" &&
    # Link essentials.
    for _f in $(pacman -Qql rime-prelude | grep -v "/$"); do ln -sf "$_f" .; done
}

build() {
  cd "${_pkgname}" || return

  _schemas_deps=()
  for _s in "${_schemas[@]}"; do
    _deps=()
    mapfile -t _deps <<< "$(sed -n '/dependencies:/,/^$/ {/dependencies:/d; /^$/d; s/.*- *//g; s/ *#.*//g; p }' "$_s.schema.yaml")"
    _schemas_deps=("${_schemas_deps[@]}" "${_deps[@]}")
  done

  mapfile -t _schemas_deps <<< "$(printf "%s\n" "${_schemas_deps[@]}" | sort -u)"
  # build current schema and it's depends only, sort by length
  _compile_schemas=("${_schemas_deps[@]}" "${_schemas[@]}")

  for _s in "${_compile_schemas[@]}"; do rime_deployer --compile "$_s.schema.yaml"; done

  # comment ignore schemas
  _suggestion_schemas=$(sed -n '/^schema_list:/,/^$/ {/^schema_list:/d; /^$/d; s/.*schema: *//g; p }' "$_suggestion")

  for _s in $_suggestion_schemas; do
    [[ ! ${_schemas[*]} =~ (^|[[:space:]])"$_s"($|[[:space:]]) ]] && sed -i "s/^\s*- schema: $_s *$/#&/" "$_suggestion";
  done

  find . -type l -delete
}

package() {
  cd "${_pkgname}" || return
  _install_base="$pkgdir/usr/share/rime-data"

  install -Dm644 "$_suggestion"       -t "$_install_base/"
  install -Dm644 ./build/*.{bin,yaml} -t "$_install_base/build"

  [ -f "./rime.lua" ] && install -Dm644 ./rime.lua -t "$_install_base/"
  find lua -type f -exec sh -c 'install -Dm644 "$1" -t '"$_install_base"'/$(dirname $1)' shell {} \;

  for _f in *.schema.yaml; do
    if [ -f "build/$_f" ]; then
      install -Dm644 "$_f" -t "$_install_base/"

      grep -q "opencc_config: emoji.json" "$_f" &&
        install -Dm644 ./opencc/* -t "$_install_base/opencc/"
    fi
  done

  for _f in *.dict.yaml; do
    if [ -f "build/${_f/.dict.yaml/}.table.bin" ]; then
      install -Dm644 "$_f" -t "$_install_base/"
    fi
  done

  for _f in */*.dict.yaml; do
    if grep -q "\- ${_f/.dict.yaml/}" "$_install_base/"*.dict.yaml; then
      install -Dm644 "$_f" -t "$_install_base/$(dirname "$_f")"
    fi
  done

  for _f in *.yaml; do
    if grep -q "${_f/.yaml/:}" build/*.schema.yaml; then
      install -Dm644 "$_f" -t "$_install_base/"
    fi
  done
}
