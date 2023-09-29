# Maintainer: Lorenz Steinert <lorenz@steinerts.de>
# Contributor: Matthew Murray <matt@compti.me>

pkgname=mautrix-whatsapp
pkgver=0.10.2
pkgrel=2
pkgdesc="A Matrix-WhatsApp puppeting bridge"
arch=('x86_64' 'aarch64')
license=('AGPL')
# mautrix-whatsapp can be build without encription support.
# For that libolm has to be removed from the makedepends and depends
makedepends=(go)
depends=('libolm')
optdepends=('ffmpeg: If you want to send gifs from Matrix')
url="https://github.com/tulir/${pkgname}"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        sysusers-mautrix-whatsapp.conf
        mautrix-whatsapp.tmpfiles
        mautrix-whatsapp.service
        log-path.diff)
backup=("etc/${pkgname}/mautrix-whatsapp.yaml")
sha256sums=('47972a8d3e6ad9a804376525cd311edd1eaca51dbe55536adae9e05ad46c91c6'
            '409e8fb3e35de1bd1ceebefa0ac275ad62ec66680117648058bcc177ddd2f9a1'
            '2e5ecb77aa175c1ebce40a5ff560bb5ee26ed39b3d1f4cf6d62db2ad604050b4'
            'c353ac242c501063c7c45169e1e65e7a75fe7d681f73409e76682e7537466965'
            'ba3205d04127cfa47cfdbfc6043dc927da8fd44258cd185b70dbdfb5fb2505cc')

build() {
  cd "$srcdir/whatsapp-$pkgver"
  patch -Np1 < "$srcdir/log-path.diff"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  ./build.sh
}

package() {
  cd "$srcdir/whatsapp-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 "$srcdir/sysusers-mautrix-whatsapp.conf" "$pkgdir/usr/lib/sysusers.d/mautrix-whatsapp.conf"
  install -Dm644 "$srcdir/mautrix-whatsapp.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/mautrix-whatsapp.conf"

  install -Dm640 "example-config.yaml" "$pkgdir/etc/$pkgname/mautrix-whatsapp.yaml"
  install -Dm644 "$srcdir/mautrix-whatsapp.service" "$pkgdir/usr/lib/systemd/system/mautrix-whatsapp.service"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
