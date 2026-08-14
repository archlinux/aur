# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: yuki-san <yuki.from.akita _at_ gmail.com>
# Contributor: TheRealOne78 <bajcsielias78 at gmail dot com>

pkgname=cmigemo-git
pkgver=1.5.2.r35.gc7647c2
pkgrel=1
pkgdesc="An implementation of Migemo in C"
arch=(i686 x86_64)
url="https://www.kaoriya.net/software/cmigemo/"
license=(MIT)
depends=(glibc)
makedepends=(cmake git)
provides=(cmigemo libmigemo.so)
conflicts=(cmigemo)
source=(
  "${pkgname%-git}"::'git+https://github.com/koron/cmigemo.git'
  "https://skk-dev.github.io/dict/SKK-JISYO.L.gz")
sha256sums=('SKIP'
            '4236e1ae2ba667520922fc5aa406f77d8e30f3590421d34f41f46af641bb48aa')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed -E 's/^[^0-9]*//;s/_/-/;s/([^-]*-g)/r\1/;s/-/./g'
}

# prepare() {
#   mv "$srcdir/SKK-JISYO.L" "$srcdir/${pkgname%-git}/dict"
# }

build() {
  local cmake_options=(
    -B build
    -S "${pkgname%-git}"
    -Wno-author
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/usr
  )

  cmake "${cmake_options[@]}"
  cmake --build build
}

check() {
  cmake --build build --target test
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  cd "cmigemo"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 README.md AGENTS.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

# vim:set ts=2 sw=2 et:
