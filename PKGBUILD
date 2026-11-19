# Maintainer: aur.chaotic.cx
# Contributor: gee

_pkgname="ialauncher"
pkgname="$_pkgname-git"
pkgver=r697.81735b7f
pkgrel=1
pkgdesc="Play all of the Internet Archive's MS-DOS games offline"
url="https://github.com/rtts/ialauncher"
license=('GPL-3.0-or-later')
arch=('any')

depends=(
  'dosbox'
  'hicolor-icon-theme'
  'python'
  'python-pygame-ce' # AUR
  'python-pyxdg'
)
makedepends=(
  'git'
  'imagemagick'
  'optipng'
  'python-build'
  'python-hatchling'
  'python-installer'
)

options=('!debug' '!strip')

_pkgsrc="$_pkgname"
source=(
  "$_pkgsrc"::"git+$url.git"
  '0001-Add-CLI-options-list-download-start.patch'
)
sha256sums=(
  'SKIP'
  '8ef8dba23442dfb2a811ff1657e9b0f677864a7182a65621a587a4ee4d74a4f4'
)

prepare() {
  cd "$_pkgsrc"

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    src="${src%.zst}"
    if [[ $src == *.patch ]]; then
      printf '\nApplying patch: %s\n' "$src"
      patch -Nfp1 -F100 -i "${srcdir:?}/$src"
    fi
  done

  echo "Converting app icon..."
  magick windows/ia.ico[3] "$_pkgname.png"

  echo "Optimizing title images..."
  find games -type f -name '*.png' -print0 | xargs -0 -n 1 -P "$(nproc)" optipng &> /dev/null
}

pkgver() {
  cd "$_pkgsrc"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgsrc"
  python -m build --no-isolation --wheel
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 "$_pkgname.png" -t "$pkgdir/usr/share/icons/hicolor/48x48/apps/"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" << END
[Desktop Entry]
Type=Application
Name=IA Launcher
Comment=$pkgdesc
Exec=$_pkgname
Icon=$_pkgname
Terminal=false
Categories=Games;
END
}
