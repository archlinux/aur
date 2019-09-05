# Maintainer: Maxime "pep" Buquet <archlinux@bouah.net>

_pkgbase='webhook2muc'
pkgname=${_pkgbase}-git
pkgver=r25.d651a59
pkgrel=1
pkgdesc="Webhook to MUC bot"
arch=('x86_64')
url='https://gitlab.com/xmpp-rs/tokio-webhook2muc'
license=('GPL3')
provides=('webhook2muc')
conflicts=('webhook2muc')
depends=('openssl')
makedepends=('git' 'rust')
source=(
  "$_pkgbase::git+https://gitlab.com/xmpp-rs/tokio-webhook2muc"
  "$_pkgbase.env"
  "$_pkgbase.service"
  "0001-Use-iid-attribute-local-to-project-instead-of-id.patch"
  "0002-Trait-objects-without-explicit-dyn-are-deprecated.patch"
)
backup=("etc/$_pkgbase/$_pkgbase.env")

pkgver() {
  cd $srcdir/$_pkgbase
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd $srcdir/$_pkgbase
  # Waiting for upstream to merge these.
  # This fixes an issue with the ids displayed
  patch -p1 < ../0001-Use-iid-attribute-local-to-project-instead-of-id.patch
  # This fixes the build on nightly, not entirely necessary here since we use
  # stable.
  patch -p1 < ../0002-Trait-objects-without-explicit-dyn-are-deprecated.patch
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
            'b59d5a04f55268ae489a7858d6acafa2eececcf53f7b1070ac2126d52fe8b1b9'
            '3d317c793655155b45132c648dc8f8dbf039772f3b937a6bbe7ea7639bd3be06'
            '52fca5223a207ccf1de360dcfcced62c557cd8800dc407895e5a222b1d22bf4a')
