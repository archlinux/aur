pkgname=gnome-shell-extension-bing-wallpaper
pkgver=52
pkgrel=1
pkgdesc="Changes your wallpaper daily to the bing.com background image"
arch=(any)
url="https://github.com/neffo/bing-wallpaper-gnome-extension"
license=(GPL3)
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
sha256sums=('e64c4fc53e8b04fffaea31440dea7f676256e0758c3bec337720bb13659c8e2a')

prepare() {
  cd bing-wallpaper-gnome-extension
}

build() {
  cd bing-wallpaper-gnome-extension
  glib-compile-schemas schemas/
  intltool-extract --type=gettext/glade ui/prefsadw.ui
  intltool-extract --type=gettext/glade ui/carousel4.ui
  xgettext -k -k_ -kN_ --omit-header -o locale/BingWallpaper.pot ui/prefsadw.ui.h ui/carousel4.ui.h extension.js prefs.js blur.js utils.js --from-code=UTF-8

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
