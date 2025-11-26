# Maintainer: TimWcx <timwcx#qq.com>

_pkgbase=rime-frost
pkgname=${_pkgbase}-git
pkgver=r256.8e025da
pkgrel=1
pkgdesc="Rime 配置：白霜词库 | 蒹葭苍苍，白露为霜。基于雾凇拼音重制的，更纯净、词频准确、智能的词库。"
arch=("any")
url="https://github.com/gaboolic/rime-frost"
license=("GPL-3.0-or-later")
depends=("lua" "librime")
makedepends=("git" "rime-prelude" "sed")
conflicts=(
  rime-emoji
  rime-ice-git
  rime-ice-pinyin-git
  rime-ice-double-pinyin-git
  rime-ice-double-pinyin-abc-git
  rime-ice-double-pinyin-mspy-git
  rime-ice-double-pinyin-sogou-git
  rime-ice-double-pinyin-flypy-git
  rime-ice-double-pinyin-ziguang-git
)
provides=(rime-luna-pinyin)
source=("${_pkgbase}::git+${url}.git" "package.patch")
sha512sums=("SKIP" 
be94577ee610847ecb17aa1a22d4341bb124dd1b50a89a06b512e9b16370340e16284268985bebec7472482a9ee8e3b24a84a066829877d8e9e8307d69b6eb0e)

_schemas=(
  rime_frost
  rime_frost_double_pinyin
  rime_frost_double_pinyin_abc
  rime_frost_double_pinyin_mspy
  rime_frost_double_pinyin_sogou
  rime_frost_double_pinyin_flypy
  rime_frost_double_pinyin_ziguang
)

pkgver() {
  cd "${_pkgbase}" &&
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

_suggestion=${_pkgbase//-/_}_suggestion.yaml

prepare() {
  cd "${_pkgbase}" &&
    mv ./default.yaml "./${_suggestion}" &&
    # Link essentials.
    for _f in $(pacman -Qql rime-prelude | grep -v "/$"); do ln -sf "$_f" .; done &&
    patch --forward --strip=1 --input="../package.patch"
}

build() {
  cd "${_pkgbase}" || return

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
  _suggestion_schemas=$(sed -n '/^schema_list:/,/^$/ {/^schema_list:/d; /^\s*#.*$/d; /^$/d; s/.*schema:\s*//g; s/\s*#.*//g; p }' "$_suggestion")

  for _s in $_suggestion_schemas; do
    if [[ ! ${_schemas[*]} =~ (^|[[:space:]])"$_s"($|[[:space:]]) ]]; then
      sed -i "s/^\s*- schema: $_s .*\$/#&/" "$_suggestion";
    fi
  done

  find . -type l -delete
}

package() {
  cd "${_pkgbase}" || return

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
