# Maintainer: xiota
# Maintainer: novadragon <me@novadragon.space>

## options
: ${_build_debug:=true}

: ${_godot_version:=$(LC_ALL=C pacman -Si extra/godot | grep -Pom1 '^Version\s+:\s+\K\S+(?=-[0-9])')-stable}

_pkgname="godot-export-templates"
pkgname="$_pkgname-linux"
pkgver=4.5.1
pkgrel=1
pkgdesc='Godot export templates - Linux x86_64'
url="https://github.com/godotengine/godot"
license=('MIT')
arch=('any')

makedepends=(
  'scons'
  'wayland'
)
optdepends=(
  'godot: use the templates'
)

provides=("$_pkgname")

options=('!strip' '!debug')

_pkgsrc="godot-$_godot_version"
_pkgext="tar.xz"
source=(
  "$_pkgsrc.$_pkgext"::"$url/releases/download/$_godot_version/$_pkgsrc.$_pkgext"
  "$_pkgsrc.$_pkgext.sha256"::"$url/releases/download/$_godot_version/$_pkgsrc.$_pkgext.sha256"
)
sha256sums=(
  'SKIP'
  'SKIP'
)

prepare() {
  sha256sum -c "$_pkgsrc.$_pkgext.sha256"
}

pkgver() {
  echo "${_godot_version%-*}"
}

build() {
  cd "$_pkgsrc"
  scons platform=linux tools=no target=template_release arch=x86_64

  if [[ "${_build_debug::1}" == "t" ]]; then
    scons platform=linux tools=no target=template_debug arch=x86_64
  fi
}

package() {
  local _templates=('release')

  if [[ "${_build_debug::1}" == "t" ]]; then
    _templates+=('debug')
  fi

  for i in "${_templates[@]}"; do
    install -Dm755 "$_pkgsrc/bin/godot.linuxbsd.template_$i.x86_64" "$pkgdir/usr/share/godot/export_templates/${_godot_version//-/.}/linux_$i.x86_64"
  done

  install -Dm644 "$_pkgsrc/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
