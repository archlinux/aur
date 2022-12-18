# Maintainer: Ewout van Mansom <ewout@vanmansom.name>

_extname=bedtime-mode
_reponame=gnome-bedtime-mode
_uuid=gnomebedtime@ionutbortis.gmail.com
pkgname=gnome-shell-extension-bedtime-mode
pkgver=v13.0
pkgrel=1
pkgdesc='Converts to grayscale the entire GNOME workspace by using a smooth transition.'
arch=('any')
url='https://github.com/ionutbortis/gnome-bedtime-mode'
license=('GPL3')
groups=('gnome-shell-extensions')
depends=('gnome-shell>=1:43')
makedepends=('git' 'glib2' 'unzip')
_commit=a6cd7636488dcca7a22b227bd862932410a1f602  # main^0
source=(
  "git+${url}.git#commit=${_commit}"
)
b2sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_reponame}"
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

build() {
  cd "${srcdir}/${_reponame}"
  ./scripts/build.sh
}

package() {
  cd "${srcdir}/${_reponame}"

  install -d "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
  install -d "$pkgdir/usr/share/glib-2.0/schemas"

  # copy extension schema to system-wide glib-2.0 location
  cp -r src/schemas/*gschema.* "$pkgdir/usr/share/glib-2.0/schemas"

  unzip build/"$_reponame"_13.0.zip -d "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"

  # remove redundant gschema, as it available to glib-2.0 system wide
  rm "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/schemas/org.gnome.shell.extensions.bedtime-mode.gschema.xml"
  rm "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/schemas/gschemas.compiled"
  rmdir "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/schemas"

  chown root:root -R "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
}
