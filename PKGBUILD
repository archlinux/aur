# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_name=Xmonk.lv2
_pkgname=${_name,,}
_plugin_uri="https://github.com/brummer10/$_name"
pkgname=$_pkgname-git
pkgver=0.4.r85.4443523
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
        'lv2ui.version'
        'libxputty::git+https://github.com/brummer10/libxputty.git')
sha256sums=('SKIP'
            '5abe9dbb9f02b02b361f5e5393e52029cd2eae4fb4b45817ad51c8ab7a217a88'
            'SKIP')


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
}

build() {
  cd $_name
  # make sure only needed symbols are export in UI shared lib
  export GUI_LDFLAGS="-Wl,--version-script=$srcdir/lv2ui.version"
  make
}

check() {
  lv2lint -M pack -I $_name/bin/$_name "$_plugin_uri"
}

package() {
  cd $_name
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
