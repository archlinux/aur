# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extensions-quick-settings-button-remover-git
pkgver=r10.e1cdef6
pkgrel=1
pkgdesc="This extension allows you to remove gnome 43's quick setting buttons. now you can remove dark mode button or night mode button!"
arch=('any')
url="https://github.com/qwreey75/gnome-quick-settings-button-remover"
license=('none')
depends=('gnome-shell')
makedepends=('git' 'zip')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(${pkgname%-git}::git+$url.git)
b2sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${pkgname%-git}"

  ./build.sh
}

package() {
  cd "${pkgname%-git}"

  local uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${uuid}"
  bsdtar --uid 0 --gid 0 -xvf dist/output.zip -C "$pkgdir/usr/share/gnome-shell/extensions/${uuid}"
}
