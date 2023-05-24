# Maintainer: detiam <dehe_tian@outlook.com>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

_pkgname=junction
pkgname=junction-zhfix
pkgver=1.6
_tag=v$pkgver
_trollcommit=fb2d7f26233cea295b23215fd38ecf12a02dbbd0
pkgrel=1
epoch=0
pkgdesc="Application/browser chooser"
arch=('x86_64')
url="https://github.com/sonnyp/Junction"
license=('GPL3')
depends=('libadwaita' 'libportal-gtk4' 'gjs')
makedepends=('git' 'meson' 'python-gobject' 'blueprint-compiler')
checkdepends=('appstream-glib')
source=("${_pkgname}-${pkgver}::git+$url.git#tag=$_tag"
  "git+https://github.com/sonnyp/troll.git#commit=$_trollcommit")
b2sums=('SKIP'
        'SKIP')

prepare() {
  cd "$_pkgname-$pkgver"

  pushd po
  ln -vf zh_Hans.po zh_CN.po
  grep zh_CN LINGUAS || echo zh_CN >> LINGUAS
  cp -vf zh_Hans.po zh_SG.po
  grep zh_SG LINGUAS || echo zh_SG >> LINGUAS

  rm zh_Hans.po && sed -i '/zh_Hans/d' LINGUAS
  popd

  git submodule init
  git config submodule.src/troll.url "$srcdir/troll"
  git -c protocol.file.allow=always submodule update --init --recursive
}

build() {
  arch-meson "$_pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
