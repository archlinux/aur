# Maintainer: Matthew Murray <matt@compti.me>
pkgname=mautrix-whatsapp
pkgver=0.1.3
pkgrel=4
pkgdesc="A Matrix-WhatsApp puppeting bridge"
arch=('any')
license=('AGPL')
makedepends=(go libolm)
optdepends=('ffmpeg: If you want to send gifs from Matrix'
            'libolm: If you want end-to-bridge encryption')
url="https://github.com/tulir/${pkgname}"
source=("${url}/archive/v${pkgver}.tar.gz" 
        sysusers-mautrix-whatsapp.conf
        mautrix-whatsapp.tmpfiles
        mautrix-whatsapp.service)
md5sums=('671ad744ec61e065ab5dabc6426eeebd'
         'f1fea8f4fcd101f1230031652de1c53c'
         'ef8e104e27e1576429e364252e2005b0'
         '01bd1d42f312bebfeec6f8a71e714d1d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  ./build.sh
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 "$srcdir/sysusers-mautrix-whatsapp.conf" "$pkgdir/usr/lib/sysusers.d/mautrix-whatsapp.conf"
  install -Dm644 "$srcdir/mautrix-whatsapp.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/mautrix-whatsapp.conf"

  install -Dm600 "example-config.yaml" "$pkgdir/etc/$pkgname/mautrix-whatsapp.yaml"
  install -Dm644 "$srcdir/mautrix-whatsapp.service" "$pkgdir/usr/lib/systemd/system/mautrix-whatsapp.service"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
