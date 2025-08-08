# Maintainer: Igor Shimanogov <shimanogov.in@phystech.edu>

pkgname=froggit
pkgver=0.4.1
_pkgver="$pkgver-beta"
pkgrel=1
pkgdesc='simplify your Git workflow with visual feedback, keyboard-driven controls, and a streamlined experience'
arch=('x86_64')
url="https://github.com/thewizardshell/$pkgname"
license=('MIT')
makedepends=('go')
depends=('glibc' 'ttf-nerd-fonts-symbols-mono' 'git')
optdepends=('github-cli: GitHub integration')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$_pkgver.tar.gz")
sha256sums=('ec82b0f055b2924c722b48087b2cc06bb56e55fba4881f6f7418633b7d751fa3')

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
