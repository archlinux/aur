# Maintainer: Christian Schendel (doppelhelix@gmail.com)

pkgname=gnome-shell-extension-extensions-sync-git
pkgver=18.r1.gcd8b5cc
pkgrel=1
pkgdesc="Sync all extensions and their configurations across all gnome instances"
arch=('any')
url="https://github.com/oae/gnome-shell-extensions-sync"
license=('GPL3')
groups=('gnome-shell-extensions')
depends=('gnome-shell>=1:42')
makedepends=('git'
             'yarn')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${pkgname%-git}"
  yarn install
}

build() {
  cd "${srcdir}/${pkgname%-git}"
    yarn config set cache-folder "$srcdir/yarn-cache"
  yarn build
}

package() {
  cd "${srcdir}/${pkgname%-git}/dist"

  local uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  local schema=$(grep -Po '(?<="settings-schema": ")[^"]*' metadata.json).gschema.xml
  local destdir="${pkgdir}/usr/share/gnome-shell/extensions/${uuid}"

  install -d "${destdir}"
  find . -regextype posix-egrep -regex ".*\.(js|json|svg|xml)$" -exec\
     install -Dm644 {} ${destdir}/{} \;

  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/${uuid}/schemas/"

  install -Dm644 "${srcdir}/${pkgname%-git}/dist/schemas/${schema}" \
    "${pkgdir}/usr/share/glib-2.0/schemas/${schema}"
}

