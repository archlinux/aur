# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

pkgname=hpklinux
_fullver=4.20.36-g76c09bc
pkgver=${_fullver%-*}
pkgrel=2
pkgdesc='AudioScience HPI (ASIHPI) user space libraries and tools'
arch=(x86_64 aarch64)
url='https://www.audioscience.com/internet/download/linux_drivers.htm'
license=(GPL2 ZLIB)
groups=(pro-audio)
provides=(python-audioscience)
depends=(glibc)
makedepends=(python-setuptools)
optdepends=('python: for python bindings')
source=("https://www.audioscience.com/internet/download/drivers/released/v${pkgver//./\/}/${pkgname}_$_fullver.tar.gz"
        'build-flags.patch')
sha256sums=('3d3795b01f6181d8e51f78ca888519023cbdc1d83dac2fe0ae74fd6c43c7331d'
            '92d99042bf8747024110964481afa4b05f67e25e2553c31d47b0277902048031')

prepare() {
  cd ${pkgname}_$_fullver
  # fix some build flags
  patch -p1 -i ../build-flags.patch
}

build() {
  cd ${pkgname}_$_fullver
  make -C hpi-lib
  make -C hpi-cli-apps
  make -C asi-python build
}

package() {
  cd ${pkgname}_$_fullver
  make DESTDIR="$pkgdir" install-prefix=/usr -C hpi-lib install
  make DESTDIR="$pkgdir" install-prefix=/usr -C hpi-cli-apps install
  make CMD_OPTS="--root='$pkgdir' --skip-build --optimize=1" -C asi-python install
  # write custom ZLIB license header to file
  sed -n '/Copyright/,/GPLCompatibleLicenses/p' hpi-lib/hpi.h | install -Dvm644 /dev/stdin \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
