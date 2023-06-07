# Maintainer: detiam <dehe_tian@outlook.com>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

_pkgname=junction
pkgname=junction-zhfix
pkgver=1.6
_tag=v$pkgver
pkgrel=3
epoch=0
pkgdesc="Application/browser chooser"
arch=('x86_64')
url="https://github.com/sonnyp/Junction"
license=('GPL3')
provides=("${_pkgname}")
depends=('libadwaita' 'libportal-gtk4' 'gjs')
makedepends=('git' 'meson' 'python-gobject' 'blueprint-compiler')
checkdepends=('appstream-glib')
source=("${_pkgname}-${pkgver}::git+$url.git#tag=$_tag")
b2sums=('SKIP')

prepare() {
  cd "$_pkgname-$pkgver"

  # fix zh
  pushd po
  ln -vf zh_Hans.po zh_CN.po
  grep zh_CN LINGUAS || echo zh_CN >> LINGUAS
  cp -vf zh_Hans.po zh_SG.po
  grep zh_SG LINGUAS || echo zh_SG >> LINGUAS

  rm zh_Hans.po && sed -i '/zh_Hans/d' LINGUAS
  popd

  # fix crash when not in flatpak environment
  pushd src
  sed -i 's|XDG_DATA_DIRS.*e |FLATPAK_ID=fromAUR |' bin.js
  popd

  # redirect output
  # so when use `xdg-open` there will be no annoying log printed to terminal
  pushd data
  sed -i '/^Exec=/ s|$| 2>/dev/null|' re.sonny.Junction.desktop
  popd

  git submodule update --init --recursive
}

build() {
  arch-meson "$_pkgname-$pkgver" build
  meson compile -C build
}

#check() {
#  meson test -C build --print-errorlogs || :
#}

package() {
  meson install -C build --destdir "$pkgdir"
}
