# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_reponame=midifile
pkgname=midifile-git
_name=${pkgname%-git}
pkgver=287.de6aa0c
pkgrel=1
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
pkgdesc='C++ classes for reading/writing Standard MIDI Files'
license=('BSD')
depends=()
makedepends=('cmake' 'git')
#provides=("${_name}")
conflicts=("${_name}")
url="http://midifile.sapp.org"
source=("${_reponame}::git+https://github.com/craigsapp/${_reponame}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_reponame"
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_reponame"
  sed -i "s/ STATIC / SHARED /" CMakeLists.txt
}

build() {
  cd "$srcdir/$_reponame"
  mkdir build && cd build
  cmake \
    -DCMAKE_BUILD_TYPE:STRING='Release' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -DCMAKE_SKIP_BUILD_RPATH:BOOL=ON \
    ..
  make
}

package() {
  cd "$srcdir/$_reponame"

  # install manually (there's no install target)

  mkdir -p "${pkgdir}/usr/"{lib,bin,include/midifile}

  pushd build
  # prevent conflict with pvoc
  for conflicting_file in stretch; do
    mv $conflicting_file $conflicting_file-$_name
  done
  find \( -iname '*.so' \)                                      -exec cp --target-directory="${pkgdir}/usr/lib" {} \;
  find \( -maxdepth 1 -executable -type f -not -iname '*.so' \) -exec cp --target-directory="${pkgdir}/usr/bin" {} \;
  popd

  pushd include
  find \( -iname '*.h' -type f \)                               -exec cp --target-directory="${pkgdir}/usr/include/midifile" {} \;
  popd
}
