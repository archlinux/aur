# Maintainer: Alexis "Horgix" Chotard <alexis.horgix.chotard@gmail.com>
# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=terminal-parrot
pkgver=1.2.0
pkgrel=1
conflicts=('terminal-parrot-git')
pkgdesc="Party parrot (http://cultofthepartyparrot.com) for your terminal"
arch=('x86_64')
url="https://github.com/jmhobbs/terminal-parrot"
license=('MIT')
makedepends=('go')
options=('!strip' '!emptydirs')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/jmhobbs/terminal-parrot/archive/${pkgver}.tar.gz")
sha256sums=('fa860eec47f3158c16978d29e34eb0d9f77c733f5792162fb01dc78ed3f5a775')

prepare() {
    mkdir -p go
    export GOPATH="${srcdir}/go"
    go mod init github.com/nsf/termbox-go
    go mod tidy
}

build() {
  export GOPATH="${srcdir}/go"
  cd "${pkgname}-${pkgver}"

  go build \
  -trimpath \
  -buildmode=pie \
  -mod=readonly \
  -modcacherw \
  -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
  .
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 "${pkgname}" "$pkgdir/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
