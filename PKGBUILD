# Maintainer:
# Contributor: gee

_pkgname="ialauncher"
pkgname="$_pkgname-git"
pkgver=r138.311816c
pkgrel=2
pkgdesc="Play all of the Internet Archive's MS-DOS games offline"
url="https://github.com/rtts/ialauncher"
license=('GPL-3.0-or-later')
arch=('any')

depends=(
  'dosbox'
  'hicolor-icon-theme'
  'python'
  'python-pygame'
  'python-pyxdg'
)
makedepends=(
  'git'
  'imagemagick'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

_pkgsrc="$_pkgname"
source=(
  "$_pkgsrc"::"git+$url.git"
  '0001-Use-FHS-and-XDG-paths.patch'
  '0002-Add-CLI-commands.patch'
)
sha256sums=(
  'SKIP'
  '5e8e0e2b9bbcf6b1ca6a8ff746a64519ce58fdfc1ca96cddfe7f6c8eb9f6b85e'
  'fa0fadce72ce3457d6c1af3a902b2b834ebd32a90aa08825a65618ea5f4efcf6'
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
      patch -Np1 -F100 -i "${srcdir:?}/$src"
    fi
  done
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

  mkdir -p "$pkgdir/usr/share/$_pkgname"
  cp -r games/* "$pkgdir/usr/share/$_pkgname/"

  install -Dm644 <(magick ia.ico[4] -) "$pkgdir/usr/share/icons/hicolor/256x256/apps/$_pkgname.png"

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
