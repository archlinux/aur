pkgname=xtrayhide-git
pkgver=r2.5e33f36
pkgrel=1
pkgdesc="XEmbed‑to‑SNI tray bridge for Wine/Proton, works great in Niri with Noctalia‑shell/DMS‑shell"
arch=('x86_64' 'aarch64')
url="https://github.com/bnema/xtrayhide"
license=('MIT')
depends=('dbus' 'libx11')
makedepends=('go>=1.25.6' 'git')
provides=('xtrayhide')
conflicts=('xembed-sni-proxy')
options=('!debug')
install="xtrayhide.install"
source=("git+${url}.git#branch=master"
        "xtrayhide.install")
sha256sums=('SKIP'
            'abef9a097facd084bb1d4c0238b639057791ea7afa5c9e8212413d3e9a39650c')  

pkgver() {
  cd "$srcdir/xtrayhide"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/xtrayhide"
  
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  
  go build -o xtrayhide ./cmd/xtrayhide
}

package() {
  cd "$srcdir/xtrayhide"
  
  install -Dm755 xtrayhide "${pkgdir}/usr/bin/xtrayhide"
  
  sed 's|%h/.local/bin/xtrayhide|/usr/bin/xtrayhide|' xtrayhide.service > xtrayhide.service.patched
  install -Dm644 xtrayhide.service.patched "${pkgdir}/usr/lib/systemd/user/xtrayhide.service"
  
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
