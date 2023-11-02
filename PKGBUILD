pkgname=gnss-share
pkgver=0.7.2
pkgrel=1
pkgdesc='An app for sharing GNSS location data, with support multiple clients and loading/saving AGPS data.'
arch=(x86_64 aarch64)
url="https://gitlab.com/postmarketOS/gnss-share"
license=('GPL3')
makedepends=('go')
optdepends=('geoclue: geoclue location source')
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz"
	"geoclue.conf")
changelog=gnss-share.changelog
sha512sums=('bfecc725ea09e1fb0bbfb917478447235aa7392f54cace9686d037478f1c164388054b4f2c742ec4948871cf68871956b1ef0f99a2ca621a9911efd5637c919a'
	'f1d1c391d7104dd079ee6c7c08b99f6a84749b59eb66f3ceb1994d36198840e81f011b573af455eff1231ddbaf0c786c77785f799355d6d82005317633bca1ed')

prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=1
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build \
  	-trimpath \
  	-buildmode=pie \
  	-mod=readonly \
  	-modcacherw \
  	-ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
  	-o build ./cmd/...
  	
  scdoc < doc/gnss-share.1.scd > gnss-share.1
  scdoc < doc/gnss-share.conf.5.scd > gnss-share.conf.5
}


package() {
  install -Dm644 geoclue.conf $pkgdir/etc/geoclue/conf.d/gnss-share.conf
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname $pkgdir/usr/bin/$pkgname
  install -m755 -d $pkgdir/etc/
  install -Dm644 gnss-share.conf "$pkgdir"/etc/
  install -m755 -d $pkgdir/usr/lib/systemd/system
  install -m644  systemd/gnss-share.service  $pkgdir/usr/lib/systemd/system
  install -Dm644 gnss-share.conf $pkgdir/etc/gnss-share.conf
  install -Dm644 gnss-share.1 -t $pkgdir/usr/share/man/man1/
  install -Dm644 gnss-share.conf.5 -t $pkgdir/usr/share/man/man5/

}

