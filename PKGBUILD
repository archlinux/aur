# Maintainer: Hao Long <aur@esd.cc>

pkgname=readability-extractor-git
_pkgname=readability-extractor
pkgver=r7.0098f14
pkgrel=2
pkgdesc="Wrapper around mozilla/readability to keep archivebox free from nodejs"
arch=('any')
url="https://github.com/pirate/readability-extractor"
license=('MIT')
provides=('readability-extractor')
conflicts=('readability-extractor')
depends=('nodejs')
makedepends=('npm' 'git')
source=("${_pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  tar zcf $_pkgname.tar.gz $_pkgname
}

package() {
  npm install -g --prefix "${pkgdir}/usr" $_pkgname.tar.gz

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/cli/issues/1103 for details.
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}
