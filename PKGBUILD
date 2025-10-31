# Maintainer: kinker31 <dp223171@gmail.com>
# Contributor: Jan Cholasta <grubber at grubber cz>

pkgname=slade-git
pkgver=3.2.8+r3163+gd826a3767
pkgrel=2
pkgdesc='SLADE3 Doom editor'
arch=('i686' 'x86_64')
url='http://slade.mancubus.net/'
license=('GPL-2.0-only')

#slade -------------
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
makedepends=('git'
  'cmake'
  'p7zip')

source=("slade::git+https://github.com/sirjuddington/SLADE.git")
sha256sums=('SKIP')

pkgver() {
  cd slade
  _version=$(git tag --sort=-v:refname --list | grep '^[0-9.]*$' | head -n1)
  _commits=$(git rev-list --count HEAD)
  _short_commit_hash=$(git rev-parse --short=9 HEAD)
  echo "${_version#'v'}+r${_commits}+g${_short_commit_hash}"
}

build() {
  cd slade
  cmake -B build -S . \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_RPATH="/opt/sfml2/lib" 
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
