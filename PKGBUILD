# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

pkgname=hpklinux
pkgver=4.20.43
pkgrel=1
pkgdesc='AudioScience HPI (ASIHPI) user space libraries and tools'
arch=(aarch64 x86_64)
url='https://www.audioscience.com/internet/download/linux_drivers.htm'
license=(GPL-2.0-only Zlib)
groups=(pro-audio)
provides=(python-audioscience)
depends=(glibc)
makedepends=(python-setuptools)
optdepends=('python: for python bindings'
            'python-docopt: for dab_data and dabtest scripts')
source=("https://www.audioscience.com/internet/download/drivers/released/v${pkgver//./\/}/${pkgname}_$pkgver.tar.gz"
        'python.patch')
sha256sums=('e4199f92a2080e913d26ba5cd38f52212cca5aefcc3a2f669b0b989c7ac510f3'
            '922832e6c35ed4f55ad7de6138d9fe92fb6add684646471d0b9e616f96802cd7')

prepare() {
  cd ${pkgname}_$pkgver
  # fix python2 call in asi-python Makefile
  patch -p1 -i ../python.patch
}

build() {
  cd ${pkgname}_$pkgver
  make -C hpi-lib
  make -C hpi-cli-apps
  make -C asi-python build
}

package() {
  cd ${pkgname}_$pkgver
  make DESTDIR="$pkgdir" install-prefix=/usr -C hpi-lib install
  make DESTDIR="$pkgdir" install-prefix=/usr -C hpi-cli-apps install
  make CMD_OPTS="--root='$pkgdir' --skip-build --optimize=1" -C asi-python install
  # write custom ZLIB license header to file
  sed -n '/Copyright/,/GPLCompatibleLicenses/p' hpi-lib/hpi.h | install -Dvm644 /dev/stdin \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
