# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=mephisto.lv2
pkgname="$_pkgname-git"
pkgver=0.18.2.r100.gc33b96b
pkgrel=1
pkgdesc='A Just-in-Time FAUST compiler embedded in an LV2 plugin (git version)'
arch=(x86_64)
url="https://git.open-music-kontrollers.ch/~hp/mephisto.lv2"
license=(Artistic2.0)
groups=(lv2-plugins pro-audio)
depends=(fontconfig glib2 glibc libglvnd libvterm libx11 ttf-fira-code ttf-fira-sans)
makedepends=(faust fontconfig git glew glu lv2 meson)
checkdepends=(lv2lint reuse)
optdepends=(
  'lv2-host: for LV2 plugins'
)
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname::git+https://git.open-music-kontrollers.ch/~hp/$_pkgname")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  test -d $_pkgname-build && extra_args="--reconfigure"
  arch-meson $extra_args $_pkgname-build $_pkgname
  meson compile -C $_pkgname-build
}

check() {
  meson test -C $_pkgname-build --print-errorlogs
}

package() {
  depends+=(libGL.so libfaust.so libfontconfig.so)
  meson install -C $_pkgname-build --destdir="$pkgdir"
  rm -vf "$pkgdir"/usr/lib/lv2/$pkgname/*.ttf
  for font_type in Bold Light Medium Regular; do
    ln -svf /usr/share/fonts/TTF/FiraCode-$font_type.ttf "$pkgdir"/usr/lib/lv2/$_pkgname
  done
  install -vDm 644 $_pkgname/{ChangeLog,README.md} -t "$pkgdir"/usr/share/doc/$pkgname
}
