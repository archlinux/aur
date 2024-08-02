# Maintainer: Christopher Kaster <me@atomicptr.de>
# Contributor: Hanna Rose <imhxnna@gmail.com>

pkgver=2024_08

_srcname=odin
pkgname=odin-bin
pkgver_fixed=${pkgver//_/-}
pkgrel=1
pkgdesc="A fast, concise, readable, pragmatic and open sourced programming language."
arch=("x86_64")
url="https://odin-lang.org/"
license=("BSD-2-Clause")
depends=("clang" "libedit")
makedepends=("unzip" "patchelf" "make")
provides=("odin")
conflicts=("odin" "odin-git")
options=("staticlibs")

source=(
  "https://github.com/odin-lang/Odin/releases/download/dev-$pkgver_fixed/odin-ubuntu-amd64-dev-$pkgver_fixed.zip"
)
sha256sums=(
  "542af04240c5702a1b42e0c43fda1ca44c2d73e93b599f9d924b1d28d44eb81a"
)

build() {
  cd "${srcdir}/dist"
  patchelf --replace-needed libedit.so.2 libedit.so.0 libLLVM-18.so.1
  chmod +x odin

  # Eventually they will publish a version without a minor mistake
  mv libLLVM-18.so.1 libLLVM-18.so.18.1

  # build libs
  cd "${srcdir}/dist/vendor/cgltf/src" && make
  cd "${srcdir}/dist/vendor/miniaudio/src" && make
  cd "${srcdir}/dist/vendor/stb/src" && make
}

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/lib/${_srcname}"

  cd "${srcdir}/dist/"

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
  cd "${srcdir}/dist"
  ODIN_ROOT="${srcdir}/dist" ./odin check examples/all -strict-style
}

# Building this package in a clean docker env:
#    docker run --rm -it -v "$(pwd):/pkg" zaggash/arch-makepkg

# Update .SRCINFO
#    docker run --rm -it --entrypoint="" -v "$(pwd):/pkg" zaggash/arch-makepkg makepkg --printsrcinfo > .SRCINFO
