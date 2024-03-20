# Maintainer: Christian Schendel <doppelhelix@gmail.com>
pkgname=gnome-shell-extension-no-overview-git
pkgver=r26.c4d1546
pkgrel=1
pkgdesc="No overview at start-up"
arch=('any')
url="https://github.com/fthx/no-overview"
license=('GPL3')
depends=(
  'gnome-shell>=1:45'
)
makedepends=(
  'git'
)
conflicts=("${pkgname%-git}")
provides=(${pkgname%-git})
source=("${pkgname%-git}::git+${url}")
md5sums=('SKIP')
options=('!strip')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"

  # support repositories that start without a tag but get tagged later on
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  local uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  local extensiondir="${pkgdir}/usr/share/gnome-shell/extensions/${uuid}"
  install -dm755 "${extensiondir}"
  find . -regextype posix-egrep -regex ".*\.(js|json)$" -exec\
     install -Dm 644 {} ${extensiondir}/{} \;
}
