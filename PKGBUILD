# Maintainer: noodle <silentnoodle@cock.li>
pkgname=passbolt-cli
_pkgname=go-passbolt-cli
pkgver=0.3.0
pkgrel=1
pkgdesc='Passbolt CLI tool'
arch=('x86_64')
url="https://passbolt.com"
license=('MIT')
makedepends=('go')
source=("https://github.com/passbolt/$_pkgname/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('755197cd0359cc18909f91e9b805f52d3dc554a1c68f021ad78c2a46ae25f379')

prepare(){
  cd "$srcdir/$_pkgname-$pkgver"
  mkdir -p build/
  mkdir -p completion
  mkdir -p man/
  go run main.go completion bash > completion/bash
  go run main.go completion zsh > completion/zsh
  go run main.go completion fish > completion/fish
  go run main.go completion powershell > completion/powershell
  go run main.go gendoc --type man
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build .
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  install -Dm755 build/$_pkgname "$pkgdir"/usr/bin/passbolt
  # Completions
  install -Dm644 completion/bash "$pkgdir"/usr/share/bash-completion/completions/passbolt
  install -Dm644 completion/zsh "$pkgdir"/usr/share/zsh/site-functions/_passbolt
  install -Dm644 completion/fish "$pkgdir"/usr/share/fish/vendor_completions.d/passbolt.fish
  install -Dm644 completion/powershell "$pkgdir"/usr/share/powershell/Modules/passbolt/Completion/Passbolt.ps1
  # Man pages
  for manpage in man/*; do
    section=$(echo $manpage | rev | cut -d. -f1 | rev)
    install -Dm644 $manpage "$pkgdir/usr/share/man/man$section/$(basename $manpage)"
  done
}
