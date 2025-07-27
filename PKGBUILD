# Maintainer: Aaron Coach <aur@awc.id.au>

pkgname=koito
_pkgname=Koito
pkgver=0.0.13
pkgrel=1
pkgdesc='Modern, themeable scrobbler that you can use with any program that scrobbles to ListenBrainz'
arch=('x86_64')
url='https://koito.io/'
license=('MIT')
depends=('libvips')
install=koito.install
optdepends=('postgresql: database storage backend')
backup=('etc/koito.env')
makedepends=('go' 'npm' 'yarn' 'nodejs>=16')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/gabehf/Koito/archive/refs/tags/v$pkgver.tar.gz"
  "koito.service"
  "koito.env"
)
sha256sums=('6c0275620806fc4dfbaa4661f8467bd1f76c9523404a3018b5e657179c881f3b'
  '512c7911ef7d04561ddc0ccc70d240617be60cdedbfab3bfd43b2ee80d1d43bb'
  'e001fae2ecb86bfc5425f4ca2a1c4bcee7522a63406cc1e218a901770197474d')

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

  install -d "$pkgdir/usr/share/koito"
  cp -a assets client \
    "$pkgdir/usr/share/koito/"

  install -Dm0640 ../koito.env "$pkgdir"/etc/koito.env
  install -Dm0644 ../koito.service "$pkgdir"/usr/lib/systemd/system/koito.service
}
