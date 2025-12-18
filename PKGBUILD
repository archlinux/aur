# Maintainer: Alonso Herreros <alonso.herreros at gmail.com

_pkgbase="hyprcap"
pkgname="$_pkgbase-git"
pkgver=1.3.1.r3.7bb4fe8
pkgrel=1
url="https://github.com/alonso-herreros/hyprcap"
pkgdesc="A utility to easily capture screenshots and recordings in Hyprland"
license=('GPL-3.0-only')
arch=('any')

depends=(
  'hyprland'
  'bash'
  'grim'
  'wf-recorder'
  'jq'
  'libnotify'
  'slurp'
  'hyprpicker' # To freeze the screen
  'wl-clipboard'
)
makedepends=(
  'git'
)

provides=("$_pkgbase")
conflicts=("$_pkgbase")

source=("$_pkgbase::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgbase"
  local tag ver rev hash
  tag="$(git tag -l "v*" --sort=-v:refname | head -n1)"
  ver="${tag#v}"
  rev="$(git rev-list --count "$tag"..HEAD)"
  hash="$(git rev-parse --short HEAD)"
  printf "%s.r%s.%s" "$ver" "$rev" "$hash"
}

package() {
  cd "$srcdir/$_pkgbase"

  export DESTDIR="$pkgdir"
  export PKGBASE="$_pkgbase"
  export PREFIX="/usr"

  make
  make install
}
