# Maintainer: Ewout van Mansom <ewout@vanmansom.name>
_extname=jiggle
_uuid=jiggle@jeffchannell.com
pkgname=gnome-shell-extension-jiggle
pkgver=8+r38+g436d1cf
pkgrel=10
pkgdesc='Gnome extension that highlights the cursor position when the mouse is moved rapidly.'
arch=('any')
url='https://github.com/jeffchannell/jiggle'
license=('GPL3')
groups=('gnome-shell-extensions')
depends=('gnome-shell>=1:43')
makedepends=('git' 'glib2' 'unzip')
_commit=436d1cf6f10e76ff27ce4775e8ebe666dc9d60c3  # master^0
source=(
  "git+${url}.git#commit=${_commit}"
  "gnome43-comp.patch::https://patch-diff.githubusercontent.com/raw/jeffchannell/jiggle/pull/68.patch"
  "system-wide-gschema-fix.patch::https://patch-diff.githubusercontent.com/raw/jeffchannell/jiggle/pull/70.patch"
)
b2sums=('SKIP'
        '3c020ba17d9ed52c627c41779dac81cf53c059e632b7bc677168f9819c9d79453178b0ff132b45d259340006021f2b5592612b4f69b6ef4d514701ef66fefe8e'
        '3f1775ce78220acd591b46f0822a5d1a3efa827edc2c8bafd6fdd625969aa94483022e19475afee840259b085c1a4697852b8b230b80e9a2441d741153c260e3')

prepare() {
  cd "${srcdir}/${_extname}"
  patch --forward --strip=1 --input="${srcdir}/gnome43-comp.patch"
  patch --forward --strip=1 --input="${srcdir}/system-wide-gschema-fix.patch"
}

pkgver() {
  cd "${srcdir}/${_extname}"
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

build() {
  cd "${srcdir}/${_extname}"
  make build
}

check() {
  cd "${srcdir}/${_extname}"
  make test
}

package() {
  cd "${srcdir}/${_extname}"

  install -d "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
  install -d "$pkgdir/usr/share/glib-2.0/schemas"

  # copy extension schema to system-wide glib-2.0 location
  cp -r ./schemas/*gschema.* "$pkgdir/usr/share/glib-2.0/schemas"

  unzip jiggle_latest.zip -d "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"

  # remove redundant gschema, as it available to glib-2.0 system wide
  rm "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/schemas/org.gnome.shell.extensions.jiggle.gschema.xml"
  rm "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/schemas/gschemas.compiled"
  rmdir "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/schemas"

  chown root:root -R "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
}
