# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=picodrive-highscore-git
pkgver=r2132.4955d9a
pkgrel=1
pkgdesc="Highscore port of PicoDrive"
arch=('x86_64')
url="https://github.com/highscore-emu/picodrive"
license=('LicenseRef-custom')
depends=(
  'libhighscore-git'
  'zlib'
)
makedepends=(
  'git'
  'meson'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!lto')
source=('git+https://github.com/highscore-emu/picodrive.git'
        'git+https://github.com/irixxxx/libpicofe.git'
        'git+https://github.com/irixxxx/cyclone68000.git'
        'git+https://github.com/digital-sound-antiques/emu2413.git'
        'git+https://github.com/irixxxx/libchdr.git'
        'git+https://github.com/mackron/dr_libs.git')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd picodrive
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd picodrive
  git submodule init
  git config submodule.platform/libpicofe.url "$srcdir/libpicofe"
  git config submodule.cpu/cyclone.url "$srcdir/cyclone68000"
  git config submodule.pico/sound/emu2413.url "$srcdir/emu2413"
  git config submodule.pico/cd/libchdr.url "$srcdir/libchdr"
  git config submodule.platform/common/dr_libs.url "$srcdir/dr_libs"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd picodrive/platform
  arch-meson highscore build
  meson compile -C build
}

package() {
  cd picodrive/platform
  meson install -C build --no-rebuild --destdir "$pkgdir"

  cd "$srcdir/picodrive"
  install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
}
