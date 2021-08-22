# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_srcname=odin

pkgname=odin-bin
pkgver=2021
pkgrel=08
pkgdesc="A fast, concise, readable, pragmatic and open sourced programming language."
arch=('x86_64')
url="https://odin-lang.org/"
license=('BSD-2-Clause')
depends=('llvm11-libs')
makedepends=('patchelf')
provides=('odin')
conflicts=('odin')
options=('!strip')

source=(
  "https://github.com/odin-lang/Odin/releases/download/dev-2021-08/odin-ubuntu-amd64-dev-2021-08.zip"
)
sha256sums=(
  '6413900482bc4dcc1edc330462da62434dcca7e775994920c10f8280ad14b211'
)

build() {
  cd "${srcdir}/ubuntu_artifacts"
  patchelf --replace-needed libLLVM-11.so.1 libLLVM-11.so odin
  chmod +x odin
}

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/lib/${_srcname}"

  cd "${srcdir}/ubuntu_artifacts/"

  cp odin "${pkgdir}/usr/lib/${_srcname}/odin"
  cp -r core "${pkgdir}/usr/lib/${_srcname}/core"

  ln -s "/usr/lib/${_srcname}/odin" "${pkgdir}/usr/bin/odin"

  curl -o README.md "https://raw.githubusercontent.com/odin-lang/Odin/master/README.md"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${_srcname}/README.md"
  curl -o LICENSE "https://raw.githubusercontent.com/odin-lang/Odin/master/LICENSE"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_srcname}/LICENSE"
}
