# Maintainer: Vincent Davis <vdavis2495@gmail.com>
# Contributor: Vincent Davis <vdavis2495@gmail.com>
pkgname='lucurious-git'
pkgver=0.0.2
pkgrel=1
license=('MIT')
pkgdesc='[Library] for building advanced DRM Vulkan Renderers'
url='https://github.com/EasyIP2023/lucurious'
arch=('x86_64')
provides=("lucurious=${pkgver%%.r*}")
conflicts=('lucurious')

# Added mesa for libgbm.so implementation
depends=('shaderc' 'vulkan-driver' 'vulkan-icd-loader' 'cglm' 'libdrm' 'libinput' 'mesa')
makedepends=('meson' 'ninja' 'git' 'vulkan-headers')
source=("${pkgname}::git+${url}")
sha512sums=('SKIP')

pkgver () {
  cd "${pkgname}"
  (
    set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build () {
  cd "${pkgname}"
  rm -rf build
  meson --warnlevel=0 build
  ninja -C build
}

package () {
  cd "${pkgname}"
  DESTDIR="${pkgdir}" ninja -C build install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
