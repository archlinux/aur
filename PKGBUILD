# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

pkgname=hpklinux
pkgver=4.20.39
pkgrel=2
pkgdesc='AudioScience HPI (ASIHPI) user space libraries and tools'
arch=(x86_64 aarch64)
url='https://www.audioscience.com/internet/download/linux_drivers.htm'
license=(GPL2 ZLIB)
groups=(pro-audio)
provides=(python-audioscience)
depends=(glibc)
makedepends=(python-setuptools)
optdepends=('python: for python bindings'
            'python-docopt: for dab_data and dabtest scripts')
source=("https://www.audioscience.com/internet/download/drivers/released/v${pkgver//./\/}/${pkgname}_$pkgver.tar.gz")
sha256sums=('7d4017bc505ababff73b30e65f444a4517e1a11745835b2eaab224dfc7a34b1c')

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
