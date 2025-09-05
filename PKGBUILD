# Maintainer: Critlist <critlist at proton dot me>
pkgname=restohack
pkgver=1.1.2
pkgrel=1
pkgdesc="A faithful restoration of Hack v1.0.3 (1984), modernized and maintained"
arch=('x86_64')
url="https://github.com/Critlist/restoHack"
license=('BSD-3-Clause')
depends=('ncurses' 'glibc')
makedepends=('cmake' 'gcc' 'git')
source=("restoHack-${pkgver}.tar.gz::https://github.com/Critlist/restoHack/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9642bb68f28d6d2afa250b5080e981e3b7247dd5b21f32248558181898a481cf')
keywords=('roguelike' 'hack' 'nethack' 'retro' 'game' 'unix' 'bsd-games''roguelike' 'preservation' 'dungeon''nethack')

build() {
  cd "$srcdir/restoHack-${pkgver}"

  # Scrub build paths from the binary
  export CFLAGS+=" -ffile-prefix-map=$srcdir=/usr/src -ffile-prefix-map=$PWD=/usr/src"
  export CXXFLAGS+=" -ffile-prefix-map=$srcdir=/usr/src -ffile-prefix-map=$PWD=/usr/src"

  cmake -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_C_FLAGS="$CFLAGS" \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS"
  cmake --build build --config Release
}


package() {
  cd "$srcdir/restoHack-${pkgver}"
  install -Dm755 build/hack "$pkgdir/usr/bin/hack"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 man/hack.6 "$pkgdir/usr/share/man/man6/hack.6"

  install -d "$pkgdir/usr/share/hack"
  for file in data help hh rumors; do
    install -Dm644 "$file" "$pkgdir/usr/share/hack/$file"
  done
}
