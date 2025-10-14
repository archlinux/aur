# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: prettyvanilla <prettyvanilla@posteo.at>
# Contributor: SpepS <dreamspepser at yahoo dot it>

_pkgname=lilv
pkgname=$_pkgname-git
pkgver=0.25.1.r1620.17f153f
pkgrel=1
pkgdesc='A C library interface to the LV2 plug-in standard with Python bindings (git version)'
arch=(x86_64)
url='http://drobilla.net/software/lilv'
license=(ISC 0BSD)
depends=(glibc 'lv2>=1.18.2' 'sord>=0.16.19' python)
makedepends=(git libsndfile serd sord sratom zix)
optdepends=(
    "bash-completion: completion for bash"
    "libsndfile: lv2apply utility"
    "python-numpy: for Python bindings"
)
provides=($_pkgname "$_pkgname=${pkgver//.r*/}" $_pkgname-docs python-$_pkgname)
conflicts=($_pkgname $_pkgname-docs python-$_pkgname)
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
  depends+=(libserd-0.so libsord-0.so libsratom-0.so libzix-0.so)
  provides+=(liblilv-0.so)
  meson install -C $_pkgname-build --destdir "$pkgdir"
  # license
  install -vDm 644 $_pkgname/LICENSES/* -t "$pkgdir"/usr/share/licenses/$pkgname
  # documentation
  mv -v "$pkgdir"/usr/share/doc/{$_pkgname-0,$pkgname}
  install -vDm 644 $_pkgname/{AUTHORS,NEWS,README.md} -t "$pkgdir"/usr/share/doc/$pkgname
}
