# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: speps <speps at aur dot archlinux dot org>

_pkgname=lv2
pkgname=$_pkgname-git
pkgver=1.18.8.r1419.bd69ed7
pkgrel=1
pkgdesc='Plugin standard for audio systems (git version)'
arch=(i686 x86_64)
url='http://lv2plug.in/'
license=(ISC)
makedepends=(
  asciidoc
  codespell
  doxygen
  flake8
  git
  libsndfile
  meson
  pygmentize
  python-black
  python-lxml
  python-markdown
  python-pygments
  python-pylint
  python-rdflib
  serd
  sord
)
optdepends=(
  'sord: for lv2_validate'
  'libsndfile: for eg-sampler.lv2'
  'python-lxml: for lv2specgen.py'
  'python-markdown: for lv2specgen.py'
  'python-pygments: for lv2specgen.py'
  'python-rdflib: for lv2specgen.py'
)
provides=($_pkgname "${_pkgname}=${pkgver//.r*/}")
conflicts=($_pkgname)
source=("${_pkgname}::git+https://gitlab.com/lv2/lv2.git")
sha256sums=('SKIP')


pkgver() {
  cd $_pkgname
  local ver=$(grep -E "^\s+version: '[0-9]+\.[0-9]+\.[0-9]+'" meson.build | cut -d "'" -f 2)
  echo ${ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}


build() {
  arch-meson $_pkgname $_pkgname-build
  meson compile -C $_pkgname-build
}


check() {
  meson test -C $_pkgname-build
}

package() {
  meson install -C $_pkgname-build --destdir "$pkgdir"
  install -vDm 644 $_pkgname/COPYING -t "$pkgdir"/usr/share/licenses/$pkgname
  install -vDm 644 $_pkgname/README.md -t "$pkgdir"/usr/share/doc/$pkgname
}
