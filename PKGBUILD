# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-readingstrip-git
_pkgname=readingstrip
pkgver=r80.61d4174
pkgrel=1
pkgdesc="It is a extension for Gnome-Shell with an equivalent function to a reading guide on the computer, that's really useful for people with dyslexia."
arch=('any')
url="https://github.com/lupantano/readingstrip"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git' 'zip')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
  cd "${_pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${_pkgname%-git}"

  make pack
}

package() {
  cd "${_pkgname%-git}"

  local uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${uuid}"
  bsdtar -xvf ${uuid}.shell-extension.zip -C "$pkgdir/usr/share/gnome-shell/extensions/${uuid}"
}
