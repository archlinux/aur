# Maintainer: Christian Schendel <doppelhelix@gmail.com>

pkgname=gnome-shell-extension-gnome-clipboard-history
pkgver=1.3.2
pkgrel=1
pkgdesc="Gnome Clipboard History is a Gnome extension that saves what you've copied into an easily accessible, searchable history panel."
arch=('any')
url="https://github.com/SUPERCILEX/gnome-clipboard-history"
install="${pkgname}.install"
license=('MIT')
depends=('gnome-shell>=1:40')
makedepends=('git'
             'glib2'
             'curl'
             'jq')
provides=("${pkgname}")
conflicts=('gnome-shell-extension-gnome-clipboard-history'
           'gnome-shell-extension-clipboard-indicator')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('08e6de8cf61bfce9f258f0f480e2ec0d15f87656f947a06cec2dd66afb8c3919')

package() {
  cd "$(dirname $(find -name 'metadata.json' -print -quit))"
  make compile-locales
  local uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  local schema=org.gnome.shell.extensions.clipboard-indicator.gschema.xml
  local destdir="${pkgdir}/usr/share/gnome-shell/extensions/${uuid}"
  install -dm755 "${destdir}"
  find . -regextype posix-egrep -regex ".*\.(js|json|xml|css|mo|compiled)$" -exec\
     install -Dm 644 {} ${destdir}/{} \;
  install -Dm644 "schemas/${schema}" \
    "${pkgdir}/usr/share/glib-2.0/schemas/${schema}"
# rebuild compiled GSettings schemas if missing
  if [[ ! -f "${destdir}/schemas/gschemas.compiled" ]]; then
    glib-compile-schemas "${destdir}/schemas"
  fi
}

