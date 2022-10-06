# Maintainer: Christian Schendel (doppelhelix@gmail.com)
# Maintainer: Kevin Concilio (kevin.concilio1@gmail.com)


pkgname=gnome-shell-extension-pano
pkgver=10
pkgrel=1
pkgdesc="Next-gen Clipboard Manager"
arch=('any')
url="https://github.com/oae/gnome-shell-pano"
install=${pkgname}.install
license=('GPL')
groups=('gnome-shell-extensions')
depends=('gnome-shell>=42'
         'libgda'
         'gobject-introspection')
makedepends=('git'
             'glib2'
             'yarn'
             'appstream')
provides=("${pkgname}")
conflicts=("${pkgname%-git}")
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
options=('!strip')
md5sums=(21754ab62c1c5c1f2d700fb535759ed2)

dirname=gnome-shell-pano-${pkgver}

prepare() {
  cd "${srcdir}/${dirname}"
  yarn install
}

build() {
  cd "${srcdir}/${dirname}"
  yarn build

}

package() {
  cd "${srcdir}/${dirname}/dist"
  local uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  local schema=$(grep -Po '(?<="settings-schema": ")[^"]*' metadata.json).gschema.xml
  local destdir="${pkgdir}/usr/share/gnome-shell/extensions/${uuid}"
  install -dm755 "${destdir}"
  find . -regextype posix-egrep -regex ".*\.(js|json|xml|css|mo|compiled|svg|png)$" -exec\
     install -Dm 644 {} ${destdir}/{} \;
  install -Dm644 "${srcdir}/${dirname}/dist/schemas/${schema}" \
    "${pkgdir}/usr/share/glib-2.0/schemas/${schema}"
# rebuild compiled GSettings schemas if missing
  if [[ ! -f "${destdir}/schemas/gschemas.compiled" ]]; then
    glib-compile-schemas "${destdir}/schemas"
  fi
}

