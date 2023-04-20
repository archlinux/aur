# Maintainer: camb
# Written with much help from https://github.com/tsduck/dektec-dkms

pkgname=dektec-dkms
pkgver=2022.12.2
pkgrel=1
pkgdesc="DekTec DKMS"
arch=('i686' 'x86_64')
url="https://www.dektec.com/"
license=('GPL2')
depends=('dkms')
source=("${url}/products/SDK/DTAPI/Downloads/LinuxSDK_v${pkgver}.tar.gz"
        'linux-3.18-dma-changes.patch'
        'linux-3.18-netif-changes.patch'
        'linux-6.2+-prefix-symbols.patch'
        'linux-6.2+-prefix-symbols.2022.06.0.patch'
        'dkms.conf'
        'Makefile')
md5sums=('72685face3bcf3b5c0aadf569ba8cca5'
         '732658890611d0c44c9a69e0e7832936'
         '7bcb9def37608558fbdef4053af96792'
         '8c4c8d92a5840ad03c5f6e0bcd27500b'
         '5817a31229c1f12ea0b3c6fc3fea05fa'
         '539fb620aadf7fcab3f29156b6e8bdc4'
         'e0a9e12767006053c4e71ecd49dd2769')

prepare() {
# Dropped the linux-3.18 patches as they don't apply anymore and don't
# seem to be needed.
# If you're going to go back in versions you may need them.
# They're still in the repo and still checksumed so you should be good to go
# putting the patch commands back in here

# If you're going back in versions, use the 2022.06.0 version of the prefix-symbols
# patch. It is also still in the repo and checksumed so you're fine to use.
  patch -d LinuxSDK -p0 -i "${srcdir}"/linux-6.2+-prefix-symbols.patch

  sed -e"s/@PKGVER@/${pkgver}/" -i "${srcdir}"/dkms.conf
}

package() {
  cd "${srcdir}"

  mkdir -p "${pkgdir}"/usr/src/${pkgname}-${pkgver}/

  # Copy sources (including Makefile and dkms.conf
  cp -L -r Makefile dkms.conf LinuxSDK/* "${pkgdir}"/usr/src/${pkgname}-${pkgver}/

  install -D -t "${pkgdir}"/etc/udev/rules.d/ -m 644 -o root -g root \
      ./LinuxSDK/Drivers/Dta/Source/Linux/51-dta.rules \
      ./LinuxSDK/Drivers/Dtu/Source/Linux/51-dtu.rules \
      ./LinuxSDK/Drivers/DtPcie/Source/Linux/51-dtpcie.rules
}
