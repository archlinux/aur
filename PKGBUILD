# Maintainer: Michael Hansen <zrax0111 gmail com>
# Contributor: Anthony Danilov <frimen.c at gmail>
# Contributor: Ondrej Patrovic <ondrej@patrovic.com>

pkgname=010editor
pkgver=12.0.1

pkgrel=1
pkgdesc="Professional text and hex editing with Binary Templates technology"
arch=('i686' 'x86_64')
url="https://www.sweetscape.com/010editor/"
license=('custom')
depends=('libpng')
makedepends=('fakechroot')

source=('010editor.desktop')
source_i686=(https://download.sweetscape.com/010EditorLinux32Installer$pkgver.tar.gz)
source_x86_64=(https://download.sweetscape.com/010EditorLinux64Installer$pkgver.tar.gz)
sha256sums=('e3398b117934840828a96cd33534fc9b9242ec96089c2f283add137975499766')
sha256sums_i686=('b4d60a35649890df19dae021652ee96cb726b34b8b55f916fb9bb7d9121944a9')
sha256sums_x86_64=('f0bb4a37f41c75184b30cb76c3810334993eebb6bc3764adc548c61a7cc7c852')

package() {
  cd "${srcdir}"

  _source=source_${CARCH}
  _filename=${!_source##*/}
  _installer=${_filename%%$pkgver*}

  install -dm 755 "${pkgdir}/opt"

  mkdir "${pkgname}-${pkgver}"
  ln -s {/etc,/tmp} "${_}/"
  ln -s "${pkgdir}/opt" "${_}/"
  ln -s "${srcdir}/${_installer}" "${_}/"

  fakechroot -s chroot "${_}" \
    ./${_installer} --mode silent --prefix "/opt/${pkgname}"

  # Clean up unnecessary items (assitant is part of qt5-tools)
  rm -r "${pkgdir}/opt/${pkgname}/"{'assistant','uninstall'}

  install -dm 755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/010editor" "${_}/010editor"

  install -dm 755 "${pkgdir}/usr/share/pixmaps"
  ln -s "/opt/${pkgname}/010_icon_128x128.png" "${_}/010editor.png"

  install -dm 755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/opt/${pkgname}/license.txt" "${_}/license.txt"

  install -Dm 644 '010editor.desktop' "${pkgdir}/usr/share/applications/010editor.desktop"
}
