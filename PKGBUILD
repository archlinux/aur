# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Tai Chi Minh Ralph Eastwood <tcmreastwood@gmail.com>

_pkgbase=physfs
pkgname=$_pkgbase-hg
pkgver=2.1.0.r1338.aae614cdd005
pkgrel=1
pkgdesc="A library to provide abstract access to various archives (development version)"
arch=('i686' 'x86_64')
url="http://icculus.org/physfs/"
license=('zlib')
depends=('zlib')
makedepends=('cmake' 'doxygen' 'mercurial')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
source=("hg+http://hg.icculus.org/icculus/physfs")
md5sums=('SKIP')

pkgver() {
  cd $_pkgbase
  # get version from cmake
  local ver="$(grep 'set(PHYSFS_VERSION.*)' CMakeLists.txt | sed 's/[^0-9\.]*//g')"
  printf "%s.r%s.%s" "$ver" "$(hg identify -n)" "$(hg identify -i)"
}

prepare() {
  cd $_pkgbase

  # avoid abort in docs target
  sed -i 's/-Werror//' CMakeLists.txt
}

build() {
  cd $_pkgbase

  cmake ./ -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr \
    -DPHYSFS_BUILD_TEST=OFF -DPHYSFS_BUILD_STATIC=OFF
  make all docs
}

package() {
  cd $_pkgbase

  make DESTDIR="$pkgdir/" install

  install -d "$pkgdir"/usr/share/{doc/physfs,man/man3}
  install -m644 docs/html/* "$pkgdir"/usr/share/doc/physfs
  install -m644 docs/man/man3/* "$pkgdir"/usr/share/man/man3

  # here is probably something with find+xargs the better way™
  for i in accesstime author closeArchive createtime Deinit deprecated \
    description destroy duplicate enumerateFiles extension filesize filetype \
    flush Free info Init length major Malloc minor mkdir modtime opaque \
    openAppend openArchive openRead openWrite patch read readonly Realloc \
    remove seek stat supportsSymlinks tell url version write
  do
    mv "$pkgdir"/usr/share/man/man3/$i.3 "$pkgdir"/usr/share/man/man3/PHYSFS_$i.3
  done

  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
