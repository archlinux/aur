# Maintainer: everyx <lunt.luo#gmail.com>

_pkgbase=rime-ice
_schemas=(double_pinyin)
_pkgname=$_pkgbase-double-pinyin
pkgname=$_pkgname-git
pkgver=r183.cbd14d0
pkgrel=1
pkgdesc="Rime 配置：雾凇拼音 | 长期维护的简体词库 - 自然码双拼"
arch=("any")
url="https://github.com/iDvel/rime-ice"
license=("GPL3")
makedepends=("librime" "rime-prelude" "coreutils" "grep" "sed")
provides=("${_pkgname}")
conflicts=("rime-emoji" "${_pkgname}" "${_pkgbase}" "${_pkgbase}-pinyin" "${_pkgbase}-double-pinyin-flypy" "${_pkgbase}-double-pinyin-mspy")
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
    mapfile -t _deps <<< "$(grep -A3 'dependencies:' "$_s.schema.yaml" | tail -n3 | sed 's/#.*//g;s/.*- //g;s/ //g')"
    _schemas_deps=("${_schemas_deps[@]}" "${_deps[@]}")
  done

  mapfile -t _schemas_deps <<< "$(printf "%s\n" "${_schemas_deps[@]}" | sort -u)"
  # build current schema and it's depends only, sort by length
  _schemas=("${_schemas_deps[@]}" "${_schemas[@]}")

  for _s in "${_schemas[@]}"; do rime_deployer --compile "$_s.schema.yaml"; done

  # comment ignore schemas
  _suggestion_schemas=$(grep -A4 'schema_list:' "$_suggestion" | tail -n4 | sed 's/.*schema: //g')

  for _s in $_suggestion_schemas; do
    [[ ! ${_schemas[*]} =~ (^|[[:space:]])"$_s"($|[[:space:]]) ]] && sed -i "s/^\s*- schema: $_s/#&/" "$_suggestion";
  done

  find . -type l -delete
}

package() {
  cd "${_pkgname}" || return

  _install_base=$pkgdir/usr/share/rime-data

  install -Dm644 "$_suggestion" rime.lua -t "$_install_base/"
  install -Dm644 ./build/*.{bin,yaml}    -t "$_install_base/build"

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
    grep -q "\- ${_f/.dict.yaml/}" "$_install_base/"*.dict.yaml &&
      install -Dm644 "$_f" -t "$_install_base/$(dirname "$_f")"
  done

  for _f in *.yaml; do
    grep -q "${_f/.yaml/:}" build/*.schema.yaml &&
      install -Dm644 "$_f" -t "$_install_base/"
  done

  for _f in *.gram; do
    grep -q "${_f/.gram/}" build/*.schema.yaml &&
      install -Dm644 "$_f" -t "$_install_base/"
  done
}
