# Maintainer: aur.chaotic.cx
# Contributor: gee

_pkgname="ialauncher"
pkgname="$_pkgname-git"
pkgver=r684.d6a4370c
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
  'python-build'
  'python-installer'
  'python-hatchling'
)

options=('!strip')

_pkgsrc="$_pkgname"
source=(
  "$_pkgsrc"::"git+$url.git"
  '0001-Use-FHS-and-XDG-paths.patch'
  '0002-Drop-CLI-options-stats-build-cache.patch'
  '0003-Add-CLI-options-list-download-start.patch'
)
sha256sums=(
  'SKIP'
  'ba53a638bf230bb5e38ad1abe8dec2ba60421a8f36faf092b60feddc7cad9779'
  '971cb225c27766aa5330d5fd724addec167a0e95ea489d7d5237fcb4a3b00cb8'
  'e13e8a2b826c5ac947a4f5c8d2463acb79734fee722d14e8e165e56021d807b3'
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

  # convert icon
  magick windows/ia.ico[3] "$_pkgname.png"
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

  mkdir -pm755 "$pkgdir/usr/share/$_pkgname"
  cp -r games/* "$pkgdir/usr/share/$_pkgname/"

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
