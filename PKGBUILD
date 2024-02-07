# Maintainer:

_pkgname="olivia"
pkgname="$_pkgname-git"
pkgver=1.2.r9.g4048134f
pkgrel=1
pkgdesc="Elegant Cloud Music Player for Linux Desktop"
url="https://github.com/keshavbhatt/olivia"
license=('MIT')
arch=('i686' 'x86_64')

depends=(
  'ffmpeg'
  'mpv'
  'pv'
  'python'
  'qt5-base'
  'qt5-webkit' # AUR
  'socat'
  'taglib'
  'wget'
)
makedepends=(
  'git'
  'qt5-tools'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"

  local _regex='^version: '\''([0-9\.]+)'\''$'
  local _file='snap/snapcraft.yaml'

  local _line=$(grep -Esm1 "$_regex" "$_file")
  local _line_num=$(grep -Ensm1 "$_regex" "$_file" | cut -d':' -f1)

  local _version=$(sed -E "s@$_regex@\1@" <<< "$_line")

  local _commit=$(git blame -L $_line_num,+1 -- "$_file" | awk '{print $1;}')

  local _revision=$(git rev-list --count --cherry-pick $_commit...HEAD)
  local _hash=$(git rev-parse --short=8 HEAD)

  printf "%s.r%s.g%s" "$_version" "$_revision" "$_hash"
}

build() {
  mkdir -p build && cd build
  qmake "$srcdir/$_pkgsrc/src/Olivia.pro" PREFIX="$pkgdir/usr" -spec linux-g++ CONFIG+=release
  make
}

package() {
  cd build
  make install # ignores DESTDIR

  install -Dm644 "$srcdir/$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
