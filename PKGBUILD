# Maintainer: Christopher Kaster <me@atomicptr.de>
# Contributor: Hanna Rose <imhxnna@gmail.com>

# If you read this and intend to maintain this keep in mind that the Odin release process
# is an utter mess and you will have to update this script almost every release

# How to update this:
#     0. Change the pkgver var below
#     1. Download the release
#     2. get a sha256sum of it, replace the current "sha256sums" with the new one
#     3. unzip the release, maybe there will be a dist.zip or dist.tar.gz in there, maybe not
#     4. check what the directory is named and adjust if necessary (odin_download_dir var)
#     5. Run the following Docker command:
#          docker run --rm -it -v "$(pwd):/pkg" zaggash/arch-makepkg
#     6. if it runs through correctly, update the .SRCINFO using this:
#          docker run --rm -it --entrypoint="" -v "$(pwd):/pkg" zaggash/arch-makepkg makepkg --printsrcinfo > .SRCINFO

pkgver=2024_11
odin_download_dir="odin-linux-amd64-nightly+2024-11-04"

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
  "fcc412473ab94f15999c8f6f84d88dc1b47b1e9f3b94c27e6eaf4ff9ae671a3d"
)

build() {
  if [[ -f "dist.zip" ]]; then
    unzip dist.zip
  fi

  if [[ -f "dist.tar.gz" ]]; then
    tar xvf dist.tar.gz
  fi

  cd "${srcdir}/${odin_download_dir}/"
  chmod +x odin

  cp /usr/lib/libLLVM-18.so "${srcdir}/${odin_download_dir}/libLLVM-18.so.18.1"

  # build libs
  cd "${srcdir}/${odin_download_dir}/vendor/cgltf/src" && make
  cd "${srcdir}/${odin_download_dir}/vendor/miniaudio/src" && make
  cd "${srcdir}/${odin_download_dir}/vendor/stb/src" && make
}

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/lib/${_srcname}"

  cd "${srcdir}/${odin_download_dir}/"

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
  cd "${srcdir}/${odin_download_dir}"
  ODIN_ROOT="${srcdir}/${odin_download_dir}" ./odin check examples/all -strict-style
}
