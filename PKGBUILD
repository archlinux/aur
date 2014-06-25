# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Tai Chi Minh Ralph Eastwood <tcmreastwood@gmail.com>

_name=physfs
pkgname=$_name-hg
pkgver=2.1.0.r1345.29ab417d9453
pkgrel=1
pkgdesc="A library to provide abstract access to various archives (development version)"
arch=('i686' 'x86_64')
url="http://icculus.org/physfs/"
license=('zlib')
depends=('zlib')
makedepends=('cmake' 'doxygen' 'mercurial')
provides=("$_name")
conflicts=("$_name")
source=("hg+http://hg.icculus.org/icculus/physfs")
md5sums=('SKIP')

pkgver() {
  cd $_name

  # get version from cmake
  local _ver="$(grep 'set(PHYSFS_VERSION.*)' CMakeLists.txt | sed 's/[^0-9\.]*//g')"
  printf "%s.r%s.%s" "$_ver" "$(hg identify -n)" "$(hg identify -i)"
}

prepare() {
  cd $_name

  # avoid abort in docs target
  sed -i 's/-Werror//' CMakeLists.txt
}

build() {
  cd $_name

  cmake ./ -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr \
    -DPHYSFS_BUILD_TEST=OFF -DPHYSFS_BUILD_STATIC=OFF
  make all docs
}

package() {
  cd $_name

  make DESTDIR="$pkgdir/" install

  # doc
  install -d "$pkgdir"/usr/share/{doc/physfs,man/man3}
  install -m644 docs/html/* "$pkgdir"/usr/share/doc/physfs
  install -m644 docs/man/man3/PHYSFS_* "$pkgdir"/usr/share/man/man3
  # prefix manual pages with PHYSFS_
  find docs/man/man3/ -type f -not \( -name "PHYSFS_*.3" -o -name "_*" \) -printf "%f\0" | \
    xargs -0 -I{} install -m644 docs/man/man3/{} "$pkgdir"/usr/share/man/man3/PHYSFS_{}
  # license
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
