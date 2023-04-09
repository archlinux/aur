# Contributor: 2xsaiko <aur@dblsaiko.net>

_gitname="kde-rounded-corners"
_pkgname="kwin-effect-rounded-corners"
pkgname="$_pkgname-git"
pkgver=r223.28855e8
pkgrel=1
pkgdesc="Rounds the corners of your windows"
arch=('x86_64')
url="https://github.com/matinlotfali/KDE-Rounded-Corners"
license=("GPL3")
provides=(
  "$_gitname"{,-git}
  "$_pkgname"
  "kwin-effect-shapecorners"{,-git}
)
conflicts=(${provides[@]})
replaces=(
  "$_gitname"{,-git}
  "kwin-effect-shapecorners"{,-git}
)
depends=(
  'kwin'
)
makedepends=(
  'cmake'
  'extra-cmake-modules'
  'git'
  'kinit'
  'qt5-tools'
)

source=(
  "$_gitname"::"git+$url"
)
sha512sums=(
  "SKIP"
)

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p qt5build
}

build() {
  cd qt5build
  cmake "../$_gitname" \
    -DCMAKE_INSTALL_PREFIX='/usr/lib/qt/plugins/' \
    -DQT5BUILD=ON
  make
}

package() {
  cd qt5build
  make DESTDIR="$pkgdir" install

  # fix file locations
  mkdir -p "$pkgdir/usr/lib/qt/plugins"
  mv "$pkgdir/kwin" "$pkgdir/usr/lib/qt/plugins/"
}
