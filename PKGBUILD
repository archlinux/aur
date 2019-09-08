# Maintainer: Maxime "pep" Buquet <archlinux@bouah.net>

_pkgbase='webhook2muc'
pkgname=${_pkgbase}-git
pkgver=r25.d651a59
pkgrel=4
pkgdesc="Webhook to MUC bot"
arch=('x86_64')
url='https://gitlab.com/xmpp-rs/tokio-webhook2muc'
license=('GPL3')
provides=('webhook2muc')
conflicts=('webhook2muc')
depends=('openssl')
makedepends=('git' 'rust')
source=(
  "$_pkgbase::git+https://gitlab.com/ppjet6/tokio-webhook2muc#commit=41d339927006c3f19e8ede76f5f0dc35a47a0278"
  "$_pkgbase.env"
  "$_pkgbase.service"
)
backup=("etc/$_pkgbase/$_pkgbase.env")

pkgver() {
  cd $srcdir/$_pkgbase
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir/$_pkgbase
  cargo build --release
}

package() {
  cd "$srcdir/$_pkgbase"

  # Systemd files
  install -m755 -d "$pkgdir/etc/$_pkgbase"
  install -Dm640 "$srcdir/$_pkgbase.env" "$pkgdir/etc/$_pkgbase"
  install -Dm644 "$srcdir/$_pkgbase.service" "$pkgdir/usr/lib/systemd/system/$_pkgbase.service"

  install -Dm755 target/release/tokio-webhook2muc "$pkgdir/usr/bin/$_pkgbase"
}

sha256sums=('SKIP'
            '3a3878cf71075383074bb9cea0613fc590f98285652db3d39c8fd97c1d79e0e7'
            '324a0b4cb5e2151d8284a7644d570cc68d477cd8cd1109d961578e98f86c7a60')
