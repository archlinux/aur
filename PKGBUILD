# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Sebastian Gsänger <sebastian_gsaenger@web.de>
# Contributor: chn <g897331845@gmail.com>
# Contributor: Gregor Kaelin <kaelingre at gmail dot com>
pkgname=xeus-cling
pkgver=0.15.3
pkgrel=4
pkgdesc="A C++ jupyter kernel based on xeus and cling"
arch=(x86_64)
url="https://github.com/jupyter-xeus/${pkgname}"
license=(BSD-3-Clause)
depends=(xtl xproperty xeus3 nlohmann-json jupyterlab cling pugixml argparse xeus-zmq)
makedepends=(cmake cppzmq)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
  "0001-Rename-kernels.patch"
  "0002-Use-llvm-from-cling.patch"
  "0003-put-config-file-at-etc.patch"
  "0004-argparse-compatibility.patch::${url}/pull/522.patch")
sha512sums=('bb1f3414f88d49363d65b1a8b8c2be7d9c98cdd08172c8a5f8c5490d97cd07e7d55b0ebc7f622f42838314ce20a5f3f42186df358c668f2110665f4abd008926'
  '4c770adb7542473b467d73c0c724ed3665f02abaef1a85aebb3a9a36f4ee6d5485cb4a429c88c863b1f53b8024e5feaa0cbdcac8f01bbc678f8a06e510e3b814'
  '33040a9045c8c2f100c245ff3dffe41a3185d3ca94f332256bc6cd557c61282775023400a6a044825b664181e27b1e1cda1270491de41f65657c4a69d692784d'
  'b672c421b0efc96e93063c399f75133016dfe3c4b33bf44c089ce451394435fa59c2b562e86f6fd7c546f1a562249f0a5c48f7446312f65426533c8c39b62382'
  '6f03b0a41b2fe5fea4de19896316e1d8f69ca44b48551ba9070c5bfae6360d04cb78b554ab01ea4217a290433574e3f48e5b3b16fcdf1e23871acfa4b0c6e99f')

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
