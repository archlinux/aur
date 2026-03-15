# Maintainer: noureddinex
# Contributor: envolution
# Contributor: Jan Cholasta <grubber at grubber cz>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=slade
pkgver=3.2.12
pkgrel=1
pkgdesc='SLADE3 Doom editor'
arch=('i686' 'x86_64')
url='http://slade.mancubus.net/'
license=('GPL-2.0-only')
depends=(
  'bzip2'
  'fluidsynth'
  'libwebp'
  'ftgl'
  'glu'
  'gtk3'
  'libgl'
  'lua'
  'mpg123'
  'sfml'
  'wxwidgets-common'
  'webkit2gtk-4.1'
  'wxwidgets-gtk3'
  'zlib'
  'sdl2-compat'
  'pcre2'
  'curl'
  'expat'
  'libsecret'
  'gspell'
  'xz')
makedepends=(
  'git'
  'cmake'
  'p7zip')

source=("git+https://github.com/sirjuddington/SLADE.git#tag=${pkgver}")
sha256sums=('f6f55ce6d6f5249509bca79addd3b5ea488282d9502efa8c37af3c02582880ed')

build() {
  cd SLADE
  cmake -B build -S . \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  # Install slade
  cd "$srcdir/SLADE/build"
  make install DESTDIR="$pkgdir"

  # Rename slade executable and create wrapper script
  mv "$pkgdir/usr/bin/slade" "$pkgdir/usr/bin/slade3.bin"
  cat >"$pkgdir/usr/bin/slade" <<'EOF'
#!/bin/sh
GDK_BACKEND=x11 exec /usr/bin/slade3.bin "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/slade"
}
# vim:set ts=2 sw=2 et:
