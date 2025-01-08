# Maintainer: akku <akkun11.open@gmail.com>

_pkgname="libva-intel-driver"
pkgname="$_pkgname-hybrid-git"
pkgver=2.4.1.r10.gfd727a4e
pkgrel=1
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
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
    local _version
    _version="$(git -C "$_pkgsrc" tag --list --sort='-v:refname' | grep -E '^[0-9]+\.[0-9]+(\.[0-9]+)*$' | sort -rV | head -n1)"
    printf '%s.r%s.g%s' "$_version" \
                        "$(git -C "$_pkgsrc" rev-list --count "${_version}..HEAD")" \
                        "$(git -C "$_pkgsrc" rev-parse --short HEAD)"
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
