# Maintainer: TheNumb <me (at) thenumb (dot) eu>
# Contributor: Martchus <martchus@gmx.net>

pkgname=gnome-breeze-git
pkgver=42.f8dafee
pkgrel=1
pkgdesc="A GTK theme created to match with the new Plasma 5 Breeze (git version)."
arch=('any')
url="https://github.com/dirruk1/gnome-breeze"
license=('LGPL')
optdepends=("gtk2: GTK+2 theme" "gtk3: GTK+3 theme")
makedepends=('git')
conflicts=('gtk-theme-breezy-gtk3' 'gtk-theme-breezy-gtk2' ' gtk-theme-breezy')
# GTK 3.20 version from magnific0 has been merged
source=(${pkgname}::"git+https://github.com/dirruk1/gnome-breeze.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${pkgname}"

  # under Arch I suppose we always want the latest GTK 3 version -> determine latest version
  declare -A _latest
  for theme in Breeze*; do
    pushd "$theme" > /dev/null
    for ver in *; do
      if [[ -d $ver ]] && [ "${ver:0:6}" == 'gtk-3.' ] && [ $(vercmp "${_latest["$theme"]}" "${ver:6}") -le 0 ]; then
        _latest["$theme"]="${ver:6}"
      fi
    done
    popd > /dev/null
  done

  # install GTK 2 version and latest GTK 3 version
  for theme in Breeze*; do
    echo "Installing latest GTK 3 version for $theme which is is 3.${_latest["$theme"]}"
    find "$theme/gtk-"{2.0,"3.${_latest["$theme"]}"} -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
  done

  # ensure the GTK 3 themes are still found
  for theme in Breeze*; do
    mv "$pkgdir/usr/share/themes/${theme}/gtk-3."{"${_latest["$theme"]}",0}
  done
}
