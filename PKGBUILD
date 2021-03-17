# Maintainer: Lorenz Steinert <lorenz@steinerts.de>
# Contributor: Matthew Murray <matt@compti.me>

pkgname=mautrix-whatsapp
pkgver=0.1.5
pkgrel=2
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
sha256sums=('0a63694ea4c2bd7e986fb8bedbf5511f10f7a907c400a1f98c7da7101ba7f2c7'
            '4b7c57d474305138504f3cc651efb33b8861952dc2a8340148531cdac1eae3d9'
            '0f4265ae93df6bb6e791cf698aacddc6b9eae833113225a6c477e5abd1261ff5'
            'ed3c5f0ce46e217b21dc549c583a4055287c37f6d1a225aff34fd3599e9019f3'
            'e27eea84a3df3380e26cfa485d383b19bb8b7cc8e0fd273e79df501b504160e4')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 < "$srcdir/log-path.diff"

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
