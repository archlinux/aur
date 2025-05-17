# Maintainer: envolution
# Contributor: Jan Cholasta <grubber at grubber cz>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=slade-git
pkgver=3.2.7+r3112+ga515292e7
pkgrel=1
pkgdesc='SLADE3 Doom editor (git version)'
arch=('i686' 'x86_64')
url='http://slade.mancubus.net/'
license=('GPL-2.0-only')
depends=('bzip2'
  'fluidsynth'
  'freeimage'
  'ftgl'
  'glu'
  'libgl'
  'lua'
  'mpg123'
  'sfml'
  'webkit2gtk-4.1'
  'wxwidgets-gtk3'
  'zlib')
makedepends=('cmake'
  'git'
  'p7zip')
provides=('slade')
conflicts=('slade')
source=('slade::git+https://github.com/sirjuddington/SLADE.git')
sha256sums=('SKIP')

pkgver() {
  cd slade
  _version=$(git tag --sort=-v:refname --list | grep '^[0-9.]*$' | head -n1)
  _commits=$(git rev-list --count HEAD)
  _short_commit_hash=$(git rev-parse --short=9 HEAD)
  echo "${_version#'v'}+r${_commits}+g${_short_commit_hash}"
}

build() {
  exit 1
  cd slade
  cmake -B build -S . \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  # Install slade
  cd "$srcdir/slade/build"
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
