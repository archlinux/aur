# Maintainer: Platon Ryzhikov <ihummer63@yandex.ru>

pkgname=kubernetes-website-git
pkgdesc="The Kubernetes documentation"
epoch=1
pkgver=1.29.r568.g5dc3c14946
pkgrel=1
arch=('any')
makedepends=('git' 'hugo' 'npm')
provides=('kubernetes-website' 'kubernetes-doc')
conflicts=('kubernetes-website' 'kubernetes-doc')
url='https://github.com/kubernetes/website'
license=('custom')
source=('git+https://github.com/kubernetes/website#branch=main')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/website"
  git describe --long --tags | sed -e 's/snapshot-initial-//' -e 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/website"
  npm ci
  make module-init
  make all
}

package() {
  cd "$srcdir/website"
  mkdir "$pkgdir/usr"
  mkdir "$pkgdir/usr/share"
  mkdir "$pkgdir/usr/share/doc"
  mkdir "$pkgdir/usr/share/doc/kubernetes"
  cp -r ./public/* "$pkgdir/usr/share/doc/kubernetes"
}
