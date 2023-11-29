# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_name=Xmonk.lv2
_pkgname=${_name,,}
_plugin_uri="https://github.com/brummer10/$_name"
pkgname=$_pkgname-git
pkgver=0.4.r56.3f69d90
pkgrel=1
pkgdesc='A simple sound generator LV2 plugin to have some fun with (git version)'
arch=(x86_64)
url="https://github.com/brummer10/$_name"
license=(0BSD)
depends=(gcc-libs glibc cairo libx11)
makedepends=(git)
groups=(pro-audio lv2-plugins)
provides=($_pkgname ${_pkgname/./-}-git)
conflicts=($_pkgname ${_pkgname/./-}-git)
source=("$_name::git+https://github.com/brummer10/$_name.git"
        'libxputty::git+https://github.com/brummer10/libxputty.git'
        'libxputty-fix-asprintf.patch::https://github.com/brummer10/libxputty/commit/7eb70bf3f7bce0af9e1919d6c875cdb8efca734e.patch')
sha256sums=('SKIP'
            'SKIP'
            '15fe7e3e2ec8efe62dc9bb4c0830eaf3ed0373cd39ebd755f2d9193710ebbf76')


pkgver() {
  cd $_name
  local ver="$(grep '^\s*VER =' Xmonk/Makefile | cut -d ' ' -f 3)"
  echo "$ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_name
  git submodule init
  git submodule set-url libxputty "$srcdir"/libxputty
  git -c protocol.file.allow=always submodule update
  cd libxputty
  patch -p1 -N -r - -i "$srcdir"/libxputty-fix-asprintf.patch || true
}

build() {
  cd $_name
  make
}

check() {
  lv2lint -M pack -I $_name/${_name/.lv2/}/$_name "$_plugin_uri"
}

package() {
  cd $_name
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
