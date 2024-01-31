# Maintainer: tuberry

pkgname=dict-cedict-git
_pkg=${pkgname%-git}
_txt=cedict_1_0_ts_utf-8_mdbg.txt
pkgver=20240130.r14.ff8e4db
pkgrel=1
pkgdesc="A port of CC-CEDICT database for dictd et al."
arch=(any)
url=https://www.mdbg.net/chinese/dictionary?page=cc-cedict
license=(CC-BY-SA-4.0)
depends=(dictd)
makedepends=(dictd git meson curl)
provides=("$_pkg")
conflicts=("$_pkg")
install="$pkgname".install
source=("$_txt.gz::https://www.mdbg.net/chinese/export/cedict/$_txt.gz"
        "git+https://github.com/tuberry/$_pkg")
sha512sums=(SKIP
            SKIP)

pkgver() {
  cd "$_pkg"
  printf "%s.r%s.%s" \
    $(curl "$url" 2>&1 | grep Latest | grep -Eo '[[:digit:]]{4}-[[:digit:]]{2}-[[:digit:]]{2}' | tr -d '-') \
    $(git rev-list --count HEAD) \
    $(git rev-parse --short HEAD)
}

prepare() {
  cd "$_pkg"
  ln -sf "$srcdir/$_txt" "$_txt"
}

build() {
  cd "$_pkg"
  make
}

package() {
  cd "$_pkg"
  make DESTDIR="$pkgdir" install
}

# vim: ts=2 sw=2 et:
