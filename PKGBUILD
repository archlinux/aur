# Maintainer: Christian Schendel (doppelhelix@gmail.com)

pkgname=gnome-shell-extension-peek-top-bar-on-fullscreen-git
pkgver=r20.589c329
pkgrel=1
pkgdesc="Gnome Extension that triggers top panel to show up on full screen apps when cursor hovers the top edge of the screen"
arch=('any')
url="https://github.com/marcinjahn/gnome-peek-top-bar-on-fullscreen-extension"
license=('unknown')
depends=('gnome-shell')
makedepends=('git'
             'gobject-introspection'
             'npm')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${srcdir}/${pkgname%-git}"
  npm install
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  npm run build
}

package() {
  cd "${srcdir}/${pkgname%-git}/dist"
  local uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  local schema=org.gnome.shell.extensions.quicksettings-audio-devices-renamer.gschema.xml
  local destdir="${pkgdir}/usr/share/gnome-shell/extensions/${uuid}"
  install -dm755 "${destdir}"
  find . -regextype posix-egrep -regex ".*\.(js|json|compiled)$" -exec\
     install -Dm 644 {} ${destdir}/{} \;
  install -Dm644 "${srcdir}/${pkgname%-git}/dist/schemas/${schema}" \
    "${pkgdir}/usr/share/glib-2.0/schemas/${schema}"
}

