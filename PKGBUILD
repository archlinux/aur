# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>
# Contributor: acxz <akashpatel2008 at yahoo dot com>

pkgname=rocm-smi-lib
pkgver=5.1.1
pkgrel=1
pkgdesc='ROCm System Management Interface Library'
arch=('x86_64')
url="https://github.com/RadeonOpenCompute/rocm_smi_lib"
license=('custom:NCSAOSL')
depends=('hsa-rocr')
provides=("rocm-smi-lib64=$pkgver")
replaces=('rocm-smi-lib64')
conflicts=('rocm-smi-lib64')
makedepends=('cmake' 'doxygen' 'texlive-latexextra')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RadeonOpenCompute/rocm_smi_lib/archive/rocm-$pkgver.tar.gz")
sha256sums=('aa7ca64392f9194bcf19f980e6696761ef9408a9d4ceb397d6cdec7dc75eed8a')
options=(!lto)
_dirname="$(basename "$url")-$(basename "${source[0]}" .tar.gz)"


build() {
  # build type Release fixes warnings regarding FORTIFY_SOURCE
  cmake -DCMAKE_INSTALL_PREFIX=/opt/rocm \
        -DCMAKE_BUILD_TYPE=Release \
        -S "$_dirname" \
        -B build
  make -C build
}

package() {
  DESTDIR="$pkgdir" make -C build install
  install -Dm644 "$srcdir/$_dirname/License.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
