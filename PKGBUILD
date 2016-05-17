# Maintainer: XZS <d.f.fischer at web dot de>

# To only build some of the extensions, remove
# the unwanted ones from the $extensions variable.
extensions=('brightness' 'volume' 'user' 'location')
pkgbase='gnome-shell-extension-aggregatemenu-hider-git'
for e in ${extensions[@]}; do
  local pkg=gnome-shell-extension-hide-$e-git
  pkgname+=($pkg)
  eval "package_${pkg}() {
    package ${e^*}
  }"
done

pkgdesc="A generator for Gnome Shell extensions that hide items from the aggregate menu."
pkgver=3
pkgrel=4
arch=(any)
url='https://github.com/dffischer/gnome-aggregatemenu-hider'
license=(GPLv3)
depends=('gnome-shell')
makedepends=('waf')
source=("$pkgbase::git://github.com/dffischer/gnome-aggregatemenu-hider.git")
md5sums=('SKIP')

build() {
  join() {
    local IFS="$1"; shift; echo "$*";
  }
  cd $pkgbase
  waf --prefix=/usr configure
  waf --targets=$(join , ${extensions[@]^*}) build
}

package() {
  cd $pkgbase
  waf --destdir="$pkgdir" --targets=$1 install
  pkgdesc=\
"$(grep -Po '(?<="description": ").*(?=")' build/hide-$1@*/metadata.json)"
}
