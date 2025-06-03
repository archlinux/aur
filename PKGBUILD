# Maintainer:

_pkgname="libva-intel-driver"
pkgname="$_pkgname-hybrid"
pkgver=2.4.4
pkgrel=1
pkgdesc='VA-API implementation for Intel G45 and HD Graphics family'
url="https://github.com/irql-notlessorequal/intel-vaapi-driver"
license=('MIT')
arch=('x86_64')

depends=(
  'libva'
  'libdrm'
)
makedepends=(
  'git'
  'meson'
  'xorgproto'
)
optdepends=(
  'intel-hybrid-codec-driver: Provides codecs with partial HW acceleration'
)

provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")

_pkgsrc="irql-notlessorequal.intel-vaapi-driver"
source=("$_pkgsrc"::"git+$url.git#tag=$pkgver")
sha256sums=('55f012a1663cd9faeb202fa14bc162dafef0400e9ff73f4e296f102faef31eec')

pkgver() {
  cd "$_pkgsrc"
  git describe --tags
}

build() {
  arch-meson -Denable_hybrid_codec=true "$_pkgsrc" build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  install -Dm644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
