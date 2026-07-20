# Maintainer: Nauris Steins <me@naurissteins.com>
pkgname=sweetbg-git
_repo=sweetbg
pkgver=0.1.0.r0.ge198032
pkgrel=1
pkgdesc="Small, lightweight and static Wayland wallpaper daemon (latest git)"
arch=('x86_64')
url="https://github.com/sweetwm/sweetbg"
license=('GPL-3.0-or-later')
provides=('sweetbg')
conflicts=('sweetbg' 'sweetbg-bin')
options=('!debug')
depends=('wayland' 'libpng' 'libjpeg-turbo' 'libwebp')
makedepends=('git' 'meson' 'ninja' 'pkgconf' 'wayland-protocols' 'scdoc')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_repo"
  local desc
  if desc=$(git describe --long --tags --abbrev=7 2>/dev/null); then
    printf '%s' "$desc" | sed 's/^v//; s/-/.r/; s/-/./'
  else
    printf '%s.r%s.g%s' \
      "$(sed -n "s/^\tversion: '\(.*\)',\$/\1/p" meson.build)" \
      "$(git rev-list --count HEAD)" \
      "$(git rev-parse --short=7 HEAD)"
  fi
}

build() {
  arch-meson "$_repo" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"

  install -Dm644 "$_repo/README.md" "$pkgdir/usr/share/doc/sweetbg/README.md"
  install -Dm644 "$_repo/config/example.toml" \
    "$pkgdir/usr/share/doc/sweetbg/example.toml"
}
