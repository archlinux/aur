# Maintainer: kinker31 <dp223171@gmail.com>
# Contributor: Jan Cholasta <grubber at grubber cz>

pkgname=slade-git
pkgver=3.2.12+r3729+g48f82abfd
pkgrel=3
pkgdesc='SLADE3 Doom editor'
arch=('x86_64')
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
  'p7zip'
  'ninja')

source=("slade::git+https://github.com/sirjuddington/SLADE.git#branch=3.3.0")
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
  cmake -B build -G Ninja
  cmake --build build
}

package() {
  cd "$srcdir/slade/build"
  mkdir -p "$pkgdir"/usr/bin/
  mkdir -p "$pkgdir"/usr/share/slade3
  install -Dm755 ./slade "$pkgdir"/usr/bin/slade
  install -Dm644 ./slade.pk3 "$pkgdir"/usr/share/slade3/slade.pk3
}
