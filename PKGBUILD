# Maintainer: Christian Schendel <doppelhelix@gmail.com>

pkgname=gnome-shell-extension-compiz-windows-effect-git
pkgver=r27.823aebb
pkgrel=1
pkgdesc="Compiz wobbly windows effect with libanimation engine."
arch=('any')
url="https://github.com/hermes83/compiz-windows-effect"
install=${pkgname%-git}.install
license=('GPL3')
depends=("gnome-shell>=3.28")
makedepends=('git'
             'glib2')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}.git")
options=('!strip')
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

  local uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  #local schema=$(grep -Po '(?<="settings-schema": ")[^"]*' metadata.json).gschema.xml
  local schema=org.gnome.shell.extensions.com.github.hermes83.compiz-windows-effect.gschema.xml
  local destdir="${pkgdir}/usr/share/gnome-shell/extensions/${uuid}"

  install -dm755 "${destdir}"
  find . -regextype posix-egrep -regex ".*\.(js|json|xml|compiled|)$" -exec\
     install -Dm 644 {} ${destdir}/{} \;
  install -Dm644 "${srcdir}/${pkgname%-git}/schemas/${schema}" \
    "${pkgdir}/usr/share/glib-2.0/schemas/${schema}"
# rebuild compiled GSettings schemas if missing
  if [[ ! -f "${destdir}/schemas/gschemas.compiled" ]]; then
    glib-compile-schemas "${destdir}/schemas"
  fi
}
