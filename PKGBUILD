# Maintainer: Giulio Lettieri <giulio.lettieri@gmail.com>

pkgname=lpm
_gitname=lite-xl-plugin-manager
pkgver=1.2.8
pkgrel=1
pkgdesc='A lite-xl plugin manager.'
arch=('x86_64' 'aarch64')
url="https://github.com/lite-xl/lite-xl-plugin-manager"
license=('MIT')
depends=('lua' 'zlib' 'libzip' 'libgit2' 'mbedtls2')
makedepends=('meson')
source=("${_gitname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2a8264d2fd3b3b5d1ef8d0321ebece257c2102493b00c1dca5660630bf48a755')


build() {
  cd "${_gitname}-${pkgver}"
  export CFLAGS+=" -DLPM_VERSION='\"${pkgver}\"' -DLPM_DEFAULT_RELEASE='' -I/usr/include/mbedtls2"
  export LDFLAGS+=" -L/usr/lib/mbedtls2"
  arch-meson -Dstatic=true . build
  meson compile -C build
}

package() {
  install -D "${srcdir}/${_gitname}-${pkgver}/build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -D -t "${pkgdir}/usr/share/licenses/lpm/" "${srcdir}/${_gitname}-${pkgver}/LICENSE"
  install -D -t "${pkgdir}/usr/share/doc/lpm/" "${srcdir}/${_gitname}-${pkgver}/"{README,SPEC}.md
}
