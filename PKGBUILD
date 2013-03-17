# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: M0Rf30
# Contributor: Samsagax <samsagax@gmail.com>

pkgname=bbswitch
pkgver=0.5
_extramodules=extramodules-3.8-ARCH # Don't forget to update bbswitch.install
pkgrel=3
pkgdesc="Kernel module allowing to switch dedicated graphics card on Optimus laptops"
arch=('i686' 'x86_64')
url=("http://github.com/Bumblebee-Project/bbswitch")
license=('GPL')
depends=('linux>=3.8' 'linux<3.9')
makedepends=('linux-headers>=3.8' 'linux-headers<3.9')
install=bbswitch.install
source=("https://github.com/downloads/Bumblebee-Project/bbswitch/${pkgname}-${pkgver}.tar.gz"
        "https://github.com/Bumblebee-Project/bbswitch/commit/5593d9519364dc7f6f28c3dd8358afb907f39c0f.patch")
md5sums=('5e0e6eb9c5e8c10db56e5b349b43bba7'
         'd76180b8f6fd092038d5ae7c71a9caa8')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  _kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
   
  patch -Np1 < ${srcdir}/5593d9519364dc7f6f28c3dd8358afb907f39c0f.patch
  make KDIR=/usr/src/linux-${_kernver}
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
   
  install -Dm644 bbswitch.ko "${pkgdir}"/usr/lib/modules/${_extramodules}/bbswitch.ko
  gzip "${pkgdir}/usr/lib/modules/${_extramodules}/bbswitch.ko"                      
}
