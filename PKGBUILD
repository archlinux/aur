# Maintainer: Thibaut Pérami <thibaut.perami@cl.cam.ac.uk>

pkgname=zydis
pkgver=3.2.1
pkgrel=1
pkgdesc="The ultimate, open-source X86 & X86-64 decoder/disassembler library."
arch=('x86_64')
url="https://zydis.re"
license=('MIT')
depends=('gcc-libs')
provides=('libZydis.so')
makedepends=('cmake')

# The released version of ZyCore is not recent enough to compile the released version of ZyDis.
# The hackish workaround is to download the target commit of version 3.2.1 for ZyCore.
# This will need to be updated when ZyCore gets officially updated.
source=("https://github.com/zyantific/zydis/archive/v${pkgver}.tar.gz" "https://github.com/zyantific/zycore-c/archive/6c93d9a38e62d4db82f99bf99159e1ee78341e36.zip")
sha256sums=('349a2d27270e54499b427051dd45f7b6064811b615588414b096cdeeaeb730ad' '8876347e44f4cfdd49b0ce13d150b0715b9cf326d85627f444a4313f4c58be41')
zycore=zycore-c-6c93d9a38e62d4db82f99bf99159e1ee78341e36 

prepare() {
  cd "${pkgname}-${pkgver}"
}

build() {
  cd ${zycore}
  cmake -B build -Wno-dev\
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DZYCORE_BUILD_SHARED_LIB=ON
  cmake --build build
  cd ..

  cd "${pkgname}-${pkgver}"
  cmake -B build -Wno-dev\
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DZYDIS_BUILD_SHARED_LIB=ON \
        -DZYDIS_ZYCORE_PATH=../${zycore} #HACK
  cmake --build build
}

package() {
  cd ${zycore}
  DESTDIR="${pkgdir}" cmake --install build
  cd ..
  cd "${pkgname}-${pkgver}"
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
