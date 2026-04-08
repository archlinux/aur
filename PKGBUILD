pkgname=wlime-git
_pkgname=wlime
pkgver=r3.ce3544d
pkgrel=1
pkgdesc='fullscreen arcade-style cjk input method for hyprland'
arch=('x86_64')
url='https://github.com/eam/wlime'
license=('GPL-3.0-or-later')
depends=(
  'gtk3'
  'gtk-layer-shell'
  'libpinyin'
  'wayland'
  'libxkbcommon'
  'cairo'
)
makedepends=(
  'git'
  'meson'
  'ninja'
  'wayland-protocols'
)
optdepends=(
  'pipewire: sound effects via pw-play'
  'ffmpeg: generate sound effects on first run'
  'libhangul: korean input engine support'
  'anthy: japanese input engine support'
  'librime: rime input engine support'
)
provides=('wlime')
conflicts=('wlime')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  local meson_options=(
    --prefix=/usr
    --buildtype=release
  )

  arch-meson "$srcdir/$_pkgname" build "${meson_options[@]}"
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build

  install -Dm644 "$srcdir/$_pkgname/README.md" \
    "$pkgdir/usr/share/doc/$pkgname/README.md"

  install -Dm644 "$srcdir/$_pkgname/config.example" \
    "$pkgdir/usr/share/doc/$pkgname/config.example"
}
