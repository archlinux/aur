# Maintainer: Michael Hansen <zrax0111 gmail com>
# Contributor: Anthony Danilov <frimen.c at gmail>
# Contributor: Ondrej Patrovic <ondrej@patrovic.com>

pkgname=010editor
pkgver=12.0

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
sha256sums_i686=('890e5a234ef6eaf0f1897e541b8ad7cc286c4064e1f2f8b05d6896de755fd211')
sha256sums_x86_64=('7bb33047ea52e9a8a53a30864c8d71a90135b3e18dfa7db63db6d89ceecd8bf9')

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
