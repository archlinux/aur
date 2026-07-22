# Maintainer: OrdChaos orderchaos@ordchaos.com

pkgname=dupriman-git
_pkgname=dupriman
pkgver=0.1.0.r0.g6dfbb5e
pkgrel=1
pkgdesc="Manual duplex printing assistant for single-sided printers (CUPS virtual printer + GTK confirmation prompt)"
arch=('x86_64')
url="https://github.com/OrdChaos/dupriman"
license=('MIT')
depends=('cups' 'qpdf' 'poppler' 'gtk4>=4.10' 'systemd')
makedepends=('cargo' 'git')
provides=('dupriman')
conflicts=('dupriman')
options=('!debug')
install=dupriman.install
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags 2>/dev/null | sed 's/^v//;s/-/.r/;s/-/./' \
    || printf "0.1.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$_pkgname"
  ./target/release/dupriman install --root "$pkgdir" --no-activate
}
