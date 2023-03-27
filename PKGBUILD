# Maintainer: Christian Schendel <doppelhelix@gmail.com>
pkgname=gnome-shell-extension-applications-overview-tooltip-git
pkgver=16.r0.gdac0b90
pkgrel=3
pkgdesc="Shows a tooltip over applications icons on applications overview"
arch=(any)
url="https://github.com/RaphaelRochet/applications-overview-tooltip"
license=('unknown')
depends=('gnome-shell>=1:40')
makedepends=('git')
conflicts=("${pkgname%-git}")
provides=(${pkgname%-git})
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  local uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  local schema=$(grep -Po '(?<="settings-schema": ")[^"]*' metadata.json).gschema.xml
  local destdir="${pkgdir}/usr/share/gnome-shell/extensions/${uuid}"
  install -d "${destdir}"
  find . -regextype posix-egrep -regex ".*\.(js|json|xml|css|md|png|compiled)$" -exec \
    install -Dm644 {} ${destdir}/{} \;
  install -Dm644 "${srcdir}/${pkgname%-git}/schemas/${schema}" \
    "${pkgdir}/usr/share/glib-2.0/schemas/${schema}"

  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/${uuid}/schemas/"

  find . -regextype posix-egrep -regex ".*\.(mo)$" -exec \
    install -Dm644 {} ${pkgdir}/usr/share/{} \;

}
