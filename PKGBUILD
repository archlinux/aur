# Maintainer:
# Contributor: Haron Prime (Haron_Prime) <haron.prime@gmx.com>

_pkgname="gis-weather"
pkgname="$_pkgname-git"
pkgver=0.8.4.25.r0.gc587055
pkgrel=1
pkgdesc="Customizable weather widget"
url="https://github.com/RingOV/gis-weather"
license=('GPL-3.0-only')
arch=('any')

depends=(
  'gtk3'
  'libappindicator'
  'python'
  'python-cairo'
  'python-distro'
  'python-gobject'
)
makedepends=(
  'git'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  local _file _regex _hash _ver _rev _commit
  _file="gis-weather.py"
  _regex="v = '([0-9.]+)'"
  read -r _hash _ver < <(
    NL=$(awk '/^'"${_regex}"'.*$/ { print NR; exit }' "$_file")
    git blame -L "$NL,+1" -- "$_file" \
      | sed -E -e 's&^([0-9a-f]+).*'"${_regex}"'.*$&\1 \2&'
  )

  git tag -f "$_ver" "$_hash"
  git describe --long --tags --abbrev=7 \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$_pkgsrc"

  # program files
  install -Dm755 'gis-weather.py' -t "$pkgdir/usr/share/gis-weather/"
  install -Dm644 {'icon.png','README.md'} -t "$pkgdir/usr/share/gis-weather/"

  for _f in 'dialogs' 'i18n' 'po' 'services' 'themes' 'utils'; do
    cp -r "$_f" "$pkgdir/usr/share/gis-weather/"
  done

  # symlink
  mkdir -pm755 "$pkgdir/usr/bin"
  ln -s '/usr/share/gis-weather/gis-weather.py' "$pkgdir/usr/bin/$_pkgname"

  # icon
  install -Dm644 'icon.png' "$pkgdir/usr/share/pixmaps/$_pkgname.png"

  # launcher
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" << END
[Desktop Entry]
Type=Application
Name=Gis Weather
Comment=Weather widget
Exec=$_pkgname
Icon=$_pkgname
Terminal=false
Categories=GNOME;Utility;
END
}
