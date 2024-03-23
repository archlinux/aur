# Maintainer: Giovanni Harting <539@idlegandalf.com>
# Contributor: Leonard Janis Robert König <ljrk at ljrk dot org>

pkgname=hide-client
_name=hide.client.linux
pkgver=0.9.9
pkgrel=1
pkgdesc='Hide.me CLI VPN client for Linux'
arch=(x86_64 aarch64 armv7h)
url='https://github.com/eventure/hide.client.linux'
license=(GPL-2.0-only)
depends=(glibc)
makedepends=(go)
backup=('etc/hide.me/config')
source=("$pkgname-$pkgver.zip::$url/archive/$pkgver.zip")
b2sums=('ca30b3442d9cee438c69719725f33d6702e82c252d5ee2130e984bc57f221edfa2dc943b07c6564f347cb4c618d0d5b0ab98851da31f8da0fe37e803f837c84b')

prepare() {
  cd $_name-$pkgver

  sed -e "s|CA.pem|/usr/share/hide.me/CA.pem|" \
      -e "s|accessToken.txt|/etc/hide.me/accessToken.txt|" \
      -i configuration.go

  sed -e "s|/opt/hide.me/hide.me|/usr/bin/hide.me|" \
      -e "s|WorkingDirectory=/opt/hide.me|WorkingDirectory=/etc/hide.me|" \
      -e "s|ReadWritePaths=/opt/hide.me /etc|ReadWritePaths=/etc/hide.me|" \
      -e "s|/opt/hide.me/config|/etc/hide.me/config|" \
      -i 'hide.me@.service'
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
  -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
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
