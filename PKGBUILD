# Maintainer: Excalibur <saberconer@gmail.com>

_pkgname=ch9344
pkgname=${_pkgname}-dkms
pkgver=2.0
pkgrel=1
url="https://www.wch.cn/downloads/CH9344SER_LINUX_ZIP.html"
pkgdesc="Kernel module for CH9344/CH348 USB UART controller"
license=('unknown')
arch=('any')
depends=('dkms')
makedepends=('unzip')
conflicts=("${_pkgname}")
optdepends=('linux-headers: Build the module for Arch kernel'
            'linux-lts-headers: Build the module for LTS Arch kernel')
source=("CH9344SER_LINUX-$pkgver.ZIP::https://www.wch.cn/downloads/file/386.html"
        'dkms.conf'
        'fix-incompatible-pointer-types.patch')
noextract=("CH9344SER_LINUX-$pkgver.ZIP")
sha256sums=('b388b2af20bd6e3f842bb9c5bdc49ef681b7fc4e9b589e7f265eed61437e39f7'
            'cac2091fcfc7276c1b6fa5f5e0fa811f5aa51b9529652b02766ec933904e308f'
            '06a125bc78786ec7e11712ba4520a83ab53d1af906cfdf3336b0f3fe07c85587')

prepare() {
  cd "$srcdir"
  unzip -o "CH9344SER_LINUX-$pkgver.ZIP"
  patch LINUX/driver/ch9344.c fix-incompatible-pointer-types.patch
}

build() {
    :
}

package() {
  dir_name="${_pkgname}-${pkgver}"
  install -d "${pkgdir}"/usr/src/${dir_name}/
  install -Dm644 dkms.conf "$srcdir"/LINUX/driver/* "${pkgdir}/usr/src/${dir_name}/"

  sed -e "s/@_PKGNAME@/${_pkgname}/g" \
      -e "s/@PKGVER@/${pkgver}/g" \
      -i "${pkgdir}/usr/src/${dir_name}/dkms.conf"
}
