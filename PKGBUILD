# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor:  VirtualTam <virtualtam -at- flibidi -dot- net>

_pkgname=raul
pkgname=$_pkgname-git
pkgver=2.0.1.r684.3e37783
pkgrel=1
epoch=1
pkgdesc='Realtime Audio Utility Library for audio and musical applications (git version)'
arch=(any)
url='http://drobilla.net/software/raul/'
license=(GPL3)
depends=(gcc-libs)
makedepends=(git meson)
provides=($_pkgname $_pkgname=${pkgver//.r*/})
conflicts=($_pkgname)
source=("$_pkgname::git+https://gitlab.com/drobilla/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  local ver=$(grep -E "^\s+version: '[0-9]+\.[0-9]+\.[0-9]+'" meson.build | cut -d "'" -f 2)
  echo "$ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  if [[ -d $pkgname-builddir ]]; then
    arch-meson --reconfigure $pkgname-builddir $_pkgname
  else
    arch-meson $pkgname-builddir $_pkgname
  fi

  meson compile -C $pkgname-builddir
}

check() {
  meson test -C $pkgname-builddir
}

package() {
  meson install --destdir="$pkgdir" -C $pkgname-builddir
  cd $_pkgname
  install -v -D -m 644 README.md NEWS -t "$pkgdir"/usr/share/doc/$pkgname
}
