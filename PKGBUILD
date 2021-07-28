# Maintainer : Frikilinux <frikilinux@gmail.com>

pkgname=mqa-identifier
_pkgname=MQA_identifier
pkgver=1.3
pkgrel=1
pkgdesc="Tool to identify MQA encoding and Master's Sample Rates"
arch=('x86_64')
url="https://github.com/purpl3F0x/MQA_identifier"
license=('Apache')
depends=('flac' 'qt5-base')
makedepends=()
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "CMakeLists.patch")
sha256sums=('ec9623af7babd805ae24dc9befb19aa9c6d85985fdb9105f24a175c35d460f11'
            '5042b493eaf1468bb5de65f140878ab9886e234041f086822386cc2a74a72e7c')
prepare() {
  cd "${_pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/CMakeLists.patch"
  sed -i "s%\.\/\/MQA_identifier%mqa-identifier%g" "gui/mainwindow.cpp"
}

build() {
  cmake -B build -S "${_pkgname}-${pkgver}"
  make -C build

  qmake "${_pkgname}-${pkgver}/gui" -o build_gui/Makefile
  make -C build_gui
}

package() {
  install -Dm755 "build/MQA_identifier" "${pkgdir}/usr/bin/mqa-identifier"
  install -Dm755 "build_gui/mqa_id_gui" "${pkgdir}/usr/bin/mqa-identifier-gui"
}
