# Maintainer: Arghya Sarkar <arghyasarkar.nolan@gmail.com>
pkgname=tulip-pm
pkgver=0.0.3
pkgrel=1
pkgdesc="Pacman wrapper and AUR helper written in golang by Calinix Team."
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/Calinix-Team/tulip"
options=(!lto)
license=('GPL3')
depends=(
  'pacman>5'
  'git'
)
optdepends=(
  'sudo: privilege elevation'
  'doas: privilege elevation'
)
makedepends=('go>=1.17')
options=(!lto)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Calinix-Team/tulip/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d9c82fcd5c4a44735c8760c1002015d06c7d902a9dfe33611f502b7e777d83d7')

build() {
  export GOPATH="$srcdir"/gopath
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_ENABLED=1

  cd "$srcdir/tulip-$pkgver"
  make build
}

package() {
  cd "$srcdir/tulip-$pkgver"
  go build -v -ldflags="-s -w" -o tulip
  install -dm755 ${pkgdir}/usr/share/licenses/${pkgname}/
  install -dm755 ${pkgdir}/usr/share/bash-completion/completions/${pkgname}
  install -dm755 ${pkgdir}/usr/share/zsh/site-functions/_${pkgname}
  install -dm755 ${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish
  install -Dm755 tulip ${pkgdir}/usr/bin/tulip
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/
  install -Dm644 completions/bash ${pkgdir}/usr/share/bash-completion/completions/${pkgname}
	install -Dm644 completions/zsh ${pkgdir}/usr/share/zsh/site-functions/_${pkgname}
	install -Dm644 completions/fish ${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish
}