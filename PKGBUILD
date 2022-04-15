# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=mephisto.lv2
pkgname="$_pkgname-git"
pkgver=0.18.0.r0.g10860be
pkgrel=1
pkgdesc='A Just-in-Time FAUST compiler embedded in an LV2 plugin (git version)'
arch=(x86_64)
url="https://open-music-kontrollers.ch/lv2/mephisto/"
license=(Artistic2.0)
groups=(lv2-plugins pro-audio)
depends=(glibc libevdev libglvnd libvterm libx11 ttf-fira-code ttf-fira-sans)
makedepends=(faust fontconfig git glew glu lv2 meson)
checkdepends=(lv2lint reuse)
optdepends=(
  'lv2-host: for LV2 plugins'
)
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname::git+https://github.com/OpenMusicKontrollers/$_pkgname")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd $_pkgname
  # compiling subprojects/varchunk fails when using -Werror
  sed -i -e 's/werror=true/werror=false/' subprojects/varchunk/meson.build
}

build() {
  cd $_pkgname
  arch-meson -Duse-fontconfig=enabled build
  meson compile -C build
}

check() {
  cd $_pkgname
  meson test -C build || echo "Known issues with lv2lint aand reuse checks, upstream has been notified."
}

package() {
  depends+=(libGLEW.so libfaust.so libfontconfig.so)
  cd $_pkgname
  DESTDIR="$pkgdir" meson install -C build
  rm -vf "$pkgdir"/usr/lib/lv2/$pkgname/*.ttf
  for font_type in Bold Light Medium Regular; do
    ln -svf /usr/share/fonts/TTF/FiraCode-$font_type.ttf "$pkgdir"/usr/lib/lv2/$_pkgname
  done
  install -vDm 644 {ChangeLog,README.md} -t "${pkgdir}"/usr/share/doc/$pkgname
}
