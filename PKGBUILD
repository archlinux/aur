# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Sebastian Gsänger <sebastian_gsaenger@web.de>
# Contributor: chn <g897331845@gmail.com>
# Contributor: Gregor Kaelin <kaelingre at gmail dot com>

pkgname=xeus-cling
pkgver=0.15.2
pkgrel=1
pkgdesc="A C++ jupyter kernel based on xeus and cling"
arch=('x86_64')
url="https://github.com/jupyter-xeus/${pkgname}"
license=('custom:BSD-3-clause')
depends=(xtl xproperty xeus nlohmann-json jupyterlab cling pugixml argparse xeus-zmq)
makedepends=(cmake cppzmq)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
  "0001-Rename-kernels.patch"
  "0002-Use-llvm-from-cling.patch"
  "0003-put-config-file-at-etc.patch")
sha512sums=('7b444a83a6a4d35f4664133def2207976f2e8c903b773d8a42be3da6b0c2b88337adb3b93efd0dbeaa8aae267d1086f11fdeaa2ed3171061f50051a92130e636'
  '6f77266a0784afc7daeb5910dd18d3bfcfd65d71f746b9d3165cdfa7a0541e4f1bf1a243aea1063209d329643904636b9f92d7bc59b643adfda9b960d3e69dfc'
  '33040a9045c8c2f100c245ff3dffe41a3185d3ca94f332256bc6cd557c61282775023400a6a044825b664181e27b1e1cda1270491de41f65657c4a69d692784d'
  'b672c421b0efc96e93063c399f75133016dfe3c4b33bf44c089ce451394435fa59c2b562e86f6fd7c546f1a562249f0a5c48f7446312f65426533c8c39b62382')

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
  DESTDIR="${pkgdir}" cmake --build build --target install
  install -Dm 644 ${pkgname}-${pkgver}/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
