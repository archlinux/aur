# Maintainer: Christopher Kaster <me@atomicptr.de>
# Contributor: Hanna Rose <imhxnna@gmail.com>

pkgver=2024_09

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
  "https://github.com/odin-lang/Odin/releases/download/dev-$pkgver_fixed/odin-ubuntu-amd64-dev-$pkgver_fixed.zip"
)
sha256sums=(
  "a2e29c1232400d831ef2568c4072c9e9bbaddf85f7f925e0bd777f41d70d1f66"
)

build() {
  # the man can't decide whetever or not to package the dist dir in a zip file so we just check for it now ffs
  if [[ -f "${srcdir}/dist.zip" ]]; then
    unzip "${srcdir}/dist.zip"
  fi
  
  cd "${srcdir}/dist"
  chmod +x odin

  # this time odin forgot to add the SO (maybe intentional?)
  cp /usr/lib/libLLVM-18.so "${srcdir}/dist/libLLVM-18.so.18.1"

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
