# Maintainer: Lorenz Steinert <lorenz@steinerts.de>
# Contributor: Matthew Murray <matt@compti.me>

pkgname=mautrix-whatsapp
pkgver=0.2511.0
pkgrel=1
pkgdesc="A Matrix-WhatsApp puppeting bridge"
arch=('x86_64' 'aarch64')
license=('AGPL-3.0-or-later')
# mautrix-whatsapp can be build without encription support.
# For that libolm has to be removed from the depends array
makedepends=(
  'go'
  'git'
)
depends=(
  'glibc'
  'libolm'
)
optdepends=('ffmpeg: If you want to send gifs from Matrix')
url="https://github.com/tulir/${pkgname}"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
  sysusers-mautrix-whatsapp.conf
  mautrix-whatsapp.tmpfiles
  mautrix-whatsapp.service
)
backup=("etc/${pkgname}/mautrix-whatsapp.yaml")
sha256sums=('8f779919c50a7b0653aaf8f8a0ea99ab124888ed61d9a45aba0bb8434a89569c'
            '409e8fb3e35de1bd1ceebefa0ac275ad62ec66680117648058bcc177ddd2f9a1'
            '2e5ecb77aa175c1ebce40a5ff560bb5ee26ed39b3d1f4cf6d62db2ad604050b4'
            '0f909a1b9170a72efc8cca5f51334b73d0e04e5346ae23b75169eaccca7574a2')

build() {
  cd "$srcdir/whatsapp-$pkgver"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  ./build.sh
  ./mautrix-whatsapp -e
}

package() {
  cd "$srcdir/whatsapp-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 "$srcdir/sysusers-mautrix-whatsapp.conf" "$pkgdir/usr/lib/sysusers.d/mautrix-whatsapp.conf"
  install -Dm644 "$srcdir/mautrix-whatsapp.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/mautrix-whatsapp.conf"

  install -Dm640 "config.yaml" "$pkgdir/etc/$pkgname/mautrix-whatsapp.yaml"
  install -Dm644 "$srcdir/mautrix-whatsapp.service" "$pkgdir/usr/lib/systemd/system/mautrix-whatsapp.service"
  install -Dm644 LICENSE{,.exceptions} -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
