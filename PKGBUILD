# Maintainer: witt <1929161762 at qq dot com>

pkgname=shotcut-git
pkgdesc='Cross-platform Qt based Video Editor - Git latest'
pkgver=25.03.29+r6598+g86552b847
pkgrel=1
arch=('x86_64')
url='https://www.shotcut.org'
license=('GPL3')
depends=('qt6-base' 'qt6-declarative' 'qt6-imageformats' 'qt6-multimedia' 'qt6-translations'
         'mlt' 'movit' 'ffmpeg' 'libx264' 'libvpx' 'lame' 'frei0r-plugins' 'ladspa' 'qt6-charts')
optdepends=('swh-plugins: Several audio filters')
provides=("shotcut")
conflicts=('shotcut' 'shotcut-bin')
makedepends=('qt6-tools' 'git' 'cmake' 'ninja' 'clang')
source=("git+https://github.com/mltframework/shotcut.git")
sha512sums=('SKIP')

prepare() {
  cd shotcut
  sed -e 's|${Qt6_LUPDATE_EXECUTABLE}|/usr/lib/qt6/bin/lupdate|' -i translations/CMakeLists.txt
}

pkgver(){
  cd "$srcdir/shotcut"
  _version=$(git tag --sort=-v:refname --list | head -n1 | cut -c2-)
  _commits=$(git rev-list --count HEAD)
  _short_commit_hash=$(git rev-parse --short=9 HEAD)
  echo "${_version#'v'}+r${_commits}+g${_short_commit_hash}"
}

build() {
  cd shotcut
  compile_version=${pkgver/#v/}     # First remove optional leading 'v'
  compile_version=${compile_version%%+*}   # Then remove everything after first '+'

  #   https://github.com/mltframework/shotcut/issues/1275
  export CXXFLAGS+=" -DSHOTCUT_NOUPGRADE -w"

  cmake \
    -Bbuild \
    -GNinja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DSHOTCUT_VERSION="$compile_version" \
    -Wno-dev >/dev/null
  cmake --build build > /dev/null
}

package() {
  cd shotcut

  DESTDIR="${pkgdir}" cmake --install build > /dev/null
}

# vim: ts=2 sw=2 et:
