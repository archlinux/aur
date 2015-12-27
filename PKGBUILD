# Mantainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=oclhashcat-cuda-git
epoch=1
pkgver=v0.4.0.0.r78.g484fce0
pkgrel=1
pkgdesc="World's fastest and most advanced GPGPU-based password recovery utility"
arch=('any')
url="https://hashcat.net/oclhashcat"
license=('MIpT')
makedepends=('cuda', 'nvidia-gdk')
conflicts=('oclhashcat')
provides=('oclhashcat')
source=("git+https://github.com/hashcat/oclHashcat.git")
sha512sums=('SKIP')

pkgver() {
  cd sway
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/oclHashcat"
  echo "Matching Makefile ..."
  sed -i 's/deps\/cuda-7\.5/\/opt\/cuda/' src/Makefile
}

build() {
  cd "${srcdir}/oclHashcat"
  if [[ "$CARCH" = "x86_64" ]]; then
    make cudaHashcat64.bin
  else
    make cudaHashcat32.bin
  fi
  make nv_all
}

package() {
  cd "${srcdir}/oclHashcat"
  make DESTDIR="$pkgdir/" install
}
