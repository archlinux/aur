# Maintainer: A Farzat <a@farzat.xyz>

_pkgname=git-age
pkgname="$_pkgname"
pkgver=0.2.0
pkgrel=1
pkgdesc="a smudge/clean filter to encrypt/decrypt files in a git repository transparently"
url="https://github.com/prskr/git-age"
depends=('glibc')
makedepends=('go')
optdepends=('git')
license=('MIT')
arch=('aarch64' 'x86_64')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('7f8815062747104a1c097e31a41b9ef9')

prepare() {
    cd "$_pkgname-$pkgver"
    go mod vendor
}

build() {
    cd "$_pkgname-$pkgver"
    export CGO_CPPFLAGS="$CPPFLAGS"
    export CGO_CFLAGS="$CFLAGS"
    export CGO_CXXFLAGS="$CXXFLAGS"
    export CGO_LDFLAGS="$LDFLAGS"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -modcacherw"
    export GOPATH="$srcdir"
    go build -o "$_pkgname" .
}

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

check() {
  cd "$_pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
