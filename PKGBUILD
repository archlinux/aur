# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="git-tui"
pkgver=1.3.0
pkgrel=2
pkgdesc="Collection of human friendly terminal interface for git"
arch=('x86_64')
url="https://github.com/ArthurSonzogni/${pkgname}"
license=('MIT')
depends=('gcc-libs' 'git' 'glibc')
makedepends=('cmake>=3.15' 'ftxui' 'ninja')
_pkgsrc="${pkgname}-${pkgver}"
source=(
  "${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
  'git+https://github.com/benman64/subprocess.git#commit=e1cae5e86e5d089e65e906f7c13917b7bbb75d04'
)
sha256sums=('f8e90d41f4f016916fbcbf07dba779faf3ba281cc9fe216a6176a7b60afcd9d2'
            'd8bc12b63d4e0f573385c41ae5b4a25642bdacb1d5481ebc80dc0e409bddc1ee')

build() {
  cmake -G 'Ninja' -B 'subprocess-build' -S 'subprocess' -DCMAKE_BUILD_TYPE='None' -DCMAKE_INSTALL_PREFIX="${srcdir}/prefix"
  cmake --build 'subprocess-build'
  cmake --install 'subprocess-build'

  local cmake_options=(
    -G 'Ninja' \
    -B 'build' \
    -S "${_pkgsrc}" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_PREFIX_PATH="${srcdir}/prefix" \
    -Wno-dev
  )

  cmake "${cmake_options[@]}"
  cmake --build 'build'
}

package() {
  DESTDIR="${pkgdir}" cmake --install 'build'

  cd "${_pkgsrc}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
