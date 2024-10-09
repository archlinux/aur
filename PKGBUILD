# Maintainer: Kemel Zaidan <kemelzaidan@gmail.com>

pkgname='gtrash'
pkgver=0.0.6
pkgrel=2
pkgdesc='A Trash CLI manager written in Go'
url='https://github.com/umlx5h/gtrash'
arch=('aarch64' 'i686' 'x86_64')
license=('MIT')
conflicts=('gtrash-bin')
depends=('glibc')
makedepends=('go')
options=("strip" "buildflags")
source=("$url/archive/refs/tags/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('66003276073d9da03cbb4347a4b161f89c81f3706012b77c3e91a154c91f3586')

prepare(){
    cd "$pkgname-$pkgver"
    mkdir -p build
    # completion directories
    mkdir -p "${pkgdir}/usr/share/bash-completion/completions/"
    mkdir -p "${pkgdir}/usr/share/zsh/site-functions/"
    mkdir -p "${pkgdir}/usr/share/fish/vendor_completions.d/"
}

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_ENABLED=2
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    cd "$pkgname-$pkgver"
    go build -o "build/$pkgname"
}

check() {
    cd "$pkgname-$pkgver"
    go test
}

package() {
  cd "$pkgname-$pkgver"
  # license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # bin
  install -Dm755 "build/gtrash" "${pkgdir}/usr/bin/gtrash"

  # generate completions
  cd "./build"
  ./gtrash completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/gtrash"
  ./gtrash completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_gtrash"
  ./gtrash completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/gtrash.fish"
}
