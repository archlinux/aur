# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_name=BAngr
_pkgname="${_name,,}.lv2"
_plugin_uri="https://www.jahnichen.de/plugins/lv2/$_name"
pkgname=$_pkgname-git
pkgdesc='A multi-dimensional dynamically distorted staggered multi-bandpass LV2 plugin (git version)'
pkgver=1.6.2.r10.gd477f6d
pkgrel=1
arch=(x86_64)
url="https://github.com/sjaehn/$_name"
license=(GPL3)
groups=(lv2-plugins pro-audio)
depends=(cairo gcc-libs glibc libx11)
makedepends=(cpio git lv2)
checkdepends=(lv2lint)
provides=(${_name,,} "${_name,,}=${pkgver//.r*/}" $_pkgname "${_pkgname}=${pkgver//.r*/}")
conflicts=(${_name,,} $_pkgname)
source=("$_pkgname::git+https://github.com/sjaehn/$_name"
        'bwidgets::git+https://github.com/sjaehn/BWidgets.git'
        'pugl::git+https://github.com/lv2/pugl.git')
md5sums=('SKIP'
         'SKIP'
         'SKIP')


pkgver() {
  cd $_pkgname
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd $_pkgname
  git submodule init
  git config submodule.src/BWidgets.url "$srcdir/bwidgets"
  git -c protocol.file.allow=always submodule update --init

  cd src/BWidgets
  git submodule init
  git config submodule.pugl.url "$srcdir/pugl"
  git -c protocol.file.allow=always submodule update --init
}

build() {
  cd $_pkgname
  make
}

check() {
  cd $_pkgname
  lv2lint \
    -Mpack \
    -s "_Z*" \
    -I "$_name.lv2/" \
    "${_plugin_uri}"
}

package() {
  cd $_pkgname
  make PREFIX="/usr" DESTDIR="$pkgdir/" install
  install -vDm 644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
  # Remove misplaced license file
  find "$pkgdir"/usr/lib/lv2/$_name.lv2 -type f -iname "*LICENSE*" -delete
}
