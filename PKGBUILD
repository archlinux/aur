# Maintainer: FabioLolix
# Maintainer: Hanna Rose <imhxnna@gmail.com>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=odin-dev-bin
_pkgver=2021-11
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A fast, concise, readable, pragmatic and open sourced programming language."
arch=(x86_64)
url="https://odin-lang.org/"
license=(BSD)
depends=(llvm11-libs)
makedepends=(patchelf)
provides=(odin)
conflicts=(odin)
options=(!strip)
source=("https://github.com/odin-lang/Odin/archive/refs/tags/dev-${_pkgver}.tar.gz")
source_x86_64=("https://github.com/odin-lang/Odin/releases/download/dev-${_pkgver}/odin-ubuntu-amd64-dev-${_pkgver}.zip")
sha256sums=('f4a8fac2f49eb6e8e784257950c88db34a681a2149644441b145c3b502b64a2f')
sha256sums_x86_64=('6ad91e2659c7221f72c081cdbc4fbd9c6fb853c912ddc1b63f1ade46c67fb5c1')

build() {
  cd "${srcdir}/ubuntu_artifacts"
  patchelf --replace-needed libLLVM-11.so.1 libLLVM-11.so odin
}

package() {
  cd "${srcdir}/ubuntu_artifacts/"

  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/lib/odin"

  chmod +x odin
  cp odin "${pkgdir}/usr/lib/odin/odin"
  cp -r core "${pkgdir}/usr/lib/odin/core"

  ln -s "/usr/lib/odin/odin" "${pkgdir}/usr/bin/odin"

  install -Dm644 "${srcdir}/Odin-dev-${_pkgver}/README.md" "${pkgdir}/usr/share/doc/odin/README.md"
  install -Dm644 "${srcdir}/Odin-dev-${_pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cp -r "${srcdir}/Odin-dev-${_pkgver}/examples" "${pkgdir}/usr/share/doc/odin/examples"
  cp -r "${srcdir}/Odin-dev-${_pkgver}/vendor" "${pkgdir}/usr/lib/odin/vendor"
}
