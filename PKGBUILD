# Maintainer: detiam <dehe_tian@outlook.com>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

_pkgname=junction
pkgname=junction-zhfix
pkgdesc="Application/browser chooser"
pkgver=1.6
pkgrel=4
#_tag=v$pkgver
_commit=53ca01d7f3eca72a4a6bb0727ca6aa5eec3e63db
arch=('x86_64' 'aarch64')
url="https://github.com/sonnyp/Junction"
license=('GPL3')
conflicts=("$_pkgname")
provides=("$_pkgname")
depends=('libadwaita' 'libportal-gtk4' 'gjs')
makedepends=('git' 'meson' 'python-gobject' 'blueprint-compiler')
checkdepends=('appstream-glib')
source=("${_pkgname}-${pkgver}::git+$url.git#commit=$_commit")
b2sums=('SKIP')

prepare() {
  cd "$_pkgname-$pkgver"

  git -c protocol.file.allow=always submodule update --init --recursive

  # fix Simplified Chinese translation
  pushd po
  sed -i 's/zh_Hans/zh_CN\nzh_SG/' LINGUAS
  ln -v zh_Hans.po zh_CN.po
  ln -v zh_Hans.po zh_SG.po
  popd

  # fix crash that happened when not in flatpak environment
  pushd src
  sed -i 's|XDG_DATA_DIRS.*e ||' bin.js
  popd

  # redirect output
  # if not, when use `xdg-open` there will have annoying log printed to terminal
  pushd data
  sed -i '/^Exec=/ s|$| 2>/dev/null|' re.sonny.Junction.desktop
  popd
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
