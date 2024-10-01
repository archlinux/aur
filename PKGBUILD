# Maintainer: Christopher Kaster <me@atomicptr.de>
# Contributor: Hanna Rose <imhxnna@gmail.com>

pkgver=2024_10

_srcname=odin
pkgname=odin-bin
pkgver_fixed=${pkgver//_/-}
pkgrel=1
pkgdesc="A fast, concise, readable, pragmatic and open sourced programming language."
arch=("x86_64")
url="https://odin-lang.org/"
license=("BSD-2-Clause")
depends=("clang" "libedit" "llvm-libs")
makedepends=("unzip" "make")
provides=("odin")
conflicts=("odin" "odin-git")
options=("staticlibs")

source=(
  "https://github.com/odin-lang/Odin/releases/download/dev-$pkgver_fixed/odin-linux-amd64-dev-$pkgver_fixed.zip"
)
sha256sums=(
  "785dcae8bc51dc7a10d2373d5ce8b308fcbde7d4f37668f2be60951c8b56e6b5"
)

build() {
  cd "${srcdir}/odin-linux-amd64-dev-${pkgver_fixed}/"
  chmod +x odin

  # this time odin forgot to add the SO (maybe intentional?)
  cp /usr/lib/libLLVM-18.so "${srcdir}/odin-linux-amd64-dev-${pkgver_fixed}/libLLVM-18.so.18.1"

  # build libs
  cd "${srcdir}/odin-linux-amd64-dev-${pkgver_fixed}/vendor/cgltf/src" && make
  cd "${srcdir}/odin-linux-amd64-dev-${pkgver_fixed}/vendor/miniaudio/src" && make
  cd "${srcdir}/odin-linux-amd64-dev-${pkgver_fixed}/vendor/stb/src" && make
}

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/lib/${_srcname}"

  cd "${srcdir}/odin-linux-amd64-dev-${pkgver_fixed}/"

  cp odin "${pkgdir}/usr/lib/${_srcname}/odin"
  cp libLLVM-18.so.18.1 "${pkgdir}/usr/lib/${_srcname}/libLLVM-18.so.18.1"
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
  cd "${srcdir}/odin-linux-amd64-dev-${pkgver_fixed}"
  ODIN_ROOT="${srcdir}/odin-linux-amd64-dev-${pkgver_fixed}" ./odin check examples/all -strict-style
}

# Building this package in a clean docker env:
#    docker run --rm -it -v "$(pwd):/pkg" zaggash/arch-makepkg

# Update .SRCINFO
#    docker run --rm -it --entrypoint="" -v "$(pwd):/pkg" zaggash/arch-makepkg makepkg --printsrcinfo > .SRCINFO
