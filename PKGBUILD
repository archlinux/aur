# Maintainer: Maxime "pep" Buquet <archlinux@bouah.net>

_pkgbase='webhook2muc'
pkgname=${_pkgbase}-git
pkgver=r25.d651a59
pkgrel=3
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
  "0003-Catch-presence-error-when-joining-MUC.patch"
  "0004-Use-proper-Presence-structure-when-receiving-stanzas.patch"
  "0005-Update-xmpp-parsers-to-0.14.patch"
  "0006-Joining-a-MUC-requires-a-FullJid-nick-as-resource.patch"
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
  patch -p1 < ../0003-Catch-presence-error-when-joining-MUC.patch
  patch -p1 < ../0004-Use-proper-Presence-structure-when-receiving-stanzas.patch
  patch -p1 < ../0005-Update-xmpp-parsers-to-0.14.patch
  patch -p1 < ../0006-Joining-a-MUC-requires-a-FullJid-nick-as-resource.patch
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
            '1f1cad56ba6f5a7b2558a3bcae96fad2fe686081d4c36d24188991d11a275348'
            '5e692a34c101f2d08802fa6e92aea33abb00eb9148e53dc77b10e3417c86262a'
            '102f576912316b375e72a0b0b8728e13071c5f6ccbbab29b57bbcd3ee897a32a'
            'dceb8cdc246a48140a7b247886442be56a411716dfd0b833c41e7ca1982fe126'
            '7cbad8009b5d319fc35ad064c7504b34a8c34174d87d99b3fd2f90e53baea167'
            '86c29a931c5eb0121b84d81985ff9fcd908fcffae98a0e6fb1d95c3d3172ff5a'
            '9d57b4880ed1bc091004937a99881df8cf68c597830805396f123fb12660e472')
