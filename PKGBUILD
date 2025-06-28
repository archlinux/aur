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
            '902d1b31ea4ccd569e0dc21ef1c396f025115fea5425feb671db7a52e22e8971'
            '627a1a798ed3107e5a16a2226888cb3dfe0a8a304bae1e0b11c2fe7fd2f53625')

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
