# Mantainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=cudahashcat-git
pkgver=v0.4.0.0.r78.g484fce0
pkgrel=4
pkgdesc="World's fastest and most advanced GPGPU-based password recovery utility"
arch=('any')
url="https://hashcat.net/oclhashcat"
license=('MIT')
makedepends=('cuda' 'nvidia-gdk')
conflicts=('cudahashcat')
provides=('cudahashcat')
source=("git+https://github.com/hashcat/oclHashcat.git")
sha512sums=('SKIP')
options=('!strip')

pkgver() {
  cd oclHashcat
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/oclHashcat"
  echo "Matching Makefile ..."
  sed -i 's/deps\/cuda-7\.5/\/opt\/cuda/' src/Makefile
  sed -i 's/deps\/nvidia-gdk//' src/Makefile
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

  install -d "${pkgdir}/usr/share/oclHashcat/charsets"
  install -d "${pkgdir}/usr/share/oclHashcat/kernels"
  install -d "${pkgdir}/usr/share/oclHashcat/masks"
  install -d "${pkgdir}/usr/share/oclHashcat/rules"
  install -d "${pkgdir}/usr/share/doc/oclHashcat/extra"

  cp -ar charsets/* "${pkgdir}/usr/share/oclHashcat/charsets/"
  cp -ar kernels/* "${pkgdir}/usr/share/oclHashcat/kernels/"
  cp -ar masks/* "${pkgdir}/usr/share/oclHashcat/masks/"
  cp -ar rules/* "${pkgdir}/usr/share/oclHashcat/rules/"
  cp -a hashcat.hcstat "${pkgdir}/usr/share/oclHashcat/"
  cp -ar docs/* "${pkgdir}/usr/share/doc/oclHashcat/"
  cp -ar extra/* "${pkgdir}/usr/share/doc/oclHashcat/extra/"
  install -Dm755 cudaHashcat64.bin "${pkgdir}/usr/bin/cudahashcat"
}
