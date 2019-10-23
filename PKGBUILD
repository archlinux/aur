# Contributor: kitsunyan <kitsunyan@inbox.ru>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=pakku-git
pkgver=0.13.r8.g1f6a5c6
pkgrel=2
pkgdesc='Pacman wrapper with AUR support with latest changes from github repo'
arch=('x86_64')
url="https://github.com/kitsunyan/pakku"
license=('GPL3')
depends=('libcurl.so' 'git')
makedepends=('nim' 'git' 'asciidoc')
backup=('etc/pakku.conf')
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
source=("git+https://github.com/kitsunyan/${pkgname%-git}.git" remove_bash_completion.patch)
backup=('etc/pakku.conf')
sha256sums=('SKIP'
            'f28b95bf409db284eb5384f0f56ad43b9465e7b7692759d870b28bb4cf45dd17')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags|sed 's+-+.r+'|tr - .| cut -c2-
}

prepare() {
  cd ${pkgname%-git}
  git apply "$srcdir"/remove_bash_completion.patch
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
