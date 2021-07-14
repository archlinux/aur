# Maintainer: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=bfgminer-git
pkgver=5.5.0_28_g8e0278ad
pkgrel=1
pkgdesc="Bitcoin miner featuring overclocking, monitoring, fan speed control and remote management. For FPGA/GPU/CPU Bitcoin mining."
arch=('x86_64' 'aarch64')
depends=('curl' 'jansson' 'libevent' 'libmicrohttpd' 'libusb' 'lm_sensors')
makedepends=('uthash' 'yasm' 'git')
optdepends=('opencl-nvidia: OpenCL implementation for NVIDIA')
url='https://bitcointalk.org/?topic=877081'
license=('GPL3')
provides=('bfgminer')
conflicts=('bfgminer')
source=("git+https://github.com/luke-jr/bfgminer"
        'remove-dangerous-rpath.patch')
sha512sums=('SKIP'
            '087aa60d818ff37cb7a4edce7a34331a492b5e379a8e034d7a2e02b106bb6ea52b4ce6a1077f602987a2c30213bc185063990796a828ae95f60cff03c7a0bc3f')

pkgver(){
  cd ${pkgname//-git/}

  git describe --tags | sed "s/${pkgname//-git/}-//;s/-/_/g" 
}

prepare() {
  cd ${pkgname//-git/}

  sh autogen.sh
  patch -p1 -i "${srcdir}"/remove-dangerous-rpath.patch
}

build() {
  cd "${pkgname//-git/}"

  ./configure --prefix=/usr \
    --sbindir=/usr/bin \
    --enable-cpumining \
    --enable-bfsb \
    --enable-metabank \
    --enable-scrypt \
    --enable-opencl \
    --with-udevrulesdir=/usr/lib/udev/rules.d
  # --enable-knc (FS#33640)
  make
}

package() {
  cd "${pkgname//-git/}"

  make DESTDIR="${pkgdir}" install
}
