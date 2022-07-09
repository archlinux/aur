# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
# Contributer: JP-Ellis <josh@jpellis.me>

pkgname=mivisionx
pkgver=5.2.0
pkgrel=1
pkgdesc="Set of comprehensive computer vision and machine intelligence libraries, utilities"
arch=('x86_64')
url="https://gpuopen-professionalcompute-libraries.github.io/MIVisionX/"
license=('MIT')
depends=('rocm-core' 'rocm-cmake' 'miopengemm' 'miopen' 'protobuf' 'opencv' 'ffmpeg4.4' 'qt5-base')
makedepends=('cmake')
_git='https://github.com/GPUOpen-ProfessionalCompute-Libraries/MIVisionX'
source=("$pkgname-$pkgver.tar.gz::$_git/archive/rocm-$pkgver.tar.gz"
        "include-path.patch::$_git/commit/ff4f54f4a4a99052494ff940860597a03c9f1f21.patch")
sha256sums=('fee620a1edd3bce18b2cec9ef26ec2afe0a85d6da8a37ed713ab0d1342382503'
            'd0e39d5f85a1f112dfb8c7cd0987680872a08f5a41d7dc2978efc954c3591154')
options=(!lto)
_dirname="$(basename "$_git")-$(basename "${source[0]}" ".tar.gz")"

prepare() {
    cd "$_dirname"
    patch -Np1 -i "$srcdir/include-path.patch"
}

build() {
  # -fcf-protection is not supported by HIP, see
  # https://docs.amd.com/bundle/ROCm-Compiler-Reference-Guide-v5.2/page/Appendix_A.html
  CXXFLAGS="${CXXFLAGS} -fcf-protection=none -isystem /usr/include/ffmpeg4.4" \
  cmake -B build -Wno-dev \
        -S "$_dirname" \
        -DCMAKE_INSTALL_PREFIX=/opt/rocm/mivisionx \
        -DBACKEND=HIP
  make -C build
}

package() {
  DESTDIR="$pkgdir" make -C build install

  # add links
  install -d "$pkgdir/usr/bin"
  local _fn
  for _fn in mv_compile runvx; do
    ln -s "/opt/rocm/mivisionx/bin/$_fn" "$pkgdir/usr/bin/$_fn"
  done
}
