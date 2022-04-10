# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
# Contributer: JP-Ellis <josh@jpellis.me>

pkgname=mivisionx
pkgver=5.1.1
pkgrel=1
pkgdesc="Set of comprehensive computer vision and machine intelligence libraries, utilities"
arch=('x86_64')
url="https://gpuopen-professionalcompute-libraries.github.io/MIVisionX/"
license=('MIT')
depends=('rocm-core' 'rocm-cmake' 'miopengemm' 'miopen' 'protobuf' 'opencv' 'ffmpeg4.4' 'qt5-base')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/GPUOpen-ProfessionalCompute-Libraries/MIVisionX/archive/rocm-$pkgver.tar.gz")
sha256sums=('028b825046a67d77e8711f7aeef119a0421df71a8a3f1ae1428be0231b62bea1')

build() {
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"

  export CXXFLAGS="${CXXFLAGS} -fcf-protection=none -fPIC -isystem /usr/include/ffmpeg4.4"

  cmake -DBACKEND=HIP \
        -DCMAKE_INSTALL_PREFIX=/opt/rocm/mivisionx \
        "$srcdir/MIVisionX-rocm-$pkgver"
  make
}

package() {
  cd "$srcdir/build"

  make DESTDIR="$pkgdir" install

  # add links
  install -d "$pkgdir/usr/bin"
  local _fn
  for _file in bin/* ; do
    _fn="$(basename -- $_file)"
    ln -s "/opt/rocm/mivisionx/bin/$_fn" "$pkgdir/usr/bin/$_fn"
  done
}
