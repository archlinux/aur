# Maintainer: Christian Schendel <doppelhelix@gmail.com>
pkgname=gnome-shell-extension-replace-activities-label-git
pkgver=r5.0a0fff2
pkgrel=2
pkgdesc="Remove the AppMenu, replace the activities label with 3 dots and animate them as a loading spinner."
arch=(any)
url="https://github.com/Leleat/replace-activities-label"
install=${pkgname%-git}.install
license=('GPL')
depends=('gnome-shell>=1:43')
makedepends=('git'
             'glib2')
conflicts=("${pkgname%-git}")
provides=(${pkgname%-git})
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')
options=('!strip')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"

  # support repositories that start without a tag but get tagged later on
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  local uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  local schema=org.gnome.shell.extensions.indicate-focus-prototype.gschema.xml
  local destdir="${pkgdir}/usr/share/gnome-shell/extensions/${uuid}"
  install -dm755 "${destdir}"
  find . -regextype posix-egrep -regex ".*\.(js|json|xml|css|mo|compiled|ui|svg)$" -exec \
    install -Dm 644 {} ${destdir}/{} \;
  install -Dm644 "${srcdir}/${pkgname%-git}/schemas/${schema}" \
    "${pkgdir}/usr/share/glib-2.0/schemas/${schema}"
# rebuild compiled GSettings schemas if missing
  if [[ ! -f "${destdir}/schemas/gschemas.compiled" ]]; then
    glib-compile-schemas "${destdir}/schemas"
  fi
}
