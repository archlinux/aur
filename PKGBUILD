# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=nm-tray
pkgver=0.4.3
pkgrel=1
pkgdesc='Simple Qt based frontend for NetworkManager'
arch=('x86_64')
url='https://github.com/palinek/nm-tray'
license=('GPL')
depends=('networkmanager-qt>=5.36.0')
makedepends=('cmake>=3.1.0' 'qt5-tools>=5.4.0')
optdepends=(
  'xterm: edit connections'
)
provides=("$pkgname")
conflicts=("$pkgname")
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/palinek/nm-tray/archive/${pkgver}.tar.gz"
  "fix-missing-qmetaenum.patch::https://github.com/palinek/nm-tray/commit/4563dabee3cbee13bc9d23a4a5d0ddda1526b43f.patch"
)
sha256sums=(
  '1611c053582189091efa74c2f26277afc872a57cfd4ec9e54463f68c25ad284b'
  'd4359bf2b78e1e5fba751a7f04912bcac8e6a4ca0fd18eb91849cbbb5a9cd63c'
)

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -p1 < ../fix-missing-qmetaenum.patch
}

build() {
  cd "${pkgname}-${pkgver}"
  mkdir -p build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DNM_TRAY_XDG_AUTOSTART_DIR="/etc/xdg/autostart"
  make
}

package() {
  install -d "${pkgdir}/usr/share/${pkgname}"

  cd "${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install

  cd ..
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
