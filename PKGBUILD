# Maintainer: Christian Schendel <doppelhelix@gmail.com>

pkgname=gnome-shell-extension-compiz-windows-effect-git
pkgver=r14.3e34af7
pkgrel=2
pkgdesc="Compiz wobbly windows effect with libanimation engine."
arch=('any')
url="https://github.com/hermes83/compiz-windows-effect"
install=${pkgname%-git}.install
license=('GPL3')
depends=("gnome-shell>=3.28")
optdepends=("libanimation-gnome-shell-git")
makedepends=('git' 'glib2')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/hermes83/compiz-windows-effect.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  local _uuid="compiz-windows-effect@hermes83.github.com"
  local _destdir="$pkgdir/usr/share/gnome-shell/extensions/$_uuid"

  cd "${srcdir}/${pkgname%-git}"
  find . -regextype posix-egrep -regex ".*\.(js|json)$" -exec\
   install -Dm 644 {} ${_destdir}/{} \;
  cp -R schemas "${_destdir}"
  #rebuild compiled GSettings schemas if missing
  if [[ ! -f "${_destdir}/schemas/gschemas.compiled" ]]; then
    glib-compile-schemas "${_destdir}/schemas"
  fi
  chmod -R 755 "${_destdir}"
}
