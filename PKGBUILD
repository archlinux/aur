# Contributor: kitsunyan <kitsunyan@inbox.ru>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=pakku-git
pkgver=0.6
pkgrel=1
pkgdesc='Pacman wrapper with AUR support with latest changes from github repo'
arch=('x86_64')
url="https://github.com/kitsunyan/$pkgname"
license=('GPL3')
depends=('libcurl.so' 'git')
makedepends=('nim' 'git' 'asciidoc')
backup=('etc/pakku.conf')
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
source=("git+https://github.com/kitsunyan/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags|sed 's+-+.+g'| cut -c2-
}

build() {
  local addargs=()
  grep -Fxq debug <<< "`printf '%s\n' "${options[@]}"`" &&
  addargs=(NIM_TARGET='debug' NIM_OPTIMIZE='none')

  cd ${pkgname%-git}
  make "${addargs[@]}" NIM_CACHE_DIR='../nimcache' PREFIX='/usr'
}

package() {
  cd ${pkgname%-git}
  make PREFIX='/usr' DESTDIR="$pkgdir" install
}
