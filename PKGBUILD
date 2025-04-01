# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Jelle van der Waa <jelle@archlinux.org

pkgname="libnest2d"
_commit_rel="85d66c7a3b89cbd1eba61251b135d968b92bedd9" # 0.4
_commit="663daa69e1d7478669f714218e27681edbc96640" # r61
pkgver="0.4+r61+g${_commit::7}"
pkgrel=2
pkgdesc="2D irregular bin packaging and nesting library written in modern C++"
arch=('x86_64')
url="https://github.com/tamasmeszaros/${pkgname}"
license=('LGPL-3.0-only')
depends=('gcc-libs' 'glibc' 'nlopt' 'polyclipping')
makedepends=('boost>=1.58' 'cmake>=3.1')
provides=("${pkgname}_clipper_nlopt.so")
_pkgsrc="${pkgname}-${_commit}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${_commit}.tar.gz"
        "${pkgname}_allow_disallowed_area.patch::${url}/pull/18.patch?full_index=1")
b2sums=('84423e658d0afd24036b45378baef5270e947939e5186e57cbf1c513a6c7629462291ce8707cba5fb0ee9e246301c17673cc1867e10ac3de888a775863fb2ae4'
        'f6b7cb5dac0e8073461dac71a156e6441fd7844cbd5b867713eb1422cf4c4d7b92f18bc1b81c49520ef0d45390de8e346ab9fee1081fb1ca9be87da6020896ed')

build() {
  local cmake_options=(
    -G 'Unix Makefiles'
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -Wno-dev
    -DCMAKE_BUILD_TYPE:STRING='None'
    -DCMAKE_INSTALL_PREFIX:PATH='/usr'
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
    -DLIBNEST2D_BUILD_UNITTESTS=OFF
    -DBUILD_SHARED_LIBS=ON
    -DLIBNEST2D_HEADER_ONLY=OFF
  )

  cd "${srcdir}"
  cmake "${cmake_options[@]}"
  cmake --build "${_pkgsrc}/build"
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${_pkgsrc}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}