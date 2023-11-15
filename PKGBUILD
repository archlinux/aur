pkgname=gnome-shell-extension-bing-wallpaper
pkgver=48
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
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/neffo/bing-wallpaper-gnome-extension/archive/v${pkgver}.tar.gz")
sha256sums=('01b018c61b186d047e7064c5acef9f8d91889316d9f6e142fe46597dbcfa8d84')

prepare() {
  cd bing-wallpaper-gnome-extension-${pkgver}
}

build() {
  cd bing-wallpaper-gnome-extension-${pkgver}
  glib-compile-schemas schemas/
  intltool-extract --type=gettext/glade ui/Settings4.ui
  intltool-extract --type=gettext/glade ui/carousel4.ui
  xgettext -k -k_ -kN_ --omit-header -o locale/BingWallpaper.pot ui/Settings4.ui.h ui/carousel4.ui.h extension.js prefs.js blur.js utils.js --from-code=UTF-8

  for D in locale/*; do
      if [ -d "${D}" ]; then
          msgfmt --template=BingWallpaper.pot --statistics --verbose -o "${D}/LC_MESSAGES/BingWallpaper.mo" "${D}/LC_MESSAGES/BingWallpaper.po"  2>> translations.txt
      fi
  done

  rm -rf .??*
  rm -rf BingWallpaper@ineffable-gmail.com.zip screenshot/* screenshot *.sh npm-debug.log icons/original/* *.h package.json *.po *.pot test.js
}

package() {
  cd bing-wallpaper-gnome-extension-${pkgver}

  _uuid="$(cat metadata.json | jq --raw-output '.uuid')"
  _dest_dir="/usr/share/gnome-shell/extensions/${_uuid}"

  mkdir -p "${pkgdir}/${_dest_dir}"
  cp -r * "${pkgdir}/${_dest_dir}"
}
