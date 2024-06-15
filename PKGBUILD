# Maintainer: Laurent Carlier <lordheavym@gmail.com>
# Contributor: Luca Bennati <lucak3 AT gmail DOT com>
# Contributor: Glaucous <glakke1 at gmail dot com>

pkgname=lib32-apitrace
_name="${pkgname//lib32-/}"
pkgver=11.1
pkgrel=1
pkgdesc="Graphics API Tracing (32-bit)"
arch=('x86_64')
url="https://github.com/apitrace/apitrace"
license=(MIT)
depends=('python' 'lib32-libgl' 'lib32-libprocps' $_name=$pkgver)
makedepends=('cmake' 'git' 'gcc-multilib')
source=(
  $_name::git+$url.git#tag=$pkgver
  git+https://github.com/apitrace/gltrim-tests.git
  git+https://github.com/google/brotli.git
  git+https://github.com/google/googletest.git
  git+https://github.com/ianlancetaylor/libbacktrace.git
  git+https://github.com/apitrace/libpng.git
  git+https://github.com/google/snappy.git
  git+https://github.com/madler/zlib.git
  git+https://github.com/microsoft/DirectXMath.git
)
sha256sums=('2f641d885a7d69a6118a4348c4af85232194200c3ac1e6d7df140e283c2f2496'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd $_name

  git submodule init
  git config submodule.frametrim/tests.url "$srcdir/gltrim-tests"
  git config submodule.thirdparty/brotli.url "$srcdir/brotli"
  git config submodule.thirdparty/gtest.url "$srcdir/googletest"
  git config submodule.thirdparty/libbacktrace.url "$srcdir/libbacktrace"
  git config submodule.thirdparty/libpng.url "$srcdir/libpng"
  git config submodule.thirdparty/snappy.url "$srcdir/snappy"
  git config submodule.thirdparty/zlib.url "$srcdir/zlib"
  git config submodule.thirdparty/directxmath.url "$srcdir/DirectXMath"
  git -c protocol.file.allow=always submodule update
}


build() {
  cd $_name

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cmake . -Bbuild -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_SUFFIX=32 -DENABLE_GUI="no"
  make -C build
}

package() {
  cd $_name
  
  make  -C build DESTDIR="${pkgdir}/" install

  mv -v ${pkgdir}"/usr/bin/apitrace" ${pkgdir}"/usr/bin/apitrace32"
  rm -r ${pkgdir}/usr/share/doc
  rm ${pkgdir}/usr/bin/{*retrace,gltrim}
  
  install -m755 -d "${pkgdir}/usr/share/licenses/apitrace"
  ln -s apitrace "$pkgdir/usr/share/licenses/apitrace/"${pkgname}
}

