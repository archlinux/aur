# Maintainer: Giovanni Harting <539@idlegandalf.com>
# Contributor: Leonard Janis Robert König <ljrk at ljrk dot org>

pkgname=hide-client
_pkgname=hide.client.linux
pkgver=0.9.8
pkgrel=2
pkgdesc="Hide.me CLI VPN client for Linux"
arch=(x86_64 aarch64 armv7h armv6h)
url="https://github.com/eventure/hide.client.linux"
license=(GPL2)
depends=(glibc)
makedepends=(go)
backup=('etc/hide.me/config')
source=("https://github.com/eventure/$_pkgname/archive/$pkgver.zip")
b2sums=('ed3bc28dbc40288bfbd0ea9adb643c484e9a19bce582719834a65749ae1494d5c7c32685a1feadd6eecccc1d516d9ccaf8297192a2b464b919fde586368219ac')

prepare() {
  cd "$_pkgname-$pkgver"

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
  cd "$_pkgname-$pkgver"

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
  cd "$_pkgname-$pkgver"

  install -Dm755 -t "$pkgdir"/usr/bin hide.me
  install -Dm644 -t "$pkgdir"/usr/share/hide.me CA.pem

  # For (system-wide) accessToken.txt
  install -dm755 "$pkgdir"/etc/hide.me
  install -Dm644 -t "$pkgdir"/etc/hide.me config
  install -Dm644 -t "$pkgdir"/usr/lib/systemd/system hide.me@.service
}

# vim:set ts=2 sw=2 et:
