# Maintainer: FabioLolix
# Maintainer: Hanna Rose <imhxnna@gmail.com>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=odin-dev-bin
_pkgver=2021-10
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
source=("odin-README.md::https://raw.githubusercontent.com/odin-lang/Odin/master/README.md"
        "odin-LICENSE::https://raw.githubusercontent.com/odin-lang/Odin/master/LICENSE")
source_x86_64=("https://github.com/odin-lang/Odin/releases/download/dev-${_pkgver}/odin-ubuntu-amd64-dev-${_pkgver}.zip")
sha256sums=('0fab1c605ebcddc419093467638fbd1cb9e5c94ddd45c1ca82b00d01e0f32af4'
            '0fa907661c7d478e442b10d4d47e34018466bff4df4bd14be1ef351fbe1ed1e0')
sha256sums_x86_64=('28b7ac480b823efadb13488c3805f8ce079107a253748322ab81bd3b7091d88a')

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

  install -Dm644 ../odin-README.md "${pkgdir}/usr/share/doc/odin/README.md"
  install -Dm644 ../odin-LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
