# Maintainer: Lorenz Steinert <lorenz@steinerts.de>
# Contributor: Matthew Murray <matt@compti.me>

pkgname=mautrix-whatsapp
pkgver=0.8.0
pkgrel=1
pkgdesc="A Matrix-WhatsApp puppeting bridge"
arch=('any')
license=('AGPL')
# mautrix-whatsapp can be build without encription support.
# For that libolm has to be removed from the makedepends and depends
makedepends=(go libolm)
depends=('libolm')
optdepends=('ffmpeg: If you want to send gifs from Matrix')
url="https://github.com/tulir/${pkgname}"
source=("${url}/archive/v${pkgver}.tar.gz" 
        sysusers-mautrix-whatsapp.conf
        mautrix-whatsapp.tmpfiles
        mautrix-whatsapp.service
        log-path.diff)
backup=("etc/${pkgname}/mautrix-whatsapp.yaml")
sha256sums=('2417943a5f7e2799c1a4f74f57a5311a183413c0c3a63cfcfaaa0dcaa8c3b9f8'
            '409e8fb3e35de1bd1ceebefa0ac275ad62ec66680117648058bcc177ddd2f9a1'
            '6f8a1b16c9de8c847c93d01a6d72b796dc91c5c7e78e410777b96a2916e35f1a'
            'c353ac242c501063c7c45169e1e65e7a75fe7d681f73409e76682e7537466965'
            'e27eea84a3df3380e26cfa485d383b19bb8b7cc8e0fd273e79df501b504160e4')

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
