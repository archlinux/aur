# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=spc2it
pkgver=0.4.0
pkgrel=1
pkgdesc='Convert SPC files to IT (Impulse Tracker) files'
arch=('any')
url='https://github.com/uyjulian/spc2it'
license=('unknown')
makedepends=('meson')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/uyjulian/spc2it/archive/v${pkgver}.tar.gz"
  'fix-meson-build.patch'
)

sha512sums=(
  'cedf6e26a419933bc371bfec33193eed5d571fc8a1cfc627754c82ef87e9f6d23656ad4b4e5750e281ed0f7e8c3346d46b315cf24f1959dc5543821fec669564'
  'b51f42bb26645828dba7189b9ff39c11737bc2fa19e1f5fa337e0045d8f0c42b2c6d0125f0f7a8d53d42270c360bb2b637e2c8ebc83ab91ab3c5dddf8ac09fe7'
)

prepare() {
  # Work around a missing `install` property in `meson.build`
  patch -p1 -d "${pkgname}-${pkgver}" < "${srcdir}/fix-meson-build.patch"
}

build() {
  meson --prefix=/usr --buildtype=plain "${pkgname}-${pkgver}" build
  meson compile -C build
}

package() {
  echo >&2 'Packaging the SNEeSe license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    "${srcdir}/${pkgname}-${pkgver}/doc/LICENSE_SNEESE"

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    "${srcdir}/${pkgname}-${pkgver}/readme.md" \
    "${srcdir}/${pkgname}-${pkgver}/doc"/Readme.* \
    "${srcdir}/${pkgname}-${pkgver}/doc"/*.TXT

  echo >&2 'Packaging the executable'
  meson install -C build --destdir "${pkgdir}"
}
