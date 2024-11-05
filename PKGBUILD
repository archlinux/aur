# Maintainer: NAME <EMAIL>
pkgname=pet-git
pkgver=0.9.1
pkgrel=1
pkgdesc='Simple command-line snippet manager, written in Go.'
arch=('i686' 'x86_64')
url='https://github.com/knqyf263/pet'
license=('MIT')
depends=('fzf')
makedepends=('go' 'git')
provides=('pet')
conflicts=('pet')
source=("git+https://github.com/knqyf263/pet.git")
sha256sums=('SKIP')

pkgver() {
  date +%Y%m%d
}

prepare() {
  cd pet
  mkdir -p build/
}

build() {
  cd pet
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o build/pet
}

package() {
  cd pet
  install -Dm755 build/pet "$pkgdir/usr/bin/pet"

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install shell completions
  cd misc/completions/zsh/
  install -Dm755 -d "$pkgdir/usr/share/zsh/site-functions"
  install -Dm644 _* "$pkgdir/usr/share/zsh/site-functions/"
}
