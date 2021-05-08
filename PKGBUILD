# Maintainer: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=bfgminer
pkgver=5.5.0
pkgrel=3
pkgdesc="Bitcoin miner featuring overclocking, monitoring, fan speed control and remote management. For FPGA/GPU/CPU Bitcoin mining."
arch=('x86_64')
depends=('curl' 'jansson' 'libevent' 'libmicrohttpd' 'libusb' 'lm_sensors')
makedepends=('uthash' 'yasm')
optdepends=('opencl-nvidia: OpenCL implementation for NVIDIA')
url='https://bitcointalk.org/?topic=877081'
license=('GPL3')
source=("https://luke.dashjr.org/programs/bitcoin/files/${pkgname}/${pkgver}/${pkgname}-${pkgver}.txz"
        'remove-dangerous-rpath.patch')
sha512sums=('d1adae473e01fcf1cd0efde74d3e8ce10609e520397d688bf4e226c1113c1606c782e3cfdba6847f1a3886cac30de6b5baa03b731aca86287d53bf01ef705cdb'
            '087aa60d818ff37cb7a4edce7a34331a492b5e379a8e034d7a2e02b106bb6ea52b4ce6a1077f602987a2c30213bc185063990796a828ae95f60cff03c7a0bc3f')

prepare() {
  cd "${pkgname}"-"${pkgver}"

  patch -p1 -i "${srcdir}"/remove-dangerous-rpath.patch
}

build() {
  cd "${pkgname}"-"${pkgver}"

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
  cd "${pkgname}"-"${pkgver}"

  make DESTDIR="${pkgdir}" install
}
