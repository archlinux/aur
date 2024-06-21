# Maintainer: Christopher Kaster <me@atomicptr.de>
# Contributor: Hanna Rose <imhxnna@gmail.com>

pkgver=2024_06

_srcname=odin
pkgname=odin-bin
pkgver_fixed=${pkgver//_/-}
pkgrel=1
pkgdesc="A fast, concise, readable, pragmatic and open sourced programming language."
arch=("x86_64")
url="https://odin-lang.org/"
license=("BSD-2-Clause")
depends=("clang" "llvm-libs" "libedit")
makedepends=("unzip" "patchelf")
provides=("odin")
conflicts=("odin" "odin-git")
options=("staticlibs")

source=(
  "https://github.com/odin-lang/Odin/releases/download/dev-$pkgver_fixed/odin-ubuntu-amd64-dev-$pkgver_fixed.zip"
)
sha256sums=(
  "2e183a4d58ec22b3906f30264def857447e2ef5dc6759883fa60f9258ddb6155"
)

build() {
  cd "${srcdir}/dist"
  patchelf --replace-needed libedit.so.2 libedit.so.0 libLLVM-17.so.1
  chmod +x odin
}

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/lib/${_srcname}"

  cd "${srcdir}/dist/"

  cp odin "${pkgdir}/usr/lib/${_srcname}/odin"
  cp libLLVM-17.so.1 "${pkgdir}/usr/lib/${_srcname}/libLLVM-17.so.1"
  cp -r -a base "${pkgdir}/usr/lib/${_srcname}/base"
  cp -r -a core "${pkgdir}/usr/lib/${_srcname}/core"
  cp -r -a shared "${pkgdir}/usr/lib/${_srcname}/shared"
  cp -r -a vendor "${pkgdir}/usr/lib/${_srcname}/vendor"

  ln -s "/usr/lib/${_srcname}/odin" "${pkgdir}/usr/bin/odin"

  curl -o README.md "https://raw.githubusercontent.com/odin-lang/Odin/master/README.md"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${_srcname}/README.md"
  curl -o LICENSE "https://raw.githubusercontent.com/odin-lang/Odin/master/LICENSE"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_srcname}/LICENSE"
}

check() {
  cd "${srcdir}/dist"
  ODIN_ROOT="${srcdir}/dist" ./odin check examples/all -strict-style
}
