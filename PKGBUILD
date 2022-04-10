# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
# Contributer: JP-Ellis <josh@jpellis.me>

pkgname=mivisionx
pkgver=5.1.0
pkgrel=1
pkgdesc="Set of comprehensive computer vision and machine intelligence libraries, utilities, and applications bundled into a single toolkit"
arch=('x86_64')
url="https://gpuopen-professionalcompute-libraries.github.io/MIVisionX/"
license=('MIT')
depends=('rocm-core' 'rocm-cmake' 'miopengemm' 'miopen' 'protobuf' 'opencv' 'ffmpeg4.4')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/GPUOpen-ProfessionalCompute-Libraries/MIVisionX/archive/rocm-$pkgver.tar.gz")
sha256sums=('e082415cc2fb859c53a6d6e5d72ca4529f6b4d56a4abe274dc374faaa5910513')

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
