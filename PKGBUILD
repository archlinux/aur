# Maintainer: ml <ml@visu.li>
pkgname=kube-prompt-git
pkgrel=1
pkgver=1.0.11.r1.g8547400
pkgdesc='An interactive kubernetes client featuring auto-complete using go-prompt.'
arch=('x86_64' 'i686' 'aarch64')
url='https://github.com/c-bata/kube-prompt'
license=('MIT')
depends=('kubectl')
makedepends=('git' 'go')
provides=('kube-prompt')
conflicts=('kube-prompt')
source=("${pkgname}::git+https://github.com/c-bata/kube-prompt.git")
sha512sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  cd "$pkgname"
  export CGO_ENABLED=1
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -modcacherw'
  go build -o kube-prompt -ldflags "-linkmode=external -X main.version=v${pkgver%%.r*} -X main.revision=${pkgver##*.g}"
}

package() {
  cd "$pkgname"
  install -Dm755 kube-prompt -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

