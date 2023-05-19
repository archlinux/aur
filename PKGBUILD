# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Sebastian Gsänger <sebastian_gsaenger@web.de>
# Contributor: chn <g897331845@gmail.com>
# Contributor: Gregor Kaelin <kaelingre at gmail dot com>

pkgname=xeus-cling
pkgver=0.15.1
pkgrel=1
pkgdesc="A C++ jupyter kernel based on xeus and cling"
arch=('x86_64')
url="https://github.com/jupyter-xeus/${pkgname}"
license=('custom:BSD-3-clause')
depends=(xtl xproperty xeus nlohmann-json jupyter-widgetsnbextension
  cling pugixml argparse xeus-zmq)
makedepends=(cmake cppzmq)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jupyter-xeus/${pkgname}/archive/${pkgver}.tar.gz"
  "0001-Rename-kernels.patch"
  "0002-Use-llvm-from-cling.patch"
  "0003-put-config-file-at-etc.patch")
sha512sums=('25716e6313e71cbc1cb78657674658788ff2eb399aad5ad8f11da448dac6a5df3ef8cc26d7aa72f2ba2ac5ae001c6d901dc2a1552a12f35b9f801c8d6765f2b2'
  '22286216ec59354374fa42245fc2b58c689f206a26da415bb2c922b6a79b466455a4f72ad013d1e56e30e0194de31c958ec787d411a141edc25c961cbdcd439a'
  '2fa2258c80ed7a7785441f7e03a8f14fd4fe24dce7c1506c2c592dc6173fdf689e05565e7a0e841df7cdee93bd105e66f6ab49664ebb97f4bf52b312ddad6427'
  'b5249f0c68301d12ae8aaf347eb9bf26971fb90286597e813aa67bd4258a75eeac86f059638357b0fb63a9da583eeb63ddf24c49060e4c2f4a7890257ccd9b44')

prepare() {
  cd ${pkgname}-${pkgver}

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 <"../$src"
  done
}

build() {
  if [ -z $CPLUS_INCLUDE_PATH ]; then
    export CPLUS_INCLUDE_PATH=/opt/cling/include
  else
    export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/opt/cling/include
  fi

  cmake \
    -S ${pkgname}-${pkgver} \
    -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=TRUE \
    -DCMAKE_CXX_STANDARD=17 \
    -DClang_DIR=/opt/cling/lib/cmake/clang
  cmake --build build --target all
}

package() {
  DESTDIR="${pkgdir}" cmake --build build-cmake --target install
  install -Dm 644 ${pkgname}-${pkgver}/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
