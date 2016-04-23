# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=spirv-tools-git
pkgver=r520.9166854
pkgrel=1
pkgdesc='API and commands for processing SPIR-V modules'
url='https://github.com/KhronosGroup/SPIRV-Tools'
arch=('i686' 'x86_64')
license=('MIT')
source=('git+https://github.com/KhronosGroup/SPIRV-Tools')
sha1sums=('SKIP')
makedepends=('cmake')
options=('staticlibs')
conflicts=('spirv-tools')
provides=('spirv-tools')

pkgver() {
  cd "${srcdir}"/SPIRV-Tools
  printf "r%d.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}"/SPIRV-Tools
  cmake -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "${srcdir}"/SPIRV-Tools

  # Tools
  pushd tools
  install -dm755                   "${pkgdir}"/usr/bin/
  install -m755 spirv-{as,dis,val} "${pkgdir}"/usr/bin/
  popd

  # Library
  pushd source
  install -dm755                 "${pkgdir}"/usr/lib/
  install -m644 libSPIRV-Tools.a "${pkgdir}"/usr/lib/
  popd

  # License
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
