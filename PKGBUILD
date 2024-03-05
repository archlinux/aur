# Maintainer:

_pkgname="libva-intel-driver"
pkgname="$_pkgname-hybrid"
pkgver=2.4.1
pkgrel=3
pkgdesc='VA-API implementation for Intel G45 and HD Graphics family'
url="https://github.com/intel/intel-vaapi-driver"
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

_pkgsrc="$_pkgname"
_commit='9a1f0c64174f970a26380d4957583c71372fbb7c'
source=("$_pkgsrc"::"git+$url.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --tags
}

build() {
  arch-meson -Denable_hybrid_codec=true "$_pkgsrc" build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  install -Dm644 "$_pkgsrc/COPYING" -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim: ts=2 sw=2 et:
