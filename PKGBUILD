# Maintainer: Christian Schendel <doppelhelix@gmail.com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gnome-shell-extension-favourites-in-appgrid-git
pkgver=r20.24a300c
pkgrel=2
pkgdesc="Keep favourite applications in AppGrid. For GNOME Shell 40+"
arch=('any')
url="https://gitlab.gnome.org/harshadgavali/favourites-in-appgrid"
license=(
  'GPL-3.0-or-later'
)
depends=(
  'gnome-shell>=1:45'
  'gnome-shell<1:46'
)
makedepends=(
  'git'
)
conflicts=("${pkgname%-git}")
provides=(${pkgname%-git})
source=("${pkgname%-git}::git+${url}.git")
md5sums=('SKIP')

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

  install -d "${extensiondir}"
  find . -regextype posix-egrep -regex ".*\.(js|json)$" -exec\
     install -Dm 644 {} ${extensiondir}/{} \;
}
