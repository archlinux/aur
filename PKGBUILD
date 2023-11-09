# Maintainer: getzze <getzze at gmail dot com>

pkgname=gnome-shell-extension-tophat
_pkgbase=tophat
pkgver=11
pkgrel=1
pkgdesc="View CPU, memory, disk, and network activity in the GNOME top bar (v45 fork)."
arch=(any)
url="https://github.com/fflewddur/tophat"
license=(GPL3)
depends=('dconf' 'gnome-shell>=45' 'libgtop')
makedepends=('git' 'unzip' 'gettext')
provides=(gnome-shell-extension-tophat)
conflicts=(gnome-shell-extension-tophat)
source=($_pkgbase::git+https://github.com/enecciari/tophat.git#branch=45)
sha256sums=('SKIP')

#pkgver() {
  #cd "$_pkgbase"
  #git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
#}

build() {
  cd "$srcdir/$_pkgbase"
  local _uuid="tophat@fflewddur.github.io"

  ./translate.sh
  mkdir -p ./${_uuid}/locale
  for potfile in po/*.po; do
    locale=$(basename "$potfile" .po)
    _path="./${_uuid}/locale/${locale}/LC_MESSAGES"
    mkdir -p "$_path"
    msgmerge -U "${potfile}" po/$_pkgbase.pot
    msgfmt -o "$_path/${_uuid}.mo" "${potfile}"
  done

  #./package.sh
  #unzip ./tophat@fflewddur.github.io.shell-extension.zip
}

package() {
  cd "$srcdir/$_pkgbase"

  # Locate the extension.
  cd "$(dirname $(find -name 'metadata.json' -print -quit))"
  _uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json) 
  _destdir="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"

  # Copy extension files into place.
  find -maxdepth 1 \( -iname '*.js*' -or -iname '*.css' -or -iname '*.ui' -or -iname '*.json' \) -exec install -Dm644 -t "${_destdir}" '{}' +
  find -maxdepth 2 \( -iname '*.svg*' \) -exec install -Dm644 -t "${_destdir}/icons" '{}' +
  find -name '*.xml' -exec install -Dm644 -t "${pkgdir}/usr/share/glib-2.0/schemas/" '{}' +
  cp -r --no-preserve=ownership,mode lib "${_destdir}/lib"

  cd locale
  for locale in */; do
    install -Dm644 -t "${pkgdir}/usr/share/locale/${locale}/LC_MESSAGES" "${locale}/LC_MESSAGES"/*.mo
  done
}
