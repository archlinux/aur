# Original PKGBUILD from: frames <markkuehn at outlook dot com>

pkgname=firefox-extension-umatrix-git
pkgver=r914.7b65131
pkgrel=1
pkgdesc='uMatrix,  maintained by gorhill, git version.'
url='https://github.com/gorhill/umatrix'
arch=('any')
license=('GPL')
depends=('firefox' 'git')
makedepends=('python')
source=("$pkgname::git+https://github.com/gorhill/uMatrix.git")
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
  cd "$srcdir/$pkgname/dist/build/uMatrix.firefox/"

  local version="$(grep -Pom1 '(?<=<id>).*(?=</id>)' install.rdf)"

  local dstdir="$pkgdir/pkg/usr/lib/firefox/browser/extensions/$version"
  install -d $dstdir
  cp -dpr --no-preserve=ownership * $dstdir
  chmod -R 755 $dstdir
}
