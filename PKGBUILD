# Maintainer: edub4rt <edub4rt@gmail.com>
pkgname=mingw-w64-physfs-hg
pkgver=1301
pkgrel=1
pkgdesc="A library to provide abstract access to various archives (mingw-w64)"
arch=('any')
url="http://icculus.org/physfs/"
license=('ZLIB')
makedepends=('mingw-w64-gcc' 'mingw-w64-cmake' 'mercurial')
depends=('mingw-w64-zlib')
options=('!strip' '!buildflags' '!makeflags')
source=()
sha1sums=()
provides=(mingw-w64-physfs)
replaces=(mingw-w64-physfs)
conflicts=(mingw-w64-physfs)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"
_hgroot="http://hg.icculus.org/icculus/physfs"
_hgrepo="physfs"

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."
  if [ -d $_hgrepo ]; then
    cd $_hgrepo
    hg pull -u || true
    msg "The local files are updated."
  else
    hg clone -b default $_hgroot $_hgrepo || true
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting make..."

  unset LDFLAGS
  export CFLAGS="$CFLAGS -fno-strict-aliasing"
  export CXXFLAGS="$CXXFLAGS -fno-strict-aliasing"
  for _arch in ${_architectures}; do
  rm -rf "$srcdir/$_hgrepo-build-${_arch}"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build-${_arch}"
  cd "$srcdir/$_hgrepo-build-${_arch}"
  sed -i 's/-Werror//g' CMakeLists.txt
        ${_arch}-cmake  -DCMAKE_BUILD_TYPE=Release \
            -DPHYSFS_BUILD_TEST=OFF \
                        -DPHYSFS_BUILD_WX_TEST=OFF .
        make all
  done
}

package() {
    for _arch in ${_architectures}; do
        cd ${srcdir}/$_hgrepo-build-${_arch}
        make DESTDIR=${pkgdir} install
    done
}
