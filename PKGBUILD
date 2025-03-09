# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-teleport
pkgver=0.7.4
pkgrel=1
pkgdesc="An OBS Studio plugin for an open NDI-like replacement. Pretty simple, straight forward. No NDI compatibility in any form"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/teleport.1445/"
license=(GPL-2.0-or-later)
depends=("obs-studio" "glibc" "libjpeg")
makedepends=("go")
options=('debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/fzwoch/obs-teleport/archive/$pkgver.tar.gz")
sha256sums=("a1d5e3c430a32787ba0c207972196e80b4355cda744c6c6bb144e85e70b7ff86")

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
