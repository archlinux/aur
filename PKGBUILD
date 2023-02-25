# Maintainer: Christian Schendel (doppelhelix@gmail.com)

pkgname=gnome-shell-extension-pano-git
pkgver=10.r14.gdc3fc6f
pkgrel=3
pkgdesc="Next-gen Clipboard Manager"
arch=('any')
url="https://github.com/oae/gnome-shell-pano"
install=${pkgname%-git}.install
license=('GPL')
groups=('gnome-shell-extensions')
depends=('gnome-shell>=42'
         'libgda6'
         'gobject-introspection'
         'cogl'
         'gsound')
makedepends=('git'
             'glib2'
             'yarn'
             'appstream')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}.git")
options=('!strip')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${pkgname%-git}"
  yarn install
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  yarn build

}

package() {
  cd "${srcdir}/${pkgname%-git}/dist"
  local uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  local schema=$(grep -Po '(?<="settings-schema": ")[^"]*' metadata.json).gschema.xml
  local destdir="${pkgdir}/usr/share/gnome-shell/extensions/${uuid}"
  install -dm755 "${destdir}"
  find . -regextype posix-egrep -regex ".*\.(js|json|xml|css|mo|compiled|svg|png)$" -exec\
     install -Dm 644 {} ${destdir}/{} \;
  install -Dm644 "${srcdir}/${pkgname%-git}/dist/schemas/${schema}" \
    "${pkgdir}/usr/share/glib-2.0/schemas/${schema}"
# rebuild compiled GSettings schemas if missing
  if [[ ! -f "${destdir}/schemas/gschemas.compiled" ]]; then
    glib-compile-schemas "${destdir}/schemas"
  fi
}

