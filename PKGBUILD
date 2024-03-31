# Maintainer: Christian Schendel <doppelhelix at gmail dot com>
pkgname=gnome-shell-extension-applications-overview-tooltip-git
pkgver=21.r0.gaa1ec0c
pkgrel=1
pkgdesc="Shows a tooltip over applications icons on applications overview"
arch=(any)
url="https://github.com/RaphaelRochet/applications-overview-tooltip"
license=(
  'LicenseRef-Unknown'
)
depends=(
  'gnome-shell>=1:46'
)
makedepends=(
  'git'
  'glib2'
)
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

  install -dm755 "${destdir}"
  find . -regextype posix-egrep -regex ".*\.(js|json|xml|css)$" -exec\
     install -Dm 644 {} ${destdir}/{} \;
     rm -rf ${destdir}/schemas

  install -Dm644 "${srcdir}/${pkgname%-git}/schemas/${schema}" \
    "${pkgdir}/usr/share/glib-2.0/schemas/${schema}"

  install -Dm644 "${srcdir}/${pkgname%-git}/README.md" -t "$pkgdir/usr/share/doc/${pkgname%-git}/"
  install "${srcdir}/${pkgname%-git}/screenshot.png" -t "$pkgdir/usr/share/doc/${pkgname%-git}/"

  find . -regextype posix-egrep -regex ".*\.(mo)$" -exec\
     install -Dm 644 {} $pkgdir/usr/share/{} \;
}
