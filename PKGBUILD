# Maintainer: Christian Schendel <doppelhelix@gmail.com>
pkgname=gnome-shell-extension-gnome-static-background-git
pkgver=r12.75093fb
pkgrel=3
pkgdesc="Static Wallpaper in Overview"
arch=('any')
url="https://github.com/dz4k/gnome-static-background"
license=('GPL3')
depends=('gnome-shell>=1:40')
makedepends=('git')
conflicts=("${pkgname%-git}")
provides=(${pkgname%-git})
source=("${pkgname%-git}::git+${url}")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"

  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "${srcdir}/${pkgname%-git}"

  local uuid=$(grep -Po '(?<="uuid" : ")[^"]*' metadata.json)
  local extensiondir="${pkgdir}/usr/share/gnome-shell/extensions/${uuid}"

  install -d "${extensiondir}"
  find . -regextype posix-egrep -regex ".*\.(js|json)$" -exec\
     install -Dm 644 {} ${extensiondir}/{} \;

  find . -regextype posix-egrep -regex ".*\.(md|png)$" -exec\
     install -Dm 644 {} "$pkgdir/usr/share/doc/${pkgname}"/{} \;
}
