# Maintainer: Aaron Coach <aur@awc.id.au>

pkgname=koito
_pkgname=Koito
pkgver=0.0.12
pkgrel=1
pkgdesc='Modern, themeable scrobbler that you can use with any program that scrobbles to ListenBrainz'
arch=('x86_64')
url='https://koito.io/'
license=('MIT')
depends=('libvips')
install=koito.install
optdepends=('postgresql: database storage backend')
makedepends=('git' 'go' 'npm' 'yarn' 'nodejs>=16')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/gabehf/Koito/archive/refs/tags/v$pkgver.tar.gz"
  "koito.service"
  "koito.env"
)
sha256sums=('0ac5a73a31b966e53c828b62917806656003e3e0c6c8cdffa300f89f6bc6ff1e'
            'ceec472335c79861db3c75dc025539d820d5222e8805e7fa3ced320fe0ddf46d'
            '3595e8554326c9f5dfaaddc6b9bc18101912b2cf5bd838027e0e4ba67066ae1a')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  make build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  install -Dm755 koito "$pkgdir"/usr/bin/koito
  install -Dm0640 ../koito.env "$pkgdir"/etc/koito.env
  install -Dm0644 ../koito.service "$pkgdir"/usr/lib/systemd/system/koito.service
}
