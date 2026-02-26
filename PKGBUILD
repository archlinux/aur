# Maintainer: Albert Zhang <bert@alchzh.me>

_pkgname=sddm-theme-catppuccin
pkgname="$_pkgname-git"
pkgver=1.1.1.r6.g2869909
pkgrel=1
pkgdesc='Soothing pastel theme for SDDM'

arch=('any')
url='https://github.com/catppuccin/sddm'
license=('MIT')

depends=(
  'sddm'
  'qt6-svg'
  'qt6-declarative'
)
makedepends=(
  'git'
  'just'
  'whiskers'
)
provides=("$_pkgname")
conflicts=("$_pkgname")

source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

backup=($(printf 'usr/share/sddm/themes/%s/theme.conf ' "${_themes[@]}"))

pkgver() {
  cd "$_pkgname"
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  just build
}

package() {
  cd "$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  cd themes
  for dir in */; do
    [ -e "$dir/theme.conf" ] || continue
    find ./$dir -type f -exec install -Dm644 {} "$pkgdir/usr/share/sddm/themes/{}" \;
  done
}

