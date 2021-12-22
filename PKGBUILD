# Maintainer: Christian Schendel <doppelhelix at gmail dot com>
pkgname=gnome-shell-extension-useless-gaps-git
pkgver=r14.672d14e
pkgrel=1
pkgdesc="Useless Gaps is a GNOME Shell Extension which for aesthetic purposes adds 'useless gaps' around windows."
arch=(any)
url="https://github.com/mipmip/gnome-shell-extensions-useless-gaps"
install=${pkgname%-git}.install
license=('GPL3')
depends=('gnome-shell>=40')
makedepends=('git' 'glib2' 'gettext')
conflicts=("${pkgname%-git}")
provides=(${pkgname%-git})
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

build() {
  cd "${srcdir}/${pkgname%-git}"
  # Compiling translations...
  for po in locale/*/LC_MESSAGES/*.po; do
    msgfmt -cv -o ${po%.po}.mo $po;
  done
  glib-compile-schemas --targetdir=src/schemas src/schemas
  rm -Rf build
  mkdir build
  cp -r src/* locale build/
}

package() {
  cd "${srcdir}/${pkgname%-git}/build"
  local uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  local schema=$(grep -Po '(?<="settings-schema": ")[^"]*' metadata.json).gschema.xml
  local destdir="${pkgdir}/usr/share/gnome-shell/extensions/${uuid}"
  install -dm755 "${destdir}"
  find . -regextype posix-egrep -regex ".*\.(js|json|xml|css|mo|compiled)$" -exec\
     install -Dm 644 {} ${destdir}/{} \;
  install -Dm644 "${srcdir}/${pkgname%-git}/build/schemas/${schema}" \
    "${pkgdir}/usr/share/glib-2.0/schemas/${schema}"
}

