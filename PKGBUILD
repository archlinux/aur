#!/hint/bash
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

# Configuration
# shellcheck disable=SC2015
((DISABLE_OPENCL)) && {
  CMAKE_FLAGS+=("-DLUXRAYS_DISABLE_OPENCL=ON")
} || {
  depends+=(opencl-icd-loader)
  makedepends+=(opencl-headers)
  optdepends+=("opencl-driver: for gpu acceleration")
}
# shellcheck disable=SC2015
((DISABLE_CUDA||DISABLE_OPENCL)) && {
  CMAKE_FLAGS+=("-DLUXRAYS_DISABLE_CUDA=ON")
} || {
  makedepends+=(cuda-sdk)
}

pkgname=luxcorerender
pkgver=2.10.1
_rel=""
[ -n "${_rel}" ] && _pkgver=${pkgver}${_rel} && pkgver+=".${_rel}" || _pkgver=${pkgver}
_commit=e030b7ba13ba497c4407276c718d84347ab12569
_name=LuxCore-${_commit}
pkgrel=1
epoch=2
pkgdesc="Physically correct, unbiased rendering engine."
arch=('x86_64')
url="https://www.luxcorerender.org/"
license=('Apache-2.0')
depends+=(
  "libglvnd"
  "libxcb"
  "libfontenc"
  "libice"
  "libsm"
  "libxaw"
  "libxdamage"
  "libxcomposite"
  "libxcursor"
  "libxtst"
  "libxinerama"
  "libxkbfile"
  "libxrandr"
  "libxres"
  "libxss"
  "libxv"
  "xcb-util-wm"
  "xcb-util-image"
  "xcb-util-keysyms"
  "xcb-util-renderutil"
  "xcb-util-cursor"
  "gcc-libs"
  "glibc"
)
makedepends+=(cmake python-pipx ninja)
source=(
  "https://github.com/LuxCoreRender/LuxCore/archive/${_commit}.tar.gz"
  luxcoreconsole_wrap.sh
  luxcoreui_wrap.sh
)
sha256sums=('8789cefb2555067e9c1cc4177718439b4575e1b3a85e33c197731e51cd597b65'
            'b9ecff89a10e1948e20170c5e2ee7fed1c2597c2e1e5a40c55874384d17384e9'
            '2d597631c7e6637ed056d2e6d2a0bc8447d00fb49410a8ed6047eff433570815')
b2sums=('3873ca2dd9cadef24e04d8288341e4efabb45135fa798bd37872484a2783280f08e5433d5f09d35656f150a5be69d67555924281d5b268a72bf7ae733f07bac3'
        '12e2c5bd9472389cda1d484e0c84a65c83447599dfc8f426f5d64db025ea17b18f352a93115141f73d465c0953052a4d4afa16aff82667716150f1047ead394f'
        '612ded329cd2978d99e071bd48c68aea0d98db9c61f2005465a2bf7a1690c7ff514c23439223706181810c40b820299ddd64fc3042bb1aca7848dd315e9acf13')


build() {
  pipx install conan
  pipx ensurepath
  source ~/.bashrc

  export LUX_BUILD_TYPE=Release
  export LUXCORE_VERSION=${pkgver}
  cd ${srcdir}/${_name}
  make deps
  make luxcore
  export LD_LIBRARY_PATH=${srcdir}/${_name}/out/install/Release/lib:$LD_LIBRARY_PATH
  make luxcoreui
  make luxcoreconsole
}

package() {
  cd "${srcdir}"/"${_name}"/out/install/Release

  # Main app
  install -d -m755 "${pkgdir}"/usr/lib/luxcorerender/{bin,lib}
  install -m755 bin/* "${pkgdir}"/usr/lib/luxcorerender/bin
  install -m644 lib/* "${pkgdir}"/usr/lib/luxcorerender/lib

  # Wrapper scripts
  install -D -m755 "${srcdir}"/luxcoreconsole_wrap.sh -T "${pkgdir}/usr/bin/luxcoreconsole"
  install -D -m755 "${srcdir}"/luxcoreui_wrap.sh -T "${pkgdir}/usr/bin/luxcoreui"
}
# vim:set ts=2 sw=2 et:
