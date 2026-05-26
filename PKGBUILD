# Maintainer: Aaron Coach <aur@awc.id.au>

pkgname=koito
_pkgname=Koito
pkgver=0.2.1
pkgrel=2
pkgdesc='Modern, themeable scrobbler that you can use with any program that scrobbles to ListenBrainz'
arch=('x86_64')
url='https://koito.io/'
license=('MIT')
depends=('libvips' 'libheif' 'imagemagick' 'openslide' 'poppler-glib')
install=koito.install
optdepends=('postgresql: database storage backend')
backup=('etc/koito.env')
makedepends=('go' 'npm' 'yarn' 'nodejs>=16')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/gabehf/Koito/archive/refs/tags/v$pkgver.tar.gz"
  "koito.service"
  "koito.env"
)
sha256sums=('e0afcc61a315767040eea58ff9c32a9cd76fe03134a012a35bf89c550c311c91'
            '512c7911ef7d04561ddc0ccc70d240617be60cdedbfab3bfd43b2ee80d1d43bb'
            'e001fae2ecb86bfc5425f4ca2a1c4bcee7522a63406cc1e218a901770197474d')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  export VITE_KOITO_VERSION="$pkgver"
  export BUILD_TARGET="docker"

  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"

  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  sed -i "s/-ldflags='-s -w'/-ldflags='-linkmode=external -X main.Version=$pkgver'/g" Makefile

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
