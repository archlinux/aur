# Maintainer: Christian Schendel <doppelhelix@gmail.com>

pkgname=gnome-shell-extension-gnome-clipboard-history-git
pkgver=37.r220.g348685b
pkgrel=2
pkgdesc="Gnome Clipboard History is a Gnome extension that saves what you've copied into an easily accessible, searchable history panel."
arch=('any')
url="https://github.com/SUPERCILEX/gnome-clipboard-history"
install="${pkgname}.install"
license=('MIT')
depends=('gnome-shell>=1:40')
makedepends=('git'
             'glib2')
provides=("${pkgname%-git}")
conflicts=('gnome-shell-extension-clipboard-indicator-git')
options=('!strip')
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  make compile-locales
  local uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  local schema=org.gnome.shell.extensions.clipboard-indicator.gschema.xml
  local destdir="${pkgdir}/usr/share/gnome-shell/extensions/${uuid}"
  install -dm755 "${destdir}"
  find . -regextype posix-egrep -regex ".*\.(js|json|xml|css|mo|compiled)$" -exec\
     install -Dm 644 {} ${destdir}/{} \;
  install -Dm644 "${srcdir}/${pkgname%-git}/schemas/${schema}" \
    "${pkgdir}/usr/share/glib-2.0/schemas/${schema}"
# rebuild compiled GSettings schemas if missing
  if [[ ! -f "${destdir}/schemas/gschemas.compiled" ]]; then
    glib-compile-schemas "${destdir}/schemas"
  fi
}

