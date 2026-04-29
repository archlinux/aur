pkgname=gnome-shell-extension-bing-wallpaper
pkgver=53
pkgrel=1
pkgdesc="Changes your wallpaper daily to the bing.com background image"
arch=(any)
url="https://github.com/neffo/bing-wallpaper-gnome-extension"
license=(GPL-3.0-or-later)
depends=('gnome-shell>=40.0')
makedepends=(
glib2
gettext
intltool
jq
git
)
#_commit=b3f1357de10fc8c12c0eea6eb574a4b9c2716409
source=("git+https://github.com/neffo/bing-wallpaper-gnome-extension.git#tag=v${pkgver}")
b2sums=('c87fc951422516fd8b7037d7e7bb6eb114c6999f660f1dc26e38d45403a048d8d381cd08c4250c4d22ffeb02432f5a5ceba89603b6794f242e74380c88e5a26f')

prepare() {
  cd bing-wallpaper-gnome-extension
}

build() {
  cd bing-wallpaper-gnome-extension
  glib-compile-schemas schemas/
  intltool-extract --type=gettext/glade ui/prefsadw.ui
  xgettext -k -k_ -kN_ --omit-header -o locale/BingWallpaper.pot \
	  ui/prefsadw.ui.h \
	  ui/intervals.utils.js.h \
	  extension.js prefs.js \
	  --from-code=UTF-8

  for D in locale/*; do
      if [ -d "${D}" ]; then
          msgfmt --template=BingWallpaper.pot --statistics --verbose -o "${D}/LC_MESSAGES/BingWallpaper.mo" "${D}/LC_MESSAGES/BingWallpaper.po"  2>> translations.txt
      fi
  done

  rm -rf .??*
  rm -rf BingWallpaper@ineffable-gmail.com.zip screenshot/* screenshot *.sh npm-debug.log icons/original/* *.h package.json *.po *.pot test.js
}

package() {
  cd bing-wallpaper-gnome-extension

  _uuid="$(cat metadata.json | jq --raw-output '.uuid')"
  _dest_dir="/usr/share/gnome-shell/extensions/${_uuid}"

  mkdir -p "${pkgdir}/${_dest_dir}"
  cp -r * "${pkgdir}/${_dest_dir}"
}
