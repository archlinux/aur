# Maintainer: René Hickersberger <r@renehsz.com>
# Contributor: Sébastien Luttringer <seblu@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Joel Teichroeb <joel@teichroeb.net>

pkgname=wayland-static
pkgver=1.25.0
pkgrel=1
pkgdesc='A computer display server protocol (static library)'
arch=('x86_64')
url='https://wayland.freedesktop.org/'
license=('MIT')
options=('!lto')
depends=("wayland=$pkgver" 'glibc' 'libffi' 'expat' 'libxml2' 'default-cursors')
makedepends=('meson' 'libxslt' 'xmlto' 'graphviz' 'docbook-xsl')
validpgpkeys=('C7223EBE4EF66513B892598911A30156E0E67611'  # Bryce Harrington
              'C0066D7DB8E9AC6844D728715E54498E697F11D7'  # Derek Foreman
              '34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48') # emersion <contact@emersion.fr>
source=("https://gitlab.freedesktop.org/wayland/wayland/-/releases/$pkgver/downloads/wayland-$pkgver.tar.xz"{,.sig})
sha256sums=('c065f040afdff3177680600f249727e41a1afc22fccf27222f15f5306faa1f03'
            'SKIP')

build() {
  CFLAGS="${CFLAGS} -fno-lto" \
  CXXFLAGS="${CXXFLAGS} -fno-lto" \
  LDFLAGS="${LDFLAGS} -fno-lto" \
  arch-meson wayland-$pkgver build -Ddefault_library=static -Ddocumentation=false -Db_lto=false
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  provides=(libwayland-{client,cursor,egl,server}.a)

  meson install -C build --destdir "$pkgdir"

  # Only install the static library,
  # delete everything that would conflict with the official wayland package
  find "$pkgdir/usr/lib" -name '*.so*' -delete
  rm -r "$pkgdir"/usr/{bin,include,lib/pkgconfig,share}

  install -Dm 644 wayland-$pkgver/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim: ts=2 sw=2 et:
