# Maintainer: Giovanni Harting <539@idlegandalf.com>
# Contributor: Leonard Janis Robert König <ljrk at ljrk dot org>

pkgname=hide-client
_name=hide.client.linux
pkgver=0.9.10
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
b2sums=('7d69b5b1104ed63106e91df2248c585806c79989670068dcf5892196a146f4abe93945061f99b756623d5e4ccaa7e506b3b2254b2c8821ab2c12f750a48429b6'
        'bcb78baaf6682803cddd29a770a229bf9baf79c26244759db7176b65ff3b0c82fc1561066fbd81a68dcd77911bad654827ac2fba19d1ced0d33718b8a9831ed3')

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
