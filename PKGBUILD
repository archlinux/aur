# Maintainer: Giovanni Harting <539@idlegandalf.com>
# Contributor: Leonard Janis Robert König <ljrk at ljrk dot org>

pkgname=hide-client
_name=hide.client.linux
pkgver=0.9.12
pkgrel=1
pkgdesc='Hide.me CLI VPN client for Linux'
arch=(x86_64 aarch64 armv7h)
url='https://github.com/eventure/hide.client.linux'
license=(GPL-2.0-only)
depends=(glibc)
makedepends=(go)
backup=('etc/hide.me/config')
source=("$pkgname-$pkgver.zip::$url/archive/$pkgver.zip"
        arch-config.patch)
b2sums=('e95170a44ca67ac9c121c49d72a1cad1353f4219e92dd21618568078ba7d4e553d1445a2bd4fab5cc883c17f87a32068c7b143beecd063cec2e9c2394b817533'
        'f083dd27f722be0cc19efd949596c442d5584fa645826e6ca9533eaacd4804ca2e4f95bee6ae2770a08acb4c6ea78ad013de20652a8121367473bce4510b1cb2')

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
