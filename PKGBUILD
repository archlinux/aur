# Maintainer: Christian Schendel <doppelhelix@gmail.com>

pkgname=gnome-shell-extension-dynamic-calendar-and-clocks-icons-git
pkgdesc="A GNOME shell extension that let Calendar and Clocks icons show current date and time."
pkgver=r18.8246ba2
pkgrel=2
url="https://github.com/fcusr/dynamic-calendar-and-clocks-icons"
arch=('any')
license=('GPL-3.0-or-later')
makedepends=(
  'git'
)
depends=(
  'gnome-shell=1:45'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+$url.git")
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "$srcdir/${pkgname%-git}"

  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "$(dirname "$(find . -name 'metadata.json' -print -quit)")"
  local uuid
  uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  local schema=org.gnome.shell.extensions.dynamic-calendar-and-clocks-icons.gschema.xml
  local destdir="$pkgdir"/usr/share/gnome-shell/extensions/"$uuid"

  install -d "$destdir"
  find . -regextype posix-egrep -regex ".*\.(js|json|png|svg|css)$" -exec\
     install -Dm644 {} "$destdir"/{} \;
  install -Dm644 -t "$pkgdir"/usr/share/glib-2.0/schemas/ schemas/"$schema"
}
