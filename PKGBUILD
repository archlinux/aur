# Maintainer: Carlo Teubner <carlo@cteubner.net>
pkgname=wtype-git
pkgver=0.0.1r20.ca19f1c
pkgrel=1
pkgdesc="xdotool type for wayland"
arch=('x86_64')
url="https://github.com/atx/wtype"
license=('MIT')
depends=('wayland' 'libxkbcommon')
makedepends=('git' 'meson' 'jq')
source=("git+https://github.com/atx/wtype")
sha256sums=('SKIP')

prepare() {
  # This needs to happen here rather than build(), because 'meson introspect'
  # from pkgver() needs the build/ directory to exist.
  # But at this stage, CFLAGS/CPPFLAGS/LDFLAGS aren't exported yet (though they
  # do exist as bash variables), so fix that too.
  cd "$srcdir/${pkgname%-git}"
  CFLAGS=$CFLAGS CPPFLAGS=$CPPFLAGS LDFLAGS=$LDFLAGS \
    meson setup --prefix=/usr --buildtype=plain build/
}

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "%sr%s.%s" \
    "$(meson introspect --projectinfo build/ | jq -r .version)" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  meson compile -C build/
}

package() {
  cd "$srcdir/${pkgname%-git}"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  cp LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  DESTDIR="$pkgdir/" meson install -C build/
}

# vim:set ts=2 sw=2 et:
