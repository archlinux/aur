# Maintainer: sxe <sxxe at gmx.de>

pkgname=firefox-extension-ublock-git
pkgver=r2664.8919ea1
pkgrel=1
pkgdesc='An efficient blocker for modern browsers. Fast and lean. Written from scratch. Development through benchmarking.'
url='https://github.com/chrisaljoudi/uBlock'
arch=('any')
license=('GPL')
depends=('firefox')
makedepends=('python' 'git')
source=("$pkgname::git+https://github.com/chrisaljoudi/uBlock.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname"
    sh tools/make-firefox.sh
}

package() {
  cd "$srcdir/$pkgname/dist/build/uBlock.firefox"

  local version="$(grep -Pom1 '(?<=<id>).*(?=</id>)' install.rdf)"

  local dstdir="$pkgdir/usr/lib/firefox/browser/extensions/$version"
  install -d $dstdir
  cp -dpr --no-preserve=ownership * $dstdir
  chmod -R 755 $dstdir
}
