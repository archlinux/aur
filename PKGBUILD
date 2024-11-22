# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="Viper4Linux-GUI"
_pkgname="${_name,,}"
pkgname="${_pkgname}-bin"
pkgver=2.2
pkgrel=1
pkgdesc="Official UI for Viper4Linux"
arch=('x86_64')
url="https://github.com/Audio4Linux/${_name}"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'gst-plugins-bad-libs' 'gstreamer' 'mesa'
         'qt5-base' 'qt5-multimedia' 'qt5-svg' 'viper4linux')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${url}/raw/refs/tags/${pkgver}/README.md"
        "LICENSE-${pkgver}::${url}/raw/refs/tags/${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64.deb::https://raw.githubusercontent.com/timschneeb/PPA-Repository/57cab600c37e16d7441747034e03c1058f7779e9/${_pkgname}_${pkgver}-43.deb")
noextract=("${_pkgsrc}-x86_64.deb")
sha256sums=('1486917f2584f3e94df0fec725b16515e1974f6699266d30e4a2a737bfcb0039'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('dbe29f9cfc0b59eb74b7351c0c9ed163952e39c36343b4dce8bd714f466d48ae')

prepare() {
  cd "${srcdir}"
  mkdir -p "${_pkgsrc}-${CARCH}"
  bsdtar -xf "${_pkgsrc}-${CARCH}.deb" data.tar.*
  bsdtar -xvzf data.tar.* --strip-components 1 -C "${srcdir}/${_pkgsrc}-${CARCH}"
  rm -f data.tar.*
}

package() {
  cd "${srcdir}"
  install -vDm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "${_pkgsrc}-${CARCH}"
  find "usr/bin"   -type f -exec install -vDm755 "{}" "${pkgdir}/{}" \;
  find "usr/share" -type f -exec install -vDm644 "{}" "${pkgdir}/{}" \;
}
