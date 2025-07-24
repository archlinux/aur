# Maintainer: Igor Shimanogov <shimanogov.in@phystech.edu>

pkgname=froggit
pkgver=0.3.4
_pkgver="$pkgver-beta"
pkgrel=2
pkgdesc='simplify your Git workflow with visual feedback, keyboard-driven controls, and a streamlined experience'
arch=('x86_64')
url="https://github.com/thewizardshell/$pkgname"
license=('MIT')
makedepends=('go')
depends=('glibc' 'ttf-nerd-fonts-symbols-mono' 'git')
optdepends=('github-cli: GitHub integration')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$_pkgver.tar.gz")
sha256sums=('080dd338f25c6c72e477ee006462bc6fe00fdc437603ef981dba0213f8b0c8e1')

prepare(){
  cd "$pkgname-$_pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-$_pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build .
}

check() {
  cd "$pkgname-$_pkgver"
  go test ./... -vet=atomic,bool,buildtags,directive,errorsas,ifaceassert,nilfunc,stringintconv,tests
}

package() {
  cd "$pkgname-$_pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
