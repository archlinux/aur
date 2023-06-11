# Maintainer:
# Contributor: Haron Prime (Haron_Prime) <haron.prime@gmx.com>

_pkgname="gis-weather"
pkgname="$_pkgname-git"
pkgver=0.8.4.17.r3.g98fd207
pkgrel=1
pkgdesc="Customizable weather widget"
arch=('any')
url="https://github.com/RingOV/gis-weather"
license=('GPL3')
depends=(
  'gtk3'
  'libappindicator-gtk3'
  'python'
  'python-cairo'
  'python-distro'
  'python-gobject'
)
makedepends=(
  'git'
)

provides=("$_pkgname")
conflicts=(${provides[@]})

source=(
  "$_pkgname"::"git+https://github.com/RingOV/gis-weather"
  "gis-weather.desktop"
)
sha256sums=(
  'SKIP'
  'e5bd1f85c730fcf4a5cc2618b2cb3184597443188b12eb2071540468418575e3'
)

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_pkgname"

  # symlink executable
  mkdir -p "$pkgdir/usr/bin"
  ln -s '/usr/share/gis-weather/gis-weather.py' "$pkgdir/usr/bin/gis-weather"

  # install files
  install -vDm0755 'gis-weather.py' -t "$pkgdir/usr/share/gis-weather"
  install -vDm0644 'icon.png' -t "$pkgdir/usr/share/pixmaps"
  install -vDm0644 "$srcdir/gis-weather.desktop" -t "$pkgdir/usr/share/applications"

  install -vDm0644 {'icon.png','README.md'} -t "$pkgdir/usr/share/gis-weather"

  #install folders
  for _f in 'dialogs' 'i18n' 'po' 'services' 'themes' 'utils' ; do
    cp --reflink=auto -r "$_f" "$pkgdir/usr/share/gis-weather/"
  done
}
