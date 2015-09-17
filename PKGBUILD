
pkgname=raknet-git
pkgver=r18.1a16989
pkgrel=1
pkgdesc="Cross platform C++ network library"
arch=('i686' 'x86_64')
url="http://www.jenkinssoftware.com/"
license=('custom')
depends=('gcc-libs')
makedepends=('cmake')
provides=('raknet')
conflicts=('raknet')
source=("git+https://github.com/OculusVR/RakNet.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/RakNet"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare () {
  cd ${srcdir}/RakNet

  # enable LIBCAT_SECURITY features
  sed -i -e s@//#define@#define@g Source/NativeFeatureIncludesOverrides.h
}

build()
{
  cd ${srcdir}/RakNet
  mkdir -p build && pushd build
  cmake -DCMAKE_BUILD_TYPE=Release       \
        -DCMAKE_INSTALL_PREFIX=/usr      \
        -DRAKNET_GENERATE_SAMPLES=False \
        -DRAKNET_ENABLE_STATIC=OFF ..
  make
}

package()
{
  cd ${srcdir}/RakNet

  # DESTDIR is not used correctly so copy library and its headers manually
  install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
  
  install -d "${pkgdir}"/usr/{lib,include/raknet}
  cp build/Lib/DLL/libRakNetDLL.so "${pkgdir}"/usr/lib/
  install -m644 Source/*.h "${pkgdir}"/usr/include/raknet/
}
