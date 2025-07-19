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
        'git+https://github.com/digital-sound-antiques/emu2413.git')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd picodrive
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd picodrive
  git submodule init pico/sound/emu2413
  git config submodule.pico/sound/emu2413.url "$srcdir/emu2413"
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
