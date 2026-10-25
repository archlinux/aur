# Maintainer: OrdChaos orderchaos@ordchaos.com

pkgname=dupriman-git
_pkgname=dupriman
pkgver=0.1.0.r7.g1b1721d
pkgrel=1
pkgdesc="Manual duplex printing assistant for single-sided printers (CUPS virtual printer + GTK confirmation prompt)"
arch=('x86_64')
url="https://github.com/OrdChaos/dupriman"
license=('MIT')
depends=('cups' 'qpdf' 'poppler' 'gtk4>=4.10')
makedepends=('cargo' 'git' 'pkgconf')
provides=('dupriman')
conflicts=('dupriman')
options=('!debug')
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
  install -Dm755 target/release/dupriman "$pkgdir/usr/bin/dupriman"
  install -d "$pkgdir/usr/lib/cups/backend"
  ln -s ../../../bin/dupriman "$pkgdir/usr/lib/cups/backend/dupriman"

  cat > "$srcdir/dupriman-package.toml" <<'EOF'
[printer]
virtual_name = "dupriman-duplex"
virtual_uri = "dupriman://duplex"
virtual_info = "DupriMan Manual Duplex"
EOF
  install -d "$pkgdir/usr/share/cups/model"
  ./target/release/dupriman --config "$srcdir/dupriman-package.toml" ppd \
    > "$pkgdir/usr/share/cups/model/dupriman.ppd"
}
