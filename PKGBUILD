# Maintainer: Christian Schendel <doppelhelix@gmail.com>

pkgname=gnome-shell-extension-compiz-alike-windows-effect-git
pkgver=r47.0fd213d
pkgrel=1
pkgdesc="Wobbly windows effect inspired by the Compiz ones"
arch=('any')
url="https://github.com/hermes83/compiz-alike-windows-effect"
install="compiz-alike.install"
license=('GPL3')
depends=('gnome-shell>=3.28')
makedepends=('git' 'glib2')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
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

  local uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  #local schema=$(grep -Po '(?<="settings-schema": ")[^"]*' metadata.json).gschema.xml
  local schema=org.gnome.shell.extensions.com.github.hermes83.compiz-alike-windows-effect.gschema.xml
  local destdir="${pkgdir}/usr/share/gnome-shell/extensions/${uuid}"

  install -dm755 "${destdir}"
  find . -regextype posix-egrep -regex ".*\.(js|json|compiled)$" -exec\
     install -Dm 644 {} ${destdir}/{} \;
  cd "${srcdir}/${pkgname%-git}/schemas"
  sed -i "s_/extensions/ncom/github/hermes83_/extensions_g" ${schema}
  install -Dm644 "${srcdir}/${pkgname%-git}/schemas/${schema}" \
    "${pkgdir}/usr/share/glib-2.0/schemas/${schema}"
}
