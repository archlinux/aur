# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="LaiNES"
pkgname="${_Name,,}"
_commit="b56dac7482abb2ee633787d152a77b10be741e41" # r124
pkgver="r124+g${_commit::7}"
pkgrel=2
pkgdesc="Cycle-accurate NES emulator in ~1000 lines of code"
arch=(
  'x86_64'
)
url="https://github.com/AndreaOrru/${_Name}"
license=(
  'BSD-2-Clause'
)
depends=(
  'glibc'
  'libgcc'
  'libstdc++'
  'sdl2'
  'sdl2_image'
  'sdl2_ttf'
)
makedepends=(
  'clang'
  'gendesk'
  # 'scons'
  'simpleini'
)
_pkgsrc="${url##*/}-${_commit}"
source=(
  "${url}/archive/${_commit}/${_pkgsrc}.tar.gz"
  "${pkgname}_bugfix.patch::${url}/pull/44.patch?full_index=1"
  "${pkgname}_fhs_res_path.patch"
)
b2sums=('027c16c5c9852af9c3c9b5bbf408b3d75479e39d3f8ded5fbf867661495a812571aa1cf9e809d6a8575af3ae113dc0ffb65ea6e37f9724923e632e09bc60e764'
        'd18ca6d11607a1c9b48d28ab7c451b08ef80d20f4933580f989119c93c65eee6798aeff3b89648c7271e36b2c8a46320911ce97a0aadf011fae3251ceeaeb067'
        'c5671fc4cec97e51d273c9453b624087892dae94d10c0aa0eb4a97b2ee53ee3611faed01b5f226d3ea803316d50f01ae6be54fec41745edb2d7fe9732c06f545')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${pkgname}_bugfix.patch"
  patch -Np1 -i "${srcdir}/${pkgname}_fhs_res_path.patch"
}

build() {
  cd "${srcdir}"
  gendesk -f -n \
    --pkgname "${pkgname}" \
    --pkgdesc "${pkgdesc}" \
    --name "${_Name}" \
    --categories "Game;Emulator"

  cd "${_pkgsrc}"
  # scons

  _sources=$(find src lib -type f -name '*.cpp')
  clang++ ${CXXFLAGS} -std=c++14 -I /usr/include/SimpleIni -I lib/include -I src/include ${_sources} ${LDFLAGS} -lSDL2 -lSDL2_image -lSDL2_ttf -o "${pkgname}"
}

package() {
  cd "${srcdir}"
  install -vDm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"

  cd "${_pkgsrc}"
  install -vDm755 "${pkgname}" -t "${pkgdir}/usr/bin"
  install -vDm644 "README.md"  -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm644 "LICENSE"    -t "${pkgdir}/usr/share/licenses/${pkgname}"

  install -vDm644 "res/init.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  install -vd "${pkgdir}/usr/share/${pkgname}"
  cp -va --no-preserve=ownership "res" -t "${pkgdir}/usr/share/${pkgname}"
}
