# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-teleport
pkgver=0.7.7
pkgrel=1
pkgdesc="An OBS Studio plugin for an open NDI-like replacement."
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/teleport.1445/"
license=(GPL-2.0-or-later)
depends=("obs-studio" "glibc" "libjpeg-turbo")
makedepends=("go")
options=('debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/fzwoch/obs-teleport/archive/$pkgver.tar.gz")
sha256sums=("93b36f7c159b34bef8e6572482ae627a18a503d1501ad2b7da734dbc06d73187")

prepare() {
  cd "$pkgname-$pkgver"

  sed -i 's|C.tj3Init(C.TJINIT_COMPRESS)|C.tj3InitVersion(C.TJINIT_COMPRESS, 3001000)|g' packet.go
  sed -i 's|C.tj3Init(C.TJINIT_DECOMPRESS)|C.tj3InitVersion(C.TJINIT_COMPRESS, 3001000)|g' packet.go
}

build() {
  cd "$pkgname-$pkgver"
  export GOPATH="${srcdir}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS} -I/usr/include/obs"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS} -lturbojpeg -lobs -lobs-frontend-api"
  export GOFLAGS="-buildmode=c-shared -mod=readonly -modcacherw"

  go build \
    -ldflags "-compressdwarf=false -linkmode external -X main.version=$pkgver" \
    -v -o "$pkgname.so" .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 "$pkgname.so" -t "$pkgdir"/usr/lib/obs-plugins/
}
