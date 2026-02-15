# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=privatebin-cli
_binname=privatebin
_bindate=$(date --rfc-3339=date)
pkgver=2.2.1
pkgrel=1
pkgdesc='A powerful CLI for creating and managing PrivateBin pastes with ease'
arch=(x86_64 aarch64)
url='https://github.com/gearnode/privatebin'
license=('ISC')
conflicts=("${pkgname}-bin")
depends=(glibc)
makedepends=('go' 'pandoc')
options=(!lto)
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('cf11851f5e76d7b8d2b90dd662eb0a3dd03cd71f10cad01fb2f81ecf23d303b2')

prepare() {
  cd $_binname-$pkgver
  export GOPATH="${srcdir}/go"
  go mod download -modcacherw

  # Man
  pandoc --standalone --to man -M footer=$pkgver doc/privatebin.1.md -o privatebin.1
  pandoc --standalone --to man -M footer=$pkgver doc/privatebin-create.1.md -o privatebin-create.1
  pandoc --standalone --to man -M footer=$pkgver doc/privatebin-show.1.md -o privatebin-show.1
  pandoc --standalone --to man -M footer=$pkgver doc/privatebin.conf.5.md -o privatebin.conf.5
}

build() {
  cd "$_binname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build \
    -ldflags "-X 'main.version=$pkgver'
        -X 'main.commit=$pkgrel'
        -X 'main.date=$_bindate'" \
    -o $_binname cmd/privatebin/main.go cmd/privatebin/cfg.go

  # Make sure go path is writable so it can be cleaned up
  chmod -R u+w "${srcdir}/go"
}

package() {
  cd $_binname-$pkgver
  install -Dm755 $_binname "$pkgdir"/usr/bin/$_binname
  install -Dm644 LICENSE.txt -t "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
  install -Dm644 privatebin.1 -t "${pkgdir}"/usr/share/man/man1/
  install -Dm644 privatebin-create.1 -t "${pkgdir}"/usr/share/man/man1/
  install -Dm644 privatebin-show.1 -t "${pkgdir}"/usr/share/man/man1/
  install -Dm644 privatebin.conf.5 -t "${pkgdir}"/usr/share/man/man5/
}
