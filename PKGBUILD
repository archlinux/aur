# Maintainer: Christian Schendel <doppelhelix@gmail.com>

pkgname=gnome-shell-extension-dynamic-calendar-and-clocks-icons-git
pkgver=r9.e9d7cde
pkgrel=1
pkgdesc="A GNOME shell extension that let Calendar and Clocks icons show current date and time."
arch=('any')
url="https://github.com/fcusr/dynamic-calendar-and-clocks-icons"
install="${pkgname%-git}.install"
license=('GPL3')
depends=('gnome-shell>=1:43')
makedepends=('git'
             'glib2')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip')
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"

  # support repositories that start without a tag but get tagged later on
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  # Some extensions use make only to zip. We need to harcode the existing path
  local extension_dir="${srcdir}/${pkgname%-git}/dynamic-calendar-and-clocks-icons@fcusr.github.com"

  cd "${extension_dir}"

  # It's nice to have a well-formed metadata.json but we need to work around some hickups that may occur
  local uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  #local schema=$(grep -Po '(?<="settings-schema": ")[^"]*' metadata.json).gschema.xml
  local schema=org.gnome.shell.extensions.dynamic-calendar-and-clocks-icons.gschema.xml
  local destdir="${pkgdir}/usr/share/gnome-shell/extensions/${uuid}"

  install -dm755 "${destdir}"
  # Don't install unnecessary files
  find . -regextype posix-egrep -regex ".*\.(js|json|xml|png|svg|css|compiled)$" -exec\
     install -Dm 644 {} ${destdir}/{} \;

  install -Dm644 "schemas/${schema}" \
    "${pkgdir}/usr/share/glib-2.0/schemas/${schema}"

  # rebuild compiled GSettings schemas if missing
  if [[ ! -f "${destdir}/schemas/gschemas.compiled" ]]; then
    glib-compile-schemas "${destdir}/schemas"
  fi
}

