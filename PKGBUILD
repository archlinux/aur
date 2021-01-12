# Maintainer: Christian Schendel <doppelhelix@gmail.com>
pkgname=gnome-shell-extensions-gravatar-git
pkgver=7.r0.gc4a6e34
pkgrel=1
pkgdesc="GNOME Shell extension to synchronize your user icon with Gravatar"
arch=('any')
url="https://github.com/jrouleau/gnome-shell-extensions-gravatar"
install=${pkgname%-git}.install
license=('MIT')
depends=('gnome-shell>=3.32')
makedepends=('git' 'glib2')
conflicts=("${pkgname%-git}")
provides=(${pkgname%-git})
source=("${pkgname%-git}::git+https://github.com/jrouleau/gnome-shell-extensions-gravatar")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  local _uuid="gravatar@gnome-shell-extensions.rouleau.io"
  local _destdir="$pkgdir/usr/share/gnome-shell/extensions/$_uuid"

  cd "${srcdir}/${pkgname%-git}/src"
  find . -regextype posix-egrep -regex ".*\.(js|json|ui)$" -exec\
   install -Dm 644 {} ${_destdir}/{} \;
  cp -R schemas "${_destdir}"
  cp -R utils "${_destdir}"
  cd "${srcdir}/${pkgname%-git}"
  cp -R lib "${_destdir}"
  #rebuild compiled GSettings schemas if missing
  if [[ ! -f "${_destdir}/schemas/gschemas.compiled" ]]; then
    glib-compile-schemas "${_destdir}/schemas"
  fi
  chmod -R 755 "${_destdir}"
}
