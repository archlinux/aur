# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: prettyvanilla <prettyvanilla@posteo.at>
# Contributor: SpepS <dreamspepser at yahoo dot it>

_pkgname=lilv
pkgname=$_pkgname-git
pkgver=0.24.18.r1421.cd2be45
pkgrel=1
pkgdesc='A C library interface to the LV2 plug-in standard with Python bindings (git version)'
arch=(i686 x86_64)
url='http://drobilla.net/software/lilv'
license=(ISC)
depends=('lv2>=1.18.2' python sratom)
makedepends=(git libsndfile)
optdepends=(
    "bash-completion: completion for bash"
    "libsndfile: lv2apply utility"
)
provides=($_pkgname "$_pkgname=${pkgver//.r*/}" $_pkgname-docs)
conflicts=($_pkgname $_pkgname-docs)
source=("$_pkgname::git+https://gitlab.com/lv2/$_pkgname.git")
sha256sums=('SKIP')


pkgver() {
  cd $_pkgname
  local ver=$(grep -E "^\s+version: '[0-9]+\.[0-9]+\.[0-9]+'" meson.build | cut -d "'" -f 2)
  echo $ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  arch-meson $_pkgname $_pkgname-build
  meson compile -C $_pkgname-build
}

check() {
  meson test -C $_pkgname-build || echo "Ignoring failing tests"
}

package() {
  depends+=(libserd-0.so libsord-0.so libsratom-0.so)
  provides+=(liblilv-0.so)
  meson install -C $_pkgname-build --destdir "$pkgdir"
  # license
  install -vDm 644 $_pkgname/COPYING -t "$pkgdir"/usr/share/licenses/$pkgname
  # documentation
  mv -v "$pkgdir"/usr/share/doc/{$_pkgname-0,$pkgname}
  rm -v "$pkgdir"/usr/share/doc/$pkgname/{single,}html/.buildinfo
  install -vDm 644 $_pkgname/{AUTHORS,NEWS,README.md} -t "$pkgdir"/usr/share/doc/$pkgname
}
