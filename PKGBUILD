# Maintainer:

: ${_godot_version:=$(LC_ALL=C pacman -Si extra/godot | grep -Pom1 '^Version\s+:\s+\K\S+(?=-[0-9])')-stable}

_pkgname="godot-export-templates"
pkgbase="$_pkgname-bin"
pkgver=4.5
pkgrel=1
pkgdesc='Godot export templates'
url="https://github.com/godotengine/godot"
license=('MIT')
arch=('any')

optdepends=(
  'godot: use the templates'
)

options=('!strip' '!debug')

provides=("$_pkgname")

source=(
  "$url/releases/download/$_godot_version/Godot_v${_godot_version}_export_templates.tpz"
  "godot-${_godot_version%-*}-LICENSE.MIT"::"$url/raw/refs/tags/$_godot_version/LICENSE.txt"
)
sha256sums=(
  'SKIP'
  'b0435e3b3e4e55238f05f4b306f30524a1b2e20147810d436eaa554fa6855c80'
)

pkgver() {
  echo "${_godot_version%-*}"
}

_package() {
  provides+=("${pkgname%-bin}")
  conflicts=("${pkgname%-bin}")

  local _install_path="usr/share/godot/export_templates/${_godot_version//-/.}"
  mkdir -pm755 "$pkgdir/$_install_path/"

  if [ "$_type" != "apple" ]; then
    cp -r "templates/${_type}"* "$pkgdir/$_install_path/"
  else
    cp -r "templates"/{macos,ios}* "$pkgdir/$_install_path/"
  fi

  install -Dm644 "godot-${_godot_version%-*}-LICENSE.MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

pkgname=(
  'godot-export-templates-android-bin'
  'godot-export-templates-apple-bin'
  'godot-export-templates-linux-bin'
  'godot-export-templates-web-bin'
  'godot-export-templates-windows-bin'
)

for _pkg in "${pkgname[@]}"; do
  _os=$(cut -d'-' -f4 <<< "$_pkg")
  eval "package_${_pkg}() {
    local _type=$_os
    pkgdesc+=' - $_os'
    $(declare -f _package | tail -n +3)"
done
