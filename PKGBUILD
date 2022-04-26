# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=dmarc-cat-git
_pkgname=dmarc-cat
pkgver=0.15.0.r4.g0b3267d
pkgrel=2
pkgdesc='Small utility to decode the report sent by various email providers following the DMARC spec'
arch=('x86_64')
url='https://github.com/keltia/dmarc-cat'
license=('BSD')
makedepends=(git go)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("dmarc-cat::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --always | sed 's/^v//; s/-/.r/; s/-/./'
}

build() {
  cd "$srcdir/$_pkgname"
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags $LDFLAGS" \
    -o $_pkgname
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm644 LICENSE.md -t "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
  install -Dm755 $_pkgname "$pkgdir"/usr/bin/$_pkgname
}
