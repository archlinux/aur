# Maintainer: Giovanni Harting <539@idlegandalf.com>
# Contributor: Leonard Janis Robert König <ljrk at ljrk dot org>

pkgname=hide-client
_name=hide.client.linux
pkgver=0.9.14
pkgrel=1
pkgdesc='Hide.me CLI VPN client for Linux'
arch=(x86_64 aarch64 armv7h)
url='https://github.com/eventure/hide.client.linux'
license=(GPL-2.0-only)
depends=(glibc)
makedepends=(go)
backup=('etc/hide.me/config')
source=("$pkgname-$pkgver.zip::$url/archive/v$pkgver.zip"
        arch-config.patch)
b2sums=('4016e36728eab88101aa60092814184804d3e11740581b4eb816133c3dc896b86173fd991c96f6340b12f3aa20b4440e076bc6961145112268e03c45e0215d02'
        'f91bda97dd2d274e8c46c5b402dfc3df301bdae23a68983e1ec3b7a8d1e0c29cfd2224822a83a3c5f908681edc1b8b4aa55155e7c93265140565ec4005bbe965')

prepare() {
  cd $_name-$pkgver

  # patch config to arch-specific defaults
  patch -p1 < ../arch-config.patch
}

build() {
  cd $_name-$pkgver

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

  go build \
  -trimpath \
  -buildmode=pie \
  -mod=readonly \
  -modcacherw \
  -ldflags "-linkmode external" \
  -o hide.me \
  .
}

package() {
  cd $_name-$pkgver

  install -Dm755 -t "$pkgdir"/usr/bin hide.me
  install -Dm644 -t "$pkgdir"/usr/share/hide.me CA.pem

  # for (system-wide) accessToken.txt
  install -dm755 "$pkgdir"/etc/hide.me
  install -Dm644 -t "$pkgdir"/etc/hide.me config
  install -Dm644 -t "$pkgdir"/usr/lib/systemd/system hide.me@.service
}

# vim:set ts=2 sw=2 et:
